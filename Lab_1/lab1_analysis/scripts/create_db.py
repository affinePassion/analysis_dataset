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
    
    db_name = "programmers_salary"
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
    
    print("\nСоздание таблицы в базе данных...")
    
    conn = psycopg2.connect(
        host="povt-cluster.tstu.tver.ru",
        user="mpi",
        password="135a1",
        port="5432",
        database=db_name
    )
    cursor = conn.cursor()
    
    cursor.execute("""
    CREATE TABLE developers (
        id SERIAL PRIMARY KEY,
        experience_years INTEGER,
        age INTEGER,
        education VARCHAR(100),
        city VARCHAR(100),
        programming_language VARCHAR(50),
        company_size VARCHAR(50),
        english_level VARCHAR(20),
        education_code INTEGER,
        salary NUMERIC(10,2)
    );
    """)
    print("Таблица 'developers' создана.")
    
    conn.commit()
    print("\nТаблица успешно создана!")
    
    cursor.close()
    conn.close()
    
    print("\nБаза данных готова к загрузке данных.")

if __name__ == "__main__":
    create_database()