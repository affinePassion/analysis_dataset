# pyspark_solution.py - ИСПРАВЛЕННАЯ ВЕРСИЯ

import os
import sys

# Устанавливаем переменные окружения для PySpark
os.environ['PYSPARK_PYTHON'] = sys.executable
os.environ['PYSPARK_DRIVER_PYTHON'] = sys.executable

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, count, sum, avg, round as spark_round, countDistinct, when
from pyspark.sql.types import IntegerType

# Инициализация SparkSession
spark = SparkSession.builder \
    .appName("UEFA Champions League Analysis") \
    .config("spark.sql.adaptive.enabled", "true") \
    .config("spark.sql.execution.arrow.pyspark.enabled", "false") \
    .getOrCreate()

print("=" * 80)
print("ЗАГРУЗКА ДАННЫХ В PYSPARK")
print("=" * 80)

# Загрузка CSV файлов
df_stadiums = spark.read.csv("stadiums.csv", header=True, inferSchema=True, sep=";")
df_teams = spark.read.csv("teams.csv", header=True, inferSchema=True, sep=";")
df_players = spark.read.csv("players.csv", header=True, inferSchema=True, sep=";")
df_managers = spark.read.csv("managers.csv", header=True, inferSchema=True, sep=";")
df_matches = spark.read.csv("matches.csv", header=True, inferSchema=True, sep=";")
df_goals = spark.read.csv("goals.csv", header=True, inferSchema=True, sep=";")

print(f"Загружено записей:")
print(f"  stadiums: {df_stadiums.count()}")
print(f"  teams: {df_teams.count()}")
print(f"  players: {df_players.count()}")
print(f"  managers: {df_managers.count()}")
print(f"  matches: {df_matches.count()}")
print(f"  goals: {df_goals.count()}")

print("\n" + "=" * 80)
print("ЗАПРОС 1: Суммарная посещаемость матчей для каждой команды на домашнем стадионе")
print("=" * 80)

query1 = df_matches \
    .join(df_teams, df_matches.HOME_TEAM == df_teams.TEAM_NAME) \
    .filter(col("ATTENDANCE") > 0) \
    .groupBy(df_teams.TEAM_NAME) \
    .agg(
        count("MATCH_ID").alias("HOME_MATCHES"),
        sum("ATTENDANCE").alias("TOTAL_ATTENDANCE"),
        spark_round(avg("ATTENDANCE"), 0).cast(IntegerType()).alias("AVG_ATTENDANCE")
    ) \
    .orderBy(col("TOTAL_ATTENDANCE").desc()) \
    .limit(10)

query1.show(truncate=False)

print("\n" + "=" * 80)
print("ЗАПРОС 2: Топ-10 бомбардиров турнира")
print("=" * 80)

query2 = df_goals \
    .join(df_players, df_goals.PID == df_players.PLAYER_ID) \
    .join(df_teams, df_players.TEAM == df_teams.TEAM_NAME) \
    .groupBy(
        df_players.PLAYER_ID,
        df_players.FIRST_NAME,
        df_players.LAST_NAME,
        df_teams.TEAM_NAME,
        df_players.NATIONALITY
    ) \
    .agg(count("GOAL_ID").alias("TOTAL_GOALS")) \
    .orderBy(col("TOTAL_GOALS").desc()) \
    .limit(10)

query2.select("FIRST_NAME", "LAST_NAME", "TEAM_NAME", "NATIONALITY", "TOTAL_GOALS").show(truncate=False)

print("\n" + "=" * 80)
print("ЗАПРОС 3: Данные по Роберту Левандовски")
print("=" * 80)

query3 = df_players.alias("p") \
    .join(df_goals.alias("g"), col("p.PLAYER_ID") == col("g.PID"), "left") \
    .join(df_matches.alias("m"), col("g.MATCH_ID") == col("m.MATCH_ID"), "left") \
    .join(df_teams.alias("t"), col("p.TEAM") == col("t.TEAM_NAME")) \
    .filter((col("p.FIRST_NAME") == "Robert") & (col("p.LAST_NAME") == "Lewandowski")) \
    .groupBy(
        "p.PLAYER_ID",
        "p.FIRST_NAME",
        "p.LAST_NAME",
        "t.TEAM_NAME",
        "p.NATIONALITY",
        "p.POSITION",
        "p.HEIGHT",
        "p.WEIGHT"
    ) \
    .agg(
        countDistinct("g.GOAL_ID").alias("TOTAL_GOALS"),
        countDistinct("m.MATCH_ID").alias("MATCHES_PLAYED")
    )

query3.show(truncate=False)

print("\n" + "=" * 80)
print("ЗАПРОС 4: Количество матчей на каждом стадионе")
print("=" * 80)

# ИСПРАВЛЕНО: Используем JOIN без UDF
# Создаем временное представление для стадионов с уникальным идентификатором
df_stadiums_unique = df_stadiums \
    .withColumn("STADIUM_KEY", col("NAME")) \
    .select("NAME", "CITY", "COUNTRY", "CAPACITY")

# Для матчей находим соответствующий город через JOIN
df_matches_with_city = df_matches.alias("m") \
    .join(df_stadiums.alias("s"), 
          col("m.STADIUM") == col("s.NAME"), 
          "left") \
    .select(
        col("m.MATCH_ID"),
        col("m.STADIUM"),
        col("s.CITY").alias("STADIUM_CITY")
    ).distinct()

# Теперь считаем матчи, группируя по стадиону и городу
query4 = df_stadiums.alias("s") \
    .join(df_matches_with_city.alias("m"), 
          (col("s.NAME") == col("m.STADIUM")) & (col("s.CITY") == col("m.STADIUM_CITY")), 
          "left") \
    .groupBy("s.NAME", "s.CITY", "s.COUNTRY", "s.CAPACITY") \
    .agg(count("m.MATCH_ID").alias("NUMBER_OF_MATCHES")) \
    .orderBy(col("NUMBER_OF_MATCHES").desc()) \
    .limit(10)

query4.show(truncate=False)

print("\n" + "=" * 80)
print("ВСЕ ЗАПРОСЫ ВЫПОЛНЕНЫ УСПЕШНО!")
print("=" * 80)

spark.stop()