import pandas as pd
from sqlalchemy import create_engine, text

def describe_data():
    DB_CONFIG = {
        'host': 'povt-cluster.tstu.tver.ru',
        'user': 'mpi',
        'password': '135a1',
        'port': '5432',
        'database': 'programmers_salary'
    }
    connection_string = f"postgresql://{DB_CONFIG['user']}:{DB_CONFIG['password']}@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}"
    engine = create_engine(connection_string)

    print("-" * 60)
    print("ДАННЫЕ О ЗАРПЛАТАХ ПРОГРАММИСТОВ")
    print("-" * 60)

    with engine.connect() as conn:
        result = conn.execute(text("""
            SELECT table_name 
            FROM information_schema.tables 
            WHERE table_schema = 'public'
            ORDER BY table_name;
        """))
        tables = [row[0] for row in result]

    for table in tables:
        print(f"\n{'='*40}")
        print(f"ТАБЛИЦА: {table}")
        print(f"{'='*40}")
        
        with engine.connect() as conn:
            result = conn.execute(text(f"""
                SELECT column_name, data_type, is_nullable
                FROM information_schema.columns
                WHERE table_name = '{table}'
                ORDER BY ordinal_position;
            """))
            columns_info = result.fetchall()
        
        print(f"{'Название колонки':<25} {'Тип данных':<20} {'Null?'}")
        print("-" * 60)
        for col_name, data_type, is_nullable in columns_info:
            print(f"{col_name:<25} {data_type:<20} {is_nullable}")
        
        df_sample = pd.read_sql(f"SELECT * FROM {table} LIMIT 3", engine)
        print(f"\nПервые 3 строки таблицы:")
        print(df_sample)
        
        print(f"\nОпределение шкал признаков:")
        for col_name, data_type, _ in columns_info:
            if data_type in ['bigint', 'integer', 'numeric', 'real', 'double precision']:
                scale = "Количественный"
            elif data_type in ['character varying', 'text', 'character']:
                unique_count = pd.read_sql(f'SELECT COUNT(DISTINCT "{col_name}") FROM {table}', engine).iloc[0,0]
                if unique_count < 10:
                    scale = "Категориальный"
                else:
                    scale = "Номинальный"
            elif data_type in ['date', 'timestamp without time zone']:
                scale = "Количественный"
            elif data_type == 'boolean':
                scale = "Бинарный"
            else:
                scale = "Не определено"
            print(f"  - {col_name}: {scale}")
        
        count = pd.read_sql(f"SELECT COUNT(*) FROM {table}", engine).iloc[0,0]
        print(f"\nОбщее количество записей: {count}")

if __name__ == "__main__":
    describe_data()