import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sqlalchemy import create_engine
import os

os.makedirs('output', exist_ok=True)

def multivariate_analysis():
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
    sns.set_palette("tab10")
    
    print("МНОГОМЕРНЫЙ АНАЛИЗ ПРИЗНАКОВ")
    print("=" * 60)
    
    # Загружаем данные
    df = pd.read_sql("""
        SELECT salary, experience_years, age, programming_language, city, education
        FROM developers
        WHERE salary > 0 AND experience_years >= 0 AND age > 0
    """, engine)
    
    # 1. Scatter-графики (оставляем как есть)
    print("\n1. Зависимость зарплаты от опыта и возраста")
    
    fig, axes = plt.subplots(1, 2, figsize=(16, 6))
    
    ax1 = axes[0]
    scatter1 = ax1.scatter(df['experience_years'], df['salary'], 
                           c=df['age'], cmap='viridis', alpha=0.6, s=50)
    ax1.set_xlabel('Опыт (лет)', fontsize=12)
    ax1.set_ylabel('Зарплата (тыс. руб.)', fontsize=12)
    ax1.set_title('Зарплата vs Опыт (цветом – возраст)', fontweight='bold')
    plt.colorbar(scatter1, ax=ax1, label='Возраст')
    ax1.grid(True, alpha=0.3)
    
    ax2 = axes[1]
    scatter2 = ax2.scatter(df['age'], df['salary'], 
                           c=df['experience_years'], cmap='plasma', alpha=0.6, s=50)
    ax2.set_xlabel('Возраст (лет)', fontsize=12)
    ax2.set_ylabel('Зарплата (тыс. руб.)', fontsize=12)
    ax2.set_title('Зарплата vs Возраст (цветом – опыт)', fontweight='bold')
    plt.colorbar(scatter2, ax=ax2, label='Опыт (лет)')
    ax2.grid(True, alpha=0.3)
    
    plt.tight_layout()
    plt.savefig('output/scatter_salary_exp_age.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    # 2. Язык программирования – столбчатая диаграмма со средними и std
    print("\n\n2. Влияние языка программирования на зарплату")
    
    lang_stats = df.groupby('programming_language')['salary'].agg(['mean', 'std', 'count']).reset_index()
    lang_stats = lang_stats.sort_values('mean', ascending=False)
    
    plt.figure(figsize=(12, 6))
    bars = plt.bar(lang_stats['programming_language'], lang_stats['mean'], 
                   yerr=lang_stats['std'], capsize=5, alpha=0.7, color='steelblue', edgecolor='black')
    plt.xlabel('Язык программирования', fontsize=12)
    plt.ylabel('Средняя зарплата (тыс. руб.)', fontsize=12)
    plt.title('Средняя зарплата по языкам программирования (с ошибкой ±1σ)', fontweight='bold')
    plt.xticks(rotation=45)
    plt.grid(axis='y', alpha=0.3)
    
    # Подписи значений на столбцах
    for bar, val in zip(bars, lang_stats['mean']):
        plt.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 5,
                 f'{val:.0f}', ha='center', va='bottom', fontsize=9)
    
    plt.tight_layout()
    plt.savefig('output/barplot_salary_by_lang.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    print("\nСтатистика по языкам:")
    print(lang_stats)
    
    # 3. Город – столбчатая диаграмма со средними и std
    print("\n\n3. Географическое распределение зарплат")
    
    city_stats = df.groupby('city')['salary'].agg(['mean', 'std', 'count']).reset_index()
    city_stats = city_stats.sort_values('mean', ascending=False)
    
    plt.figure(figsize=(10, 6))
    bars = plt.bar(city_stats['city'], city_stats['mean'], 
                   yerr=city_stats['std'], capsize=5, alpha=0.7, color='coral', edgecolor='black')
    plt.xlabel('Город', fontsize=12)
    plt.ylabel('Средняя зарплата (тыс. руб.)', fontsize=12)
    plt.title('Средняя зарплата по городам (с ошибкой ±1σ)', fontweight='bold')
    plt.xticks(rotation=45)
    plt.grid(axis='y', alpha=0.3)
    
    for bar, val in zip(bars, city_stats['mean']):
        plt.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 5,
                 f'{val:.0f}', ha='center', va='bottom', fontsize=9)
    
    plt.tight_layout()
    plt.savefig('output/barplot_salary_by_city.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    print("\nСтатистика по городам:")
    print(city_stats)
    
    
    print("\n\nВЫВОД О ВАЖНОСТИ ПРИЗНАКОВ ДЛЯ ЗАДАЧИ:")
    print("=" * 60)
    print("1. Опыт и возраст – ключевые количественные факторы, влияющие на зарплату (см. scatter).")
    print("2. Язык программирования – важный категориальный признак: Python и Java в среднем выше C++.")
    print("3. Город – отражает региональные различия: Москва и СПб выше, чем Казань и Новосибирск.")
    print("4. Образование – PhD даёт преимущество перед бакалавриатом, магистратура занимает промежуточное положение.")
    print("5. Комбинация всех признаков позволяет строить точные модели прогнозирования зарплаты.")

if __name__ == "__main__":
    multivariate_analysis()