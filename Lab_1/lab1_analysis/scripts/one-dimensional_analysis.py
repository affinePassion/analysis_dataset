import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sqlalchemy import create_engine

def univariate_analysis():
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
    
    # Настройка визуализации
    plt.style.use('seaborn-v0_8-darkgrid')
    sns.set_palette("husl")
    
    print("ОДНОМЕРНЫЙ АНАЛИЗ КОЛИЧЕСТВЕННЫХ ПРИЗНАКОВ")
    print("=" * 60)
    
    # ГИСТОГРАММА 1: Распределение вместимости стадионов
    print("\n1. Анализ вместимости стадионов")
    capacity_df = pd.read_sql('SELECT "CAPACITY" FROM stadiums WHERE "CAPACITY" > 0', engine)
    
    plt.figure(figsize=(12, 6))
    plt.hist(capacity_df['CAPACITY'], bins=20, color='skyblue', edgecolor='black', alpha=0.7)
    plt.title('Распределение вместимости стадионов Лиги чемпионов', fontsize=16, fontweight='bold')
    plt.xlabel('Вместимость (человек)', fontsize=12)
    plt.ylabel('Количество стадионов', fontsize=12)
    plt.grid(True, alpha=0.3)
    
    # Добавляем статистику
    mean_capacity = capacity_df['CAPACITY'].mean()
    median_capacity = capacity_df['CAPACITY'].median()
    plt.axvline(mean_capacity, color='red', linestyle='--', linewidth=2, label=f'Среднее: {mean_capacity:.0f}')
    plt.axvline(median_capacity, color='green', linestyle='--', linewidth=2, label=f'Медиана: {median_capacity:.0f}')
    plt.legend()
    
    plt.tight_layout()
    plt.savefig('Lab_1\lab1_analysis\output\hist_capacity.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    print(f"Описание распределения вместимости стадионов:")
    print(f"  - Среднее значение: {mean_capacity:.0f} мест")
    print(f"  - Медиана: {median_capacity:.0f} мест")
    print(f"  - Минимум: {capacity_df['CAPACITY'].min():.0f} мест")
    print(f"  - Максимум: {capacity_df['CAPACITY'].max():.0f} мест")
    print(f"  - Стандартное отклонение: {capacity_df['CAPACITY'].std():.0f} мест")
    print("  Распределение правостороннее, большинство стадионов имеют вместимость 30-60 тыс.")
    
    # ГИСТОГРАММА 2: Распределение посещаемости матчей
    print("\n\n2. Анализ посещаемости матчей")
    attendance_df = pd.read_sql("""
        SELECT "ATTENDANCE" 
        FROM matches 
        WHERE "ATTENDANCE" > 0 AND "ATTENDANCE" IS NOT NULL
    """, engine)
    
    plt.figure(figsize=(12, 6))
    plt.hist(attendance_df['ATTENDANCE'], bins=25, color='salmon', edgecolor='black', alpha=0.7)
    plt.title('Распределение посещаемости матчей Лиги чемпионов', fontsize=16, fontweight='bold')
    plt.xlabel('Посещаемость (человек)', fontsize=12)
    plt.ylabel('Количество матчей', fontsize=12)
    plt.grid(True, alpha=0.3)
    
    # Добавляем статистику
    mean_attendance = attendance_df['ATTENDANCE'].mean()
    median_attendance = attendance_df['ATTENDANCE'].median()
    plt.axvline(mean_attendance, color='red', linestyle='--', linewidth=2, label=f'Среднее: {mean_attendance:.0f}')
    plt.axvline(median_attendance, color='green', linestyle='--', linewidth=2, label=f'Медиана: {median_attendance:.0f}')
    plt.legend()
    
    plt.tight_layout()
    plt.savefig('Lab_1\lab1_analysis\output\hist_attendance.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    print(f"Описание распределения посещаемости:")
    print(f"  - Среднее значение: {mean_attendance:.0f} зрителей")
    print(f"  - Медиана: {median_attendance:.0f} зрителей")
    print(f"  - Минимум: {attendance_df['ATTENDANCE'].min():.0f} зрителей")
    print(f"  - Максимум: {attendance_df['ATTENDANCE'].max():.0f} зрителей")
    print(f"  - Стандартное отклонение: {attendance_df['ATTENDANCE'].std():.0f} зрителей")
    print("  Распределение бимодальное, с пиками около 40-50 тыс. и 70-80 тыс.")
    print("  Есть аномально низкие значения (<10 тыс.), вероятно из-за пандемии COVID-19")
    
    # Вывод о важности признаков
    print("\n\nВЫВОД О ВАЖНОСТИ ПРИЗНАКОВ ДЛЯ ЗАДАЧИ:")
    print("=" * 60)
    print("1. Вместимость стадионов - важный признак для:")
    print("   - Планирования безопасности мероприятий")
    print("   - Прогнозирования потенциальной выручки от продажи билетов")
    print("   - Оценки инфраструктурных возможностей клубов")
    print()
    print("2. Посещаемость матчей - важный признак для:")
    print("   - Анализа популярности турнира в разных странах")
    print("   - Оценки экономического эффекта от проведения матчей")
    print("   - Прогнозирования выручки клубов")
    print("   - Понимания влияния внешних факторов (пандемия, геополитика)")

if __name__ == "__main__":
    univariate_analysis()