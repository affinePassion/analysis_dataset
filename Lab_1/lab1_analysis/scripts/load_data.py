import pandas as pd
from sqlalchemy import create_engine

def load_data():
    """
    Загружает данные из Excel в PostgreSQL
    """
    # Параметры подключения
    DB_CONFIG = {
        'host': 'povt-cluster.tstu.tver.ru',
        'user': 'mpi',
        'password': '135a1',
        'port': '5432',
        'database': 'uefa_champions_league_20'
    }
    
    # Создаём строку подключения для SQLAlchemy
    connection_string = f"postgresql://{DB_CONFIG['user']}:{DB_CONFIG['password']}@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}"
    
    # Подключение к БД
    engine = create_engine(connection_string)
    
    # Загрузка данных из Excel
    file_path = r"C:\Users\POMAH\Documents\GitHub\analysis_dataset\Lab_1\lab1_analysis\dataset\UEFA Champions League 2016-2022 Data.xlsx"
    
    print("Загрузка данных из Excel...")
    
    try:
        # Считываем все листы
        teams_df = pd.read_excel(file_path, sheet_name='teams')
        stadiums_df = pd.read_excel(file_path, sheet_name='stadiums')
        players_df = pd.read_excel(file_path, sheet_name='players')
        managers_df = pd.read_excel(file_path, sheet_name='managers')
        matches_df = pd.read_excel(file_path, sheet_name='matches')
        goals_df = pd.read_excel(file_path, sheet_name='goals')
        
        # Загрузка в PostgreSQL
        teams_df.to_sql('teams', engine, if_exists='replace', index=False)
        print("Таблица 'teams' загружена.")
        
        stadiums_df.to_sql('stadiums', engine, if_exists='replace', index=False)
        print("Таблица 'stadiums' загружена.")
        
        players_df.to_sql('players', engine, if_exists='replace', index=False)
        print("Таблица 'players' загружена.")
        
        managers_df.to_sql('managers', engine, if_exists='replace', index=False)
        print("Таблица 'managers' загружена.")
        
        matches_df.to_sql('matches', engine, if_exists='replace', index=False)
        print("Таблица 'matches' загружена.")
        
        goals_df.to_sql('goals', engine, if_exists='replace', index=False)
        print("Таблица 'goals' загружена.")
        
        print("\nВсе данные успешно загружены в PostgreSQL!")
        
        # Проверка загрузки
        print("\nПроверка количества записей:")
        tables = ['teams', 'stadiums', 'players', 'managers', 'matches', 'goals']
        for table in tables:
            count = pd.read_sql(f"SELECT COUNT(*) FROM {table}", engine).iloc[0,0]
            print(f"  - {table}: {count} записей")
            
    except Exception as e:
        print(f"Ошибка при загрузке данных: {e}")
        raise

if __name__ == "__main__":
    load_data()