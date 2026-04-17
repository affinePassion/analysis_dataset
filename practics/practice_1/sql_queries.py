# sql_queries_fixed.py

import psycopg2
import pandas as pd

def execute_queries():
    # Подключение к базе данных
    conn = psycopg2.connect(
        host="povt-cluster.tstu.tver.ru",
        user="mpi",
        password="135a1",
        port="5432",
        database="uefa_champions_league"
    )
    cursor = conn.cursor()
    
    print("=" * 80)
    print("ЗАПРОС 1: Join по двум таблицам с сортировкой и агрегацией")
    print("Суммарная посещаемость матчей для каждой команды на домашнем стадионе")
    print("=" * 80)
    
    query1 = """
    SELECT
        t."TEAM_NAME",
        COUNT(m."MATCH_ID") as HOME_MATCHES,
        SUM(m."ATTENDANCE") as TOTAL_ATTENDANCE,
        ROUND(AVG(m."ATTENDANCE"), 0) as AVG_ATTENDANCE
    FROM
        matches m
    JOIN
        teams t ON m."HOME_TEAM" = t."TEAM_NAME"
    WHERE
        m."ATTENDANCE" > 0
    GROUP BY
        t."TEAM_NAME"
    ORDER BY
        TOTAL_ATTENDANCE DESC
    LIMIT 10;
    """
    
    cursor.execute(query1)
    results = cursor.fetchall()
    df1 = pd.DataFrame(results, columns=['Команда', 'Матчей дома', 'Общая посещаемость', 'Средняя посещаемость'])
    print(df1)
    
    print("\n" + "=" * 80)
    print("ЗАПРОС 2: Join по трем таблицам с сортировкой и агрегацией")
    print("Топ-10 бомбардиров турнира")
    print("=" * 80)
    
    query2 = """
    SELECT
        p."FIRST_NAME",
        p."LAST_NAME",
        t."TEAM_NAME",
        p."NATIONALITY",
        COUNT(g."GOAL_ID") AS TOTAL_GOALS
    FROM
        goals g
    JOIN
        players p ON g."PID" = p."PLAYER_ID"
    JOIN
        teams t ON p."TEAM" = t."TEAM_NAME"
    GROUP BY
        p."PLAYER_ID", p."FIRST_NAME", p."LAST_NAME", t."TEAM_NAME", p."NATIONALITY"
    ORDER BY
        TOTAL_GOALS DESC
    LIMIT 10;
    """
    
    cursor.execute(query2)
    results = cursor.fetchall()
    df2 = pd.DataFrame(results, columns=['Имя', 'Фамилия', 'Команда', 'Национальность', 'Голы'])
    print(df2)
    
    print("\n" + "=" * 80)
    print("ЗАПРОС 3: Данные по одному объекту (Роберт Левандовски)")
    print("=" * 80)
    
    query3 = """
    SELECT
        p."PLAYER_ID",
        p."FIRST_NAME",
        p."LAST_NAME",
        t."TEAM_NAME" AS CURRENT_TEAM,
        p."NATIONALITY",
        p."POSITION",
        p."HEIGHT",
        p."WEIGHT",
        COUNT(DISTINCT g."GOAL_ID") AS TOTAL_GOALS,
        COUNT(DISTINCT m."MATCH_ID") AS MATCHES_PLAYED
    FROM
        players p
    LEFT JOIN goals g ON p."PLAYER_ID" = g."PID"
    LEFT JOIN matches m ON g."MATCH_ID" = m."MATCH_ID"
    JOIN teams t ON p."TEAM" = t."TEAM_NAME"
    WHERE
        p."FIRST_NAME" = 'Robert' AND p."LAST_NAME" = 'Lewandowski'
    GROUP BY
        p."PLAYER_ID", p."FIRST_NAME", p."LAST_NAME", t."TEAM_NAME", 
        p."NATIONALITY", p."POSITION", p."HEIGHT", p."WEIGHT";
    """
    
    cursor.execute(query3)
    results = cursor.fetchall()
    df3 = pd.DataFrame(results, columns=['ID', 'Имя', 'Фамилия', 'Команда', 'Национальность', 
                                          'Позиция', 'Рост', 'Вес', 'Голы', 'Матчей'])
    print(df3)
    
    print("\n" + "=" * 80)
    print("ЗАПРОС 4: Количество строк по совмещенным данным в 2 таблицах")
    print("Количество матчей на каждом стадионе")
    print("=" * 80)
    
    query4 = """
    SELECT
        s."NAME" AS STADIUM_NAME,
        s."CITY",
        s."COUNTRY",
        s."CAPACITY",
        COUNT(m."MATCH_ID") AS NUMBER_OF_MATCHES
    FROM
        stadiums s
    LEFT JOIN
        matches m ON s."NAME" = m."STADIUM" AND s."CITY" = m."STADIUM_CITY"
    GROUP BY
        s."NAME", s."CITY", s."COUNTRY", s."CAPACITY"
    ORDER BY
        NUMBER_OF_MATCHES DESC
    LIMIT 10;
    """
    
    cursor.execute(query4)
    results = cursor.fetchall()
    df4 = pd.DataFrame(results, columns=['Стадион', 'Город', 'Страна', 'Вместимость', 'Матчей'])
    print(df4)
    
    print("\n" + "=" * 80)
    print("ЗАПРОС 5: Среднее количество голов за матч по сезонам")
    print("=" * 80)
    
    query5 = """
    SELECT
        "SEASON",
        COUNT(*) AS MATCHES,
        ROUND(AVG("HOME_TEAM_SCORE" + "AWAY_TEAM_SCORE"), 2) AS AVG_GOALS_PER_MATCH,
        SUM("HOME_TEAM_SCORE" + "AWAY_TEAM_SCORE") AS TOTAL_GOALS
    FROM matches
    GROUP BY "SEASON"
    ORDER BY "SEASON";
    """
    
    cursor.execute(query5)
    results = cursor.fetchall()
    df5 = pd.DataFrame(results, columns=['Сезон', 'Матчей', 'Ср. голов за матч', 'Всего голов'])
    print(df5)
    
    print("\n" + "=" * 80)
    print("ЗАПРОС 6: Команды с лучшей разницей голов дома")
    print("=" * 80)
    
    query6 = """
    SELECT
        "HOME_TEAM",
        COUNT(*) AS HOME_MATCHES,
        SUM("HOME_TEAM_SCORE") AS GOALS_SCORED,
        SUM("AWAY_TEAM_SCORE") AS GOALS_CONCEDED,
        SUM("HOME_TEAM_SCORE") - SUM("AWAY_TEAM_SCORE") AS GOAL_DIFFERENCE
    FROM matches
    GROUP BY "HOME_TEAM"
    HAVING COUNT(*) > 5
    ORDER BY GOAL_DIFFERENCE DESC
    LIMIT 10;
    """
    
    cursor.execute(query6)
    results = cursor.fetchall()
    df6 = pd.DataFrame(results, columns=['Команда', 'Матчей дома', 'Забито', 'Пропущено', 'Разница'])
    print(df6)
    
    print("\n" + "=" * 80)
    print("ЗАПРОС 7: Игроки, забивавшие в разных клубах")
    print("=" * 80)
    
    query7 = """
    WITH player_teams AS (
        SELECT DISTINCT
            p."PLAYER_ID",
            p."FIRST_NAME",
            p."LAST_NAME",
            t."TEAM_NAME"
        FROM players p
        JOIN goals g ON p."PLAYER_ID" = g."PID"
        JOIN teams t ON p."TEAM" = t."TEAM_NAME"
    )
    SELECT
        "FIRST_NAME",
        "LAST_NAME",
        COUNT(DISTINCT "TEAM_NAME") AS TEAMS_COUNT,
        STRING_AGG(DISTINCT "TEAM_NAME", ', ') AS TEAMS_LIST
    FROM player_teams
    GROUP BY "PLAYER_ID", "FIRST_NAME", "LAST_NAME"
    HAVING COUNT(DISTINCT "TEAM_NAME") > 1
    ORDER BY TEAMS_COUNT DESC
    LIMIT 10;
    """
    
    cursor.execute(query7)
    results = cursor.fetchall()
    df7 = pd.DataFrame(results, columns=['Имя', 'Фамилия', 'Кол-во команд', 'Список команд'])
    print(df7)
    
    print("\n" + "=" * 80)
    print("ЗАПРОС 8: Самые результативные матчи")
    print("=" * 80)
    
    query8 = """
    SELECT
        "MATCH_ID",
        "SEASON",
        "HOME_TEAM",
        "AWAY_TEAM",
        "HOME_TEAM_SCORE",
        "AWAY_TEAM_SCORE",
        ("HOME_TEAM_SCORE" + "AWAY_TEAM_SCORE") AS TOTAL_GOALS
    FROM matches
    ORDER BY TOTAL_GOALS DESC, "MATCH_ID"
    LIMIT 10;
    """
    
    cursor.execute(query8)
    results = cursor.fetchall()
    df8 = pd.DataFrame(results, columns=['ID матча', 'Сезон', 'Хозяева', 'Гости', 
                                          'Счет хозяев', 'Счет гостей', 'Всего голов'])
    print(df8)
    
    cursor.close()
    conn.close()
    
    print("\n" + "=" * 80)
    print("ВСЕ ЗАПРОСЫ ВЫПОЛНЕНЫ УСПЕШНО!")
    print("=" * 80)

if __name__ == "__main__":
    execute_queries()