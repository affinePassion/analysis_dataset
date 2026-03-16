import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

def create_database():
    # ПОДКЛЮЧЕНИЕ К СЕРВЕРУ БЕЗ УКАЗАНИЯ БАЗЫ ДАННЫХ
    # Подключаемся к базе 'postgres' (системная база) или другой существующей
    print("Подключение к серверу PostgreSQL...")
    
    conn = psycopg2.connect(
        host="povt-cluster.tstu.tver.ru",
        user="mpi",
        password="135a1",
        port="5432",
        database="postgres"  # Подключаемся к системной базе
    )
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cursor = conn.cursor()
    
    # Проверяем, существует ли база
    cursor.execute("SELECT 1 FROM pg_database WHERE datname='uefa_champions_league_20'")
    exists = cursor.fetchone()
    
    if exists:
        print("База данных 'uefa_champions_league_20' уже существует.")
        
        # Закрываем все активные подключения к базе
        cursor.execute("""
            SELECT pg_terminate_backend(pg_stat_activity.pid)
            FROM pg_stat_activity
            WHERE pg_stat_activity.datname = 'uefa_champions_league_20'
              AND pid <> pg_backend_pid();
        """)
        
        # Удаляем базу
        cursor.execute("DROP DATABASE IF EXISTS uefa_champions_league_20;")
        print("Старая база данных удалена.")
    
    # Создаём новую БД
    cursor.execute("CREATE DATABASE uefa_champions_league_20;")
    print("База данных 'uefa_champions_league_20' создана.")
    
    cursor.close()
    conn.close()
    
    print("\nСоздание таблиц в базе данных...")
    
    # Теперь подключаемся к НОВОЙ базе данных
    conn = psycopg2.connect(
        host="povt-cluster.tstu.tver.ru",
        user="mpi",
        password="135a1",
        port="5432",
        database="uefa_champions_league_20"  # Подключаемся к созданной базе
    )
    cursor = conn.cursor()
    
    # Таблица команд
    cursor.execute("""
    CREATE TABLE teams (
        team_name VARCHAR(100) PRIMARY KEY,
        country VARCHAR(100),
        home_stadium VARCHAR(150)
    );
    """)
    print("Таблица 'teams' создана.")
    
    # Таблица стадионов
    cursor.execute("""
    CREATE TABLE stadiums (
        name VARCHAR(150) PRIMARY KEY,
        city VARCHAR(100),
        country VARCHAR(100),
        capacity INTEGER
    );
    """)
    print("Таблица 'stadiums' создана.")
    
    # Таблица игроков
    cursor.execute("""
    CREATE TABLE players (
        player_id VARCHAR(10) PRIMARY KEY,
        first_name VARCHAR(100),
        last_name VARCHAR(100),
        nationality VARCHAR(100),
        dob DATE,
        team VARCHAR(100),
        jersey_number INTEGER,
        position VARCHAR(50),
        height INTEGER,
        weight INTEGER,
        foot VARCHAR(1)
    );
    """)
    print("Таблица 'players' создана.")
    
    # Таблица менеджеров
    cursor.execute("""
    CREATE TABLE managers (
        first_name VARCHAR(100),
        last_name VARCHAR(100),
        nationality VARCHAR(100),
        dob DATE,
        team VARCHAR(100)
    );
    """)
    print("Таблица 'managers' создана.")
    
    # Таблица матчей
    cursor.execute("""
    CREATE TABLE matches (
        match_id VARCHAR(10) PRIMARY KEY,
        season VARCHAR(20),
        date_time TIMESTAMP,
        home_team VARCHAR(100),
        away_team VARCHAR(100),
        stadium VARCHAR(150),
        home_team_score INTEGER,
        away_team_score INTEGER,
        penalty_shoot_out BOOLEAN,
        attendance INTEGER
    );
    """)
    print("Таблица 'matches' создана.")
    
    # Таблица голов
    cursor.execute("""
    CREATE TABLE goals (
        goal_id VARCHAR(10) PRIMARY KEY,
        match_id VARCHAR(10),
        pid VARCHAR(10),
        duration INTEGER,
        assist VARCHAR(10),
        goal_desc VARCHAR(200)
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