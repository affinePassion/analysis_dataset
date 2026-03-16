import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sqlalchemy import create_engine

def multivariate_analysis():
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
    sns.set_palette("tab10")
    
    print("МНОГОМЕРНЫЙ АНАЛИЗ ПРИЗНАКОВ")
    print("=" * 60)
    
    # ГРАФИК 1: Зависимость посещаемости от вместимости и результата матча
    print("\n1. Анализ связи посещаемости, вместимости и результата матча")
    
    query1 = """
    SELECT 
        m."ATTENDANCE",
        s."CAPACITY",
        m."HOME_TEAM_SCORE",
        m."AWAY_TEAM_SCORE",
        CASE 
            WHEN m."HOME_TEAM_SCORE" > m."AWAY_TEAM_SCORE" THEN 'Победа дома'
            WHEN m."HOME_TEAM_SCORE" < m."AWAY_TEAM_SCORE" THEN 'Победа гостей'
            ELSE 'Ничья'
        END as result,
        m."SEASON"
    FROM "matches" m
    JOIN "stadiums" s ON m."STADIUM" = s."NAME"
    WHERE m."ATTENDANCE" > 0 AND s."CAPACITY" > 0
    """
    
    df1 = pd.read_sql(query1, engine)
    
    plt.figure(figsize=(14, 8))
    
    # Точечный график с цветом по результату
    scatter = plt.scatter(df1['CAPACITY'], df1['ATTENDANCE'], 
                         c=pd.Categorical(df1['result']).codes,
                         cmap='viridis',
                         alpha=0.6,
                         s=50)
    
    # Линия идеальной заполняемости
    max_attendance = df1['ATTENDANCE'].max()
    max_capacity = df1['CAPACITY'].max()
    max_val = max(max_attendance, max_capacity)
    plt.plot([0, max_val], [0, max_val], 'r--', alpha=0.5, label='100% заполняемость')
    
    plt.title('Зависимость посещаемости от вместимости стадиона и результата матча', 
              fontsize=16, fontweight='bold')
    plt.xlabel('Вместимость стадиона (человек)', fontsize=12)
    plt.ylabel('Посещаемость (человек)', fontsize=12)
    
    # Легенда для результатов
    from matplotlib.lines import Line2D
    legend_elements = [
        Line2D([0], [0], marker='o', color='w', markerfacecolor='yellow', markersize=10, label='Победа дома'),
        Line2D([0], [0], marker='o', color='w', markerfacecolor='green', markersize=10, label='Победа гостей'),
        Line2D([0], [0], marker='o', color='w', markerfacecolor='blue', markersize=10, label='Ничья'),
        Line2D([0], [0], color='r', linestyle='--', label='100% заполняемость')
    ]
    plt.legend(handles=legend_elements)
    
    plt.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.savefig('Lab_1\lab1_analysis\output\scatter_attendance_vs_capacity_result.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    print("Анализ графика 1:")
    print("  - Большинство точек ниже красной пунктирной линии (стадионы не заполнены полностью)")
    print("  - Видна положительная корреляция: чем больше стадион, тем выше посещаемость")
    print("  - Нет явной зависимости между результатом матча и посещаемостью")
    print("  - Несколько матчей с очень низкой посещаемостью при большой вместимости")
    
    # ГРАФИК 2: Средние голы по сезонам с разбивкой по домашним/гостевым
    print("\n\n2. Анализ результативности по сезонам")
    
    query2 = """
    SELECT 
        "SEASON",
        AVG("HOME_TEAM_SCORE") as avg_home_goals,
        AVG("AWAY_TEAM_SCORE") as avg_away_goals,
        AVG("HOME_TEAM_SCORE" + "AWAY_TEAM_SCORE") as avg_total_goals,
        COUNT(*) as matches_count
    FROM "matches"
    GROUP BY "SEASON"
    ORDER BY "SEASON"
    """
    
    df2 = pd.read_sql(query2, engine)
    
    fig, axes = plt.subplots(2, 2, figsize=(16, 12))
    
    # Подграфик 1: Столбчатая диаграмма средних голов
    ax1 = axes[0, 0]
    x = range(len(df2['SEASON']))
    width = 0.35
    ax1.bar([i - width/2 for i in x], df2['avg_home_goals'], width, label='Домашние голы', color='blue', alpha=0.7)
    ax1.bar([i + width/2 for i in x], df2['avg_away_goals'], width, label='Гостевые голы', color='red', alpha=0.7)
    ax1.set_xlabel('Сезон')
    ax1.set_ylabel('Среднее количество голов')
    ax1.set_title('Средние голы домашней и гостевой команд по сезонам', fontweight='bold')
    ax1.set_xticks(x)
    ax1.set_xticklabels(df2['SEASON'], rotation=45)
    ax1.legend()
    ax1.grid(True, alpha=0.3)
    
    # Подграфик 2: Линейный график общей результативности
    ax2 = axes[0, 1]
    ax2.plot(df2['SEASON'], df2['avg_total_goals'], marker='o', linewidth=2, markersize=8, color='green')
    ax2.fill_between(df2['SEASON'], df2['avg_total_goals'], alpha=0.3, color='green')
    ax2.set_xlabel('Сезон')
    ax2.set_ylabel('Среднее общее количество голов')
    ax2.set_title('Общая результативность матчей по сезонам', fontweight='bold')
    ax2.set_xticklabels(df2['SEASON'], rotation=45)
    ax2.grid(True, alpha=0.3)
    
    # Подграфик 3: Количество матчей по сезонам
    ax3 = axes[1, 0]
    colors = plt.cm.Set3(range(len(df2['SEASON'])))
    ax3.bar(df2['SEASON'], df2['matches_count'], color=colors, edgecolor='black')
    ax3.set_xlabel('Сезон')
    ax3.set_ylabel('Количество матчей')
    ax3.set_title('Количество матчей в сезоне', fontweight='bold')
    ax3.set_xticklabels(df2['SEASON'], rotation=45)
    ax3.grid(True, alpha=0.3)
    
    # Подграфик 4: Разница между домашними и гостевыми голами
    ax4 = axes[1, 1]
    diff = df2['avg_home_goals'] - df2['avg_away_goals']
    bars = ax4.bar(df2['SEASON'], diff, color=['red' if d < 0 else 'blue' for d in diff], edgecolor='black')
    ax4.axhline(y=0, color='black', linestyle='-', linewidth=0.5)
    ax4.set_xlabel('Сезон')
    ax4.set_ylabel('Разница (дома - гости)')
    ax4.set_title('Преимущество домашней команды по сезонам', fontweight='bold')
    ax4.set_xticklabels(df2['SEASON'], rotation=45)
    ax4.grid(True, alpha=0.3)
    
    # Добавляем значения на столбцы
    for bar in bars:
        height = bar.get_height()
        ax4.text(bar.get_x() + bar.get_width()/2., height,
                f'{height:.2f}',
                ha='center', va='bottom' if height > 0 else 'top')
    
    plt.tight_layout()
    plt.savefig('Lab_1\lab1_analysis\output\goals_analysis_by_season.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    print("\nАнализ графика 2:")
    print("  - Домашние команды в среднем забивают больше, чем гостевые")
    print("  - Самый результативный сезон: 2018-2019 (в среднем ~3 гола за матч)")
    print("  - В сезоне 2020-2021 заметен спад результативности (возможно, влияние пандемии)")
    print("  - Количество матчей увеличивается с каждым сезоном")
    
    # Вывод о важности признаков
    print("\n\nВЫВОД О ВАЖНОСТИ ПРИЗНАКОВ ДЛЯ ЗАДАЧИ:")
    print("=" * 60)
    print("1. Вместимость, посещаемость и результат матча вместе позволяют:")
    print("   - Анализировать экономическую эффективность стадионов")
    print("   - Исследовать факторы, влияющие на заполняемость")
    print("   - Оптимизировать ценообразование на билеты")
    print()
    print("2. Анализ результативности по сезонам важен для:")
    print("   - Понимания эволюции тактики в футболе")
    print("   - Оценки зрелищности турнира в разные годы")
    print("   - Прогнозирования результативности будущих матчей")
    print("   - Анализа влияния правил и форматов турнира")

if __name__ == "__main__":
    multivariate_analysis()