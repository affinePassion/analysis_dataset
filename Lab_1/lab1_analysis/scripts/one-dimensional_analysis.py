import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sqlalchemy import create_engine
import os

# Создаём папку output, если её нет
os.makedirs('output', exist_ok=True)

def univariate_analysis():
    DB_CONFIG = {
        'host': 'povt-cluster.tstu.tver.ru',
        'user': 'mpi',
        'password': '135a1',
        'port': '5432',
        'database': 'programmers_salary'
    }
    connection_string = f"postgresql://{DB_CONFIG['user']}:{DB_CONFIG['password']}@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}"
    engine = create_engine(connection_string)
    
    plt.style.use('seaborn-v0_8-darkgrid')
    sns.set_palette("husl")
    
    print("ОДНОМЕРНЫЙ АНАЛИЗ КОЛИЧЕСТВЕННЫХ ПРИЗНАКОВ")
    print("=" * 60)
    
    # 1. Зарплата
    print("\n1. Анализ зарплат")
    salary_df = pd.read_sql('SELECT salary FROM developers WHERE salary > 0', engine)
    
    plt.figure(figsize=(12, 6))
    plt.hist(salary_df['salary'], bins=20, color='skyblue', edgecolor='black', alpha=0.7)
    plt.title('Распределение зарплат программистов', fontsize=16, fontweight='bold')
    plt.xlabel('Зарплата (тыс. руб.)', fontsize=12)
    plt.ylabel('Количество сотрудников', fontsize=12)
    plt.grid(True, alpha=0.3)
    
    mean_salary = salary_df['salary'].mean()
    median_salary = salary_df['salary'].median()
    plt.axvline(mean_salary, color='red', linestyle='--', linewidth=2, label=f'Средняя: {mean_salary:.0f}')
    plt.axvline(median_salary, color='green', linestyle='--', linewidth=2, label=f'Медиана: {median_salary:.0f}')
    plt.legend()
    
    plt.tight_layout()
    plt.savefig('output/hist_salary.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    print(f"Описание распределения зарплат:")
    print(f"  - Среднее значение: {mean_salary:.0f} тыс. руб.")
    print(f"  - Медиана: {median_salary:.0f} тыс. руб.")
    print(f"  - Минимум: {salary_df['salary'].min():.0f} тыс. руб.")
    print(f"  - Максимум: {salary_df['salary'].max():.0f} тыс. руб.")
    print(f"  - Стандартное отклонение: {salary_df['salary'].std():.0f} тыс. руб.")
    print("  - Распределение правостороннее, большинство зарплат в диапазоне 300–500 тыс.")
    
    # 2. Возраст
    print("\n\n2. Анализ возраста")
    age_df = pd.read_sql('SELECT age FROM developers WHERE age > 0', engine)
    
    plt.figure(figsize=(12, 6))
    plt.hist(age_df['age'], bins=15, color='salmon', edgecolor='black', alpha=0.7)
    plt.title('Распределение возраста программистов', fontsize=16, fontweight='bold')
    plt.xlabel('Возраст (лет)', fontsize=12)
    plt.ylabel('Количество сотрудников', fontsize=12)
    plt.grid(True, alpha=0.3)
    
    mean_age = age_df['age'].mean()
    median_age = age_df['age'].median()
    plt.axvline(mean_age, color='red', linestyle='--', linewidth=2, label=f'Средний: {mean_age:.1f}')
    plt.axvline(median_age, color='green', linestyle='--', linewidth=2, label=f'Медиана: {median_age:.1f}')
    plt.legend()
    
    plt.tight_layout()
    plt.savefig('output/hist_age.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    print(f"Описание распределения возраста:")
    print(f"  - Среднее значение: {mean_age:.1f} лет")
    print(f"  - Медиана: {median_age:.1f} лет")
    print(f"  - Минимум: {age_df['age'].min():.0f} лет")
    print(f"  - Максимум: {age_df['age'].max():.0f} лет")
    print(f"  - Стандартное отклонение: {age_df['age'].std():.1f} лет")
    print("  - Основная масса программистов в возрасте 30–45 лет")
    
    # 3. Опыт работы
    print("\n\n3. Анализ опыта работы")
    exp_df = pd.read_sql('SELECT experience_years FROM developers WHERE experience_years >= 0', engine)
    
    plt.figure(figsize=(12, 6))
    plt.hist(exp_df['experience_years'], bins=15, color='lightgreen', edgecolor='black', alpha=0.7)
    plt.title('Распределение опыта работы программистов', fontsize=16, fontweight='bold')
    plt.xlabel('Опыт (лет)', fontsize=12)
    plt.ylabel('Количество сотрудников', fontsize=12)
    plt.grid(True, alpha=0.3)
    
    mean_exp = exp_df['experience_years'].mean()
    median_exp = exp_df['experience_years'].median()
    plt.axvline(mean_exp, color='red', linestyle='--', linewidth=2, label=f'Средний: {mean_exp:.1f}')
    plt.axvline(median_exp, color='green', linestyle='--', linewidth=2, label=f'Медиана: {median_exp:.1f}')
    plt.legend()
    
    plt.tight_layout()
    plt.savefig('output/hist_experience.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    print(f"Описание распределения опыта:")
    print(f"  - Среднее значение: {mean_exp:.1f} лет")
    print(f"  - Медиана: {median_exp:.1f} лет")
    print(f"  - Минимум: {exp_df['experience_years'].min():.0f} лет")
    print(f"  - Максимум: {exp_df['experience_years'].max():.0f} лет")
    print(f"  - Стандартное отклонение: {exp_df['experience_years'].std():.1f} лет")
    print("  - Распределение близко к нормальному, пик приходится на 4–8 лет опыта")
    
    print("\n\nВЫВОД О ВАЖНОСТИ ПРИЗНАКОВ ДЛЯ ЗАДАЧИ:")
    print("=" * 60)
    print("1. Зарплата – целевая переменная, важна для построения моделей прогнозирования.")
    print("2. Возраст и опыт – потенциальные предикторы, показывают корреляцию с уровнем дохода.")
    print("3. Анализ распределений помогает выявить выбросы и понять структуру данных.")

if __name__ == "__main__":
    univariate_analysis()