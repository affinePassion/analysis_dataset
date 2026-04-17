# create_champions_league_db_fixed.py

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

def create_database():
    print("Подключение к серверу PostgreSQL...")
    
    conn = psycopg2.connect(
        host="povt-cluster.tstu.tver.ru",
        user="mpi",
        password="135a1",
        port="5432",
        database="postgres"
    )
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cursor = conn.cursor()
    
    db_name = "uefa_champions_league"
    cursor.execute(f"SELECT 1 FROM pg_database WHERE datname='{db_name}'")
    exists = cursor.fetchone()
    
    if exists:
        print(f"База данных '{db_name}' уже существует.")
        cursor.execute(f"""
            SELECT pg_terminate_backend(pg_stat_activity.pid)
            FROM pg_stat_activity
            WHERE pg_stat_activity.datname = '{db_name}'
              AND pid <> pg_backend_pid();
        """)
        cursor.execute(f"DROP DATABASE IF EXISTS {db_name};")
        print("Старая база данных удалена.")
    
    cursor.execute(f"CREATE DATABASE {db_name};")
    print(f"База данных '{db_name}' создана.")
    
    cursor.close()
    conn.close()
    
    print("\nСоздание таблиц в базе данных...")
    
    conn = psycopg2.connect(
        host="povt-cluster.tstu.tver.ru",
        user="mpi",
        password="135a1",
        port="5432",
        database=db_name
    )
    cursor = conn.cursor()
    
    # 1. Таблица stadiums - ИСПРАВЛЕНО: составной первичный ключ
    cursor.execute("""
    CREATE TABLE stadiums (
        "NAME" VARCHAR(100),
        "CITY" VARCHAR(100),
        "COUNTRY" VARCHAR(100),
        "CAPACITY" INTEGER,
        PRIMARY KEY ("NAME", "CITY")
    );
    """)
    print("Таблица 'stadiums' создана с составным первичным ключом (NAME, CITY).")
    
    # 2. Таблица teams - ИСПРАВЛЕНО: внешний ключ ссылается на составной ключ
    cursor.execute("""
    CREATE TABLE teams (
        "TEAM_NAME" VARCHAR(100) PRIMARY KEY,
        "COUNTRY" VARCHAR(100),
        "HOME_STADIUM" VARCHAR(100),
        "STADIUM_CITY" VARCHAR(100),
        FOREIGN KEY ("HOME_STADIUM", "STADIUM_CITY") REFERENCES stadiums("NAME", "CITY")
    );
    """)
    print("Таблица 'teams' создана.")
    
    # 3. Таблица players
    cursor.execute("""
    CREATE TABLE players (
        "PLAYER_ID" VARCHAR(20) PRIMARY KEY,
        "FIRST_NAME" VARCHAR(100),
        "LAST_NAME" VARCHAR(100),
        "NATIONALITY" VARCHAR(100),
        "DOB" TIMESTAMP,
        "TEAM" VARCHAR(100),
        "JERSEY_NUMBER" INTEGER,
        "POSITION" VARCHAR(50),
        "HEIGHT" INTEGER,
        "WEIGHT" INTEGER,
        "FOOT" VARCHAR(5),
        FOREIGN KEY ("TEAM") REFERENCES teams("TEAM_NAME")
    );
    """)
    print("Таблица 'players' создана.")
    
    # 4. Таблица managers
    cursor.execute("""
    CREATE TABLE managers (
        "MANAGER_ID" SERIAL PRIMARY KEY,
        "FIRST_NAME" VARCHAR(100),
        "LAST_NAME" VARCHAR(100),
        "NATIONALITY" VARCHAR(100),
        "DOB" TIMESTAMP,
        "TEAM" VARCHAR(100),
        FOREIGN KEY ("TEAM") REFERENCES teams("TEAM_NAME")
    );
    """)
    print("Таблица 'managers' создана.")
    
    # 5. Таблица matches
    cursor.execute("""
    CREATE TABLE matches (
        "MATCH_ID" VARCHAR(20) PRIMARY KEY,
        "SEASON" VARCHAR(20),
        "DATE_TIME" TIMESTAMP,
        "HOME_TEAM" VARCHAR(100),
        "AWAY_TEAM" VARCHAR(100),
        "STADIUM" VARCHAR(100),
        "STADIUM_CITY" VARCHAR(100),
        "HOME_TEAM_SCORE" INTEGER,
        "AWAY_TEAM_SCORE" INTEGER,
        "PENALTY_SHOOT_OUT" INTEGER,
        "ATTENDANCE" INTEGER,
        FOREIGN KEY ("HOME_TEAM") REFERENCES teams("TEAM_NAME"),
        FOREIGN KEY ("AWAY_TEAM") REFERENCES teams("TEAM_NAME"),
        FOREIGN KEY ("STADIUM", "STADIUM_CITY") REFERENCES stadiums("NAME", "CITY")
    );
    """)
    print("Таблица 'matches' создана.")
    
    # 6. Таблица goals
    cursor.execute("""
    CREATE TABLE goals (
        "GOAL_ID" VARCHAR(20) PRIMARY KEY,
        "MATCH_ID" VARCHAR(20),
        "PID" VARCHAR(20),
        "DURATION" INTEGER,
        "ASSIST" VARCHAR(200),
        "GOAL_DESC" TEXT,
        FOREIGN KEY ("MATCH_ID") REFERENCES matches("MATCH_ID"),
        FOREIGN KEY ("PID") REFERENCES players("PLAYER_ID")
    );
    """)
    print("Таблица 'goals' создана.")
    
    conn.commit()
    print("\nВсе таблицы успешно созданы!")
    
    cursor.close()
    conn.close()
    
    print("\nБаза данных готова к загрузке данных.")

if __name__ == "__main__":
    create_database()