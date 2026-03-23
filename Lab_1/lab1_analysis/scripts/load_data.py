import pandas as pd
from sqlalchemy import create_engine

def load_data():
    DB_CONFIG = {
        'host': 'povt-cluster.tstu.tver.ru',
        'user': 'mpi',
        'password': '135a1',
        'port': '5432',
        'database': 'programmers_salary'
    }
    
    connection_string = f"postgresql://{DB_CONFIG['user']}:{DB_CONFIG['password']}@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}"
    engine = create_engine(connection_string)
    
    file_path = r"C:\Users\POMAH\Documents\GitHub\analysis_dataset\Lab_1\lab1_analysis\dataset\var05.csv"
    
    print("Загрузка данных из CSV...")
    try:
        # Читаем CSV, заголовок есть, первый столбец не имеет имени — удалим его
        df = pd.read_csv(file_path, encoding='utf-8')
        
        # Если первый столбец безымянный, удалим его
        if df.columns[0].startswith('Unnamed'):
            df = df.iloc[:, 1:]
        
        # Переименуем колонки в соответствии со структурой таблицы
        df.columns = [
            'experience_years', 'age', 'education', 'city',
            'programming_language', 'company_size', 'english_level',
            'education_code', 'salary'
        ]
        
        # Загружаем в PostgreSQL
        df.to_sql('developers', engine, if_exists='replace', index=False)
        print("Таблица 'developers' загружена.")
        
        # Проверка
        count = pd.read_sql("SELECT COUNT(*) FROM developers", engine).iloc[0,0]
        print(f"\nВсего записей загружено: {count}")
        
    except Exception as e:
        print(f"Ошибка при загрузке данных: {e}")
        raise

if __name__ == "__main__":
    load_data()