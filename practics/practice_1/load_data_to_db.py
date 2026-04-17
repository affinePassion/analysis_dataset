# load_data_to_db_fixed.py

import pandas as pd
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
from sqlalchemy import create_engine, text
import numpy as np
import chardet
import os

def detect_encoding(file_path):
    """Определяет кодировку файла"""
    with open(file_path, 'rb') as f:
        result = chardet.detect(f.read())
    return result['encoding']

def load_csv_file(file_path):
    """Загружает CSV файл с автоматическим определением параметров"""
    encoding = detect_encoding(file_path)
    
    # Пробуем разные разделители
    for delimiter in [',', ';', '\t']:
        try:
            df = pd.read_csv(file_path, delimiter=delimiter, encoding=encoding)
            if len(df.columns) > 1:
                print(f"  Использован разделитель: '{delimiter}'")
                return df
        except:
            continue
    
    # Если не получилось, пробуем автоопределение
    df = pd.read_csv(file_path, sep=None, engine='python', encoding=encoding)
    print(f"  Использован автоматический разделитель")
    return df

def load_data():
    print("Начинаем загрузку данных...")
    
    # Параметры подключения
    db_params = {
        'host': 'povt-cluster.tstu.tver.ru',
        'user': 'mpi',
        'password': '135a1',
        'port': '5432',
        'database': 'uefa_champions_league'
    }
    
    # Создаем SQLAlchemy engine
    engine = create_engine(f"postgresql://{db_params['user']}:{db_params['password']}@{db_params['host']}:{db_params['port']}/{db_params['database']}")
    
    chunk_size = 1000
    
    # 1. Stadiums
    print("\nЗагрузка stadiums.csv...")
    df_stadiums = load_csv_file('stadiums.csv')
    print(f"  Колонки: {df_stadiums.columns.tolist()}")
    print(f"  Размер: {df_stadiums.shape}")
    
    df_stadiums = df_stadiums.replace({np.nan: None, '': None})
    df_stadiums.to_sql('stadiums', engine, if_exists='append', index=False, method='multi')
    print(f"  Загружено {len(df_stadiums)} записей")
    
    # Создаем словарь стадионов для быстрого поиска города
    stadium_city_map = dict(zip(df_stadiums['NAME'], df_stadiums['CITY']))
    
    # 2. Teams
    print("\nЗагрузка teams.csv...")
    df_teams = load_csv_file('teams.csv')
    print(f"  Колонки: {df_teams.columns.tolist()}")
    print(f"  Размер: {df_teams.shape}")
    
    # Добавляем колонку с городом стадиона
    df_teams['STADIUM_CITY'] = df_teams['HOME_STADIUM'].map(stadium_city_map)
    
    # Проверяем, есть ли стадионы без города
    missing_cities = df_teams[df_teams['STADIUM_CITY'].isna()]['HOME_STADIUM'].unique()
    if len(missing_cities) > 0:
        print(f"  ВНИМАНИЕ: Не найдены города для стадионов: {missing_cities}")
    
    df_teams = df_teams.replace({np.nan: None, '': None})
    df_teams.to_sql('teams', engine, if_exists='append', index=False, method='multi')
    print(f"  Загружено {len(df_teams)} записей")
    
    # 3. Players
    print("\nЗагрузка players.csv...")
    df_players = load_csv_file('players.csv')
    print(f"  Колонки: {df_players.columns.tolist()}")
    print(f"  Размер: {df_players.shape}")
    
    # Конвертация типов данных
    if 'DOB' in df_players.columns:
        df_players['DOB'] = pd.to_datetime(df_players['DOB'], errors='coerce')
    if 'JERSEY_NUMBER' in df_players.columns:
        df_players['JERSEY_NUMBER'] = pd.to_numeric(df_players['JERSEY_NUMBER'], errors='coerce')
    if 'HEIGHT' in df_players.columns:
        df_players['HEIGHT'] = pd.to_numeric(df_players['HEIGHT'], errors='coerce')
    if 'WEIGHT' in df_players.columns:
        df_players['WEIGHT'] = pd.to_numeric(df_players['WEIGHT'], errors='coerce')
    
    df_players = df_players.replace({np.nan: None, '': None})
    
    for i in range(0, len(df_players), chunk_size):
        chunk = df_players.iloc[i:i+chunk_size]
        chunk.to_sql('players', engine, if_exists='append', index=False, method='multi')
        print(f"  Загружено {min(i+chunk_size, len(df_players))} из {len(df_players)} записей")
    
    # 4. Managers
    print("\nЗагрузка managers.csv...")
    df_managers = load_csv_file('managers.csv')
    print(f"  Колонки: {df_managers.columns.tolist()}")
    print(f"  Размер: {df_managers.shape}")
    
    if 'DOB' in df_managers.columns:
        df_managers['DOB'] = pd.to_datetime(df_managers['DOB'], errors='coerce')
    
    df_managers = df_managers.replace({np.nan: None, '': None})
    df_managers.to_sql('managers', engine, if_exists='append', index=False, method='multi')
    print(f"  Загружено {len(df_managers)} записей")
    
    # 5. Matches
    print("\nЗагрузка matches.csv...")
    df_matches = load_csv_file('matches.csv')
    print(f"  Колонки: {df_matches.columns.tolist()}")
    print(f"  Размер: {df_matches.shape}")
    
    # Добавляем колонку с городом стадиона
    df_matches['STADIUM_CITY'] = df_matches['STADIUM'].map(stadium_city_map)
    
    # Конвертация даты
    if 'DATE_TIME' in df_matches.columns:
        df_matches['DATE_TIME'] = pd.to_datetime(df_matches['DATE_TIME'], 
                                                  format='%d-%b-%y %I.%M.%S.%f %p', 
                                                  errors='coerce')
    
    # Конвертация числовых колонок
    numeric_cols = ['HOME_TEAM_SCORE', 'AWAY_TEAM_SCORE', 'PENALTY_SHOOT_OUT', 'ATTENDANCE']
    for col in numeric_cols:
        if col in df_matches.columns:
            df_matches[col] = pd.to_numeric(df_matches[col], errors='coerce')
    
    df_matches = df_matches.replace({np.nan: None, '': None})
    
    for i in range(0, len(df_matches), chunk_size):
        chunk = df_matches.iloc[i:i+chunk_size]
        chunk.to_sql('matches', engine, if_exists='append', index=False, method='multi')
        print(f"  Загружено {min(i+chunk_size, len(df_matches))} из {len(df_matches)} записей")
    
    # 6. Goals
    print("\nЗагрузка goals.csv...")
    df_goals = load_csv_file('goals.csv')
    print(f"  Колонки: {df_goals.columns.tolist()}")
    print(f"  Размер: {df_goals.shape}")
    
    if 'DURATION' in df_goals.columns:
        df_goals['DURATION'] = pd.to_numeric(df_goals['DURATION'], errors='coerce')
    
    df_goals = df_goals.replace({np.nan: None, '': None})
    
    for i in range(0, len(df_goals), chunk_size):
        chunk = df_goals.iloc[i:i+chunk_size]
        chunk.to_sql('goals', engine, if_exists='append', index=False, method='multi')
        print(f"  Загружено {min(i+chunk_size, len(df_goals))} из {len(df_goals)} записей")
    
    print("\n" + "=" * 80)
    print("ВСЕ ДАННЫЕ УСПЕШНО ЗАГРУЖЕНЫ!")
    print("=" * 80)
    
    # Проверка количества записей - ИСПРАВЛЕНО
    print("\nПроверка загруженных данных:")
    with engine.connect() as conn:
        tables = ['stadiums', 'teams', 'players', 'managers', 'matches', 'goals']
        for table in tables:
            result = conn.execute(text(f'SELECT COUNT(*) FROM "{table}"'))
            count = result.scalar()
            print(f"  {table}: {count} записей")
    
    print("\n" + "=" * 80)
    print("ГОТОВО! Можно запускать SQL-запросы!")
    print("=" * 80)

if __name__ == "__main__":
    load_data()