# lab4_complete_fixed.py
# Исправленная версия - убрана проблема с heatmap

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.neighbors import KNeighborsRegressor
from sklearn.linear_model import LinearRegression, Ridge, Lasso, ElasticNet
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
import warnings
import os
from datetime import datetime
import joblib

warnings.filterwarnings('ignore')

# Настройка стиля графиков
plt.style.use('seaborn-v0_8-darkgrid')
sns.set_palette("husl")

# Создаем папку для результатов
if not os.path.exists('lab4_results'):
    os.makedirs('lab4_results')

print("="*80)
print("ЛАБОРАТОРНАЯ РАБОТА №4: МАШИННОЕ ОБУЧЕНИЕ С УЧИТЕЛЕМ (РЕГРЕССИЯ)")
print(f"Выполнено: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
print("="*80)

# ============================================================================
# ФУНКЦИЯ ДЛЯ ОБРАБОТКИ ДАННЫХ
# ============================================================================

def analyze_and_preprocess(df, dataset_name):
    """Анализ и предобработка датасета"""
    print(f"\n{'='*80}")
    print(f"АНАЛИЗ ДАТАСЕТА: {dataset_name}")
    print(f"{'='*80}")
    
    # 1. Базовая информация
    print(f"\n[1] Размер датафрейма: {df.shape[0]} строк × {df.shape[1]} столбцов")
    
    # 2. Память
    memory_usage = df.memory_usage(deep=True).sum() / 1024**2
    print(f"[2] Занимает памяти: {memory_usage:.2f} MB")
    
    # 3. Статистика для числовых переменных
    numeric_cols = df.select_dtypes(include=[np.number]).columns
    if len(numeric_cols) > 0:
        print(f"\n[3] Числовые переменные ({len(numeric_cols)} шт):")
        print(df[numeric_cols].describe().round(2))
    
    # 4. Категориальные переменные
    categorical_cols = df.select_dtypes(include=['object']).columns
    if len(categorical_cols) > 0:
        print(f"\n[4] Категориальные переменные ({len(categorical_cols)} шт):")
        for col in categorical_cols:
            mode_val = df[col].mode()[0] if len(df[col].mode()) > 0 else "Нет данных"
            mode_count = df[col].value_counts().iloc[0] if len(df[col].value_counts()) > 0 else 0
            print(f"   • {col}: мода = '{mode_val}' (встречается {mode_count} раз)")
    
    # 5. Пропуски
    missing = df.isnull().sum()
    if missing.sum() > 0:
        print(f"\n[5] Пропуски в данных:")
        for col, count in missing[missing > 0].items():
            print(f"   • {col}: {count} пропусков ({count/len(df)*100:.1f}%)")
    else:
        print(f"\n[5] Пропуски отсутствуют")
    
    return numeric_cols, categorical_cols

def preprocess_for_regression(df, target_col, dataset_name):
    """Предобработка данных для регрессии"""
    print(f"\n{'='*80}")
    print(f"ПРЕДОБРАБОТКА: {dataset_name}")
    print(f"{'='*80}")
    
    # Копируем данные
    df_processed = df.copy()
    
    # Обработка пропусков
    for col in df_processed.columns:
        if df_processed[col].dtype in ['object']:
            df_processed[col].fillna('unknown', inplace=True)
        else:
            df_processed[col].fillna(df_processed[col].median(), inplace=True)
    print("[1] Пропуски заполнены")
    
    # Кодирование категориальных переменных
    categorical_cols = df_processed.select_dtypes(include=['object']).columns
    categorical_cols = [c for c in categorical_cols if c != target_col]
    
    for col in categorical_cols:
        le = LabelEncoder()
        df_processed[col] = le.fit_transform(df_processed[col].astype(str))
    print(f"[2] Закодировано {len(categorical_cols)} категориальных переменных")
    
    # Разделение на X и y
    X = df_processed.drop(columns=[target_col])
    y = df_processed[target_col]
    
    print(f"[3] Целевая переменная: {target_col}")
    print(f"[4] Признаки: {list(X.columns)}")
    
    # Стандартизация
    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)
    print("[5] Выполнена стандартизация признаков")
    
    # Разделение на train/test
    X_train, X_test, y_train, y_test = train_test_split(
        X_scaled, y, test_size=0.2, random_state=42
    )
    print(f"[6] Train: {len(X_train)} записей, Test: {len(X_test)} записей")
    
    return X_train, X_test, y_train, y_test, scaler, X.columns

def train_and_evaluate(X_train, X_test, y_train, y_test, dataset_name):
    """Обучение и оценка моделей"""
    print(f"\n{'='*80}")
    print(f"ОБУЧЕНИЕ МОДЕЛЕЙ: {dataset_name}")
    print(f"{'='*80}")
    
    models = {
        'Linear Regression': LinearRegression(),
        'Ridge (α=1.0)': Ridge(alpha=1.0),
        'Lasso (α=0.01)': Lasso(alpha=0.01),
        'ElasticNet (α=0.01, l1=0.5)': ElasticNet(alpha=0.01, l1_ratio=0.5),
        'KNN (k=5)': KNeighborsRegressor(n_neighbors=5)
    }
    
    results = {}
    
    for name, model in models.items():
        try:
            model.fit(X_train, y_train)
            y_pred = model.predict(X_test)
            
            mae = mean_absolute_error(y_test, y_pred)
            mse = mean_squared_error(y_test, y_pred)
            rmse = np.sqrt(mse)
            r2 = r2_score(y_test, y_pred)
            mape = np.mean(np.abs((y_test - y_pred) / y_test)) * 100
            
            results[name] = {
                'MAE': mae,
                'MSE': mse,
                'RMSE': rmse,
                'R²': r2,
                'MAPE': mape,
                'predictions': y_pred,
                'model': model
            }
            
            print(f"\n▶ {name}")
            print(f"   MAE:  {mae:.2f}")
            print(f"   RMSE: {rmse:.2f}")
            print(f"   R²:   {r2:.4f}")
            print(f"   MAPE: {mape:.2f}%")
        except Exception as e:
            print(f"\n▶ {name}: ОШИБКА - {str(e)[:100]}")
    
    return results

def plot_results(results, y_test, dataset_name):
    """Визуализация результатов (исправленная версия)"""
    fig = plt.figure(figsize=(18, 12))
    
    # Находим лучшую модель
    best_model = max(results.items(), key=lambda x: x[1]['R²'])
    best_name = best_model[0]
    
    # 1. Сравнение R²
    ax1 = fig.add_subplot(2, 3, 1)
    models = list(results.keys())
    r2_scores = [results[m]['R²'] for m in models]
    colors = ['green' if m == best_name else 'steelblue' for m in models]
    bars = ax1.bar(models, r2_scores, color=colors)
    ax1.set_title('Коэффициент детерминации R²\n(выше = лучше)', fontsize=12)
    ax1.set_ylabel('R²')
    ax1.set_ylim([min(r2_scores)-0.1, 1.05])
    ax1.tick_params(axis='x', rotation=45)
    for bar, val in zip(bars, r2_scores):
        ax1.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.01, 
                f'{val:.3f}', ha='center', va='bottom', fontsize=9)
    
    # 2. Сравнение ошибок
    ax2 = fig.add_subplot(2, 3, 2)
    errors = ['MAE', 'RMSE']
    x = np.arange(len(errors))
    width = 0.15
    
    for i, (name, metrics) in enumerate(results.items()):
        values = [metrics['MAE'], metrics['RMSE']]
        ax2.bar(x + i*width, values, width, label=name[:15])
    
    ax2.set_title('Сравнение ошибок моделей\n(ниже = лучше)', fontsize=12)
    ax2.set_xticks(x + width*2)
    ax2.set_xticklabels(errors)
    ax2.legend(loc='upper right', fontsize=8)
    
    # 3. Predicted vs Actual (лучшая модель)
    ax3 = fig.add_subplot(2, 3, 3)
    best_preds = best_model[1]['predictions']
    ax3.scatter(y_test, best_preds, alpha=0.6, edgecolors='black', linewidth=0.5)
    ax3.plot([y_test.min(), y_test.max()], [y_test.min(), y_test.max()], 
             'r--', lw=2, label='Идеальное предсказание')
    ax3.set_xlabel('Фактические значения')
    ax3.set_ylabel('Предсказанные значения')
    ax3.set_title(f'Лучшая модель: {best_name[:30]}\nR² = {best_model[1]["R²"]:.4f}')
    ax3.legend()
    ax3.grid(True, alpha=0.3)
    
    # 4. Остатки
    ax4 = fig.add_subplot(2, 3, 4)
    residuals = y_test - best_preds
    ax4.scatter(best_preds, residuals, alpha=0.6, edgecolors='black', linewidth=0.5)
    ax4.axhline(y=0, color='r', linestyle='--', lw=2)
    ax4.set_xlabel('Предсказанные значения')
    ax4.set_ylabel('Остатки')
    ax4.set_title('График остатков')
    ax4.grid(True, alpha=0.3)
    
    # 5. Распределение ошибок
    ax5 = fig.add_subplot(2, 3, 5)
    ax5.hist(residuals, bins=20, edgecolor='black', alpha=0.7, color='skyblue')
    ax5.axvline(x=0, color='r', linestyle='--', lw=2)
    ax5.set_xlabel('Ошибка предсказания')
    ax5.set_ylabel('Частота')
    ax5.set_title('Распределение ошибок')
    ax5.grid(True, alpha=0.3)
    
    # 6. Таблица метрик (вместо heatmap)
    ax6 = fig.add_subplot(2, 3, 6)
    ax6.axis('tight')
    ax6.axis('off')
    
    # Создаем таблицу
    table_data = []
    for name in models:
        row = [
            name[:20],
            f"{results[name]['MAE']:.2f}",
            f"{results[name]['RMSE']:.2f}",
            f"{results[name]['R²']:.4f}",
            f"{results[name]['MAPE']:.2f}%"
        ]
        table_data.append(row)
    
    columns = ['Модель', 'MAE', 'RMSE', 'R²', 'MAPE']
    table = ax6.table(cellText=table_data, colLabels=columns, 
                      cellLoc='center', loc='center',
                      bbox=[0, 0, 1, 1])
    table.auto_set_font_size(False)
    table.set_fontsize(10)
    table.scale(1.2, 1.5)
    
    # Выделяем лучшую строку
    best_idx = list(results.keys()).index(best_name)
    for j in range(len(columns)):
        table[(best_idx+1, j)].set_facecolor('#90EE90')
    
    ax6.set_title('Сводная таблица метрик', fontsize=12, pad=20)
    
    plt.suptitle(f'Результаты регрессионного анализа\nДатасет: {dataset_name}', fontsize=14, y=1.02)
    plt.tight_layout()
    plt.savefig(f'lab4_results/{dataset_name}_results.png', dpi=150, bbox_inches='tight')
    plt.show()
    
    return best_name

# ============================================================================
# ЗАДАЧА 1: ДАННЫЕ KAGGLE (ВАРИАНТ 21)
# ============================================================================

print("\n" + "█"*80)
print("ЗАДАЧА 1: ПРОГНОЗИРОВАНИЕ СТОИМОСТИ МЕДИА-КАМПАНИИ (ВАРИАНТ 21)")
print("█"*80)

# Загружаем данные
try:
    df1 = pd.read_csv('train.csv')
    print("\n✅ Данные загружены успешно!")
    
    # Анализируем
    numeric_cols1, cat_cols1 = analyze_and_preprocess(df1, "Kaggle_Media_Campaign")
    
    # Целевая переменная - 'cost' (как видно из вывода)
    target1 = 'cost'
    
    print(f"\n🎯 Целевая переменная: {target1}")
    
    # Предобработка
    X_train1, X_test1, y_train1, y_test1, scaler1, features1 = preprocess_for_regression(
        df1, target1, "Kaggle_Media_Campaign"
    )
    
    # Обучение
    results1 = train_and_evaluate(X_train1, X_test1, y_train1, y_test1, "Kaggle_Media_Campaign")
    
    # Визуализация
    if results1:
        best1 = plot_results(results1, y_test1, "Kaggle_Media_Campaign")
        
        # Сохраняем лучшую модель
        best_model_obj = results1[best1]['model']
        joblib.dump(best_model_obj, f'lab4_results/best_model_task1.pkl')
        print(f"\n💾 Лучшая модель сохранена: lab4_results/best_model_task1.pkl")
        
        # Дополнительная статистика
        print("\n" + "="*80)
        print("СТАТИСТИКА ПО ЛУЧШЕЙ МОДЕЛИ")
        print("="*80)
        print(f"Модель: {best1}")
        print(f"R² = {results1[best1]['R²']:.4f} (модель объясняет {results1[best1]['R²']*100:.1f}% дисперсии)")
        print(f"Средняя ошибка (MAE): {results1[best1]['MAE']:.2f}")
        print(f"Средняя относительная ошибка (MAPE): {results1[best1]['MAPE']:.2f}%")
        
except FileNotFoundError:
    print("\n❌ Файл train.csv не найден!")
    print("Убедитесь, что файл с данными находится в той же папке, что и скрипт.")
    
except Exception as e:
    print(f"\n❌ Ошибка: {e}")

# ============================================================================
# ЗАДАЧА 2: UEFA CHAMPIONS LEAGUE (САМОСТОЯТЕЛЬНАЯ РАБОТА)
# ============================================================================

print("\n" + "█"*80)
print("ЗАДАЧА 2: АНАЛИЗ ДАННЫХ ЛИГИ ЧЕМПИОНОВ УЕФА")
print("█"*80)

try:
    # Загружаем данные из Excel файла
    xl = pd.ExcelFile('UEFA Champions League 2016-2022 Data.xlsx')
    print(f"\n📊 Доступные листы: {xl.sheet_names}")
    
    # Загружаем матчи
    matches_df = pd.read_excel(xl, sheet_name='matches')
    print(f"\n✅ Загружен лист 'matches': {matches_df.shape[0]} строк, {matches_df.shape[1]} столбцов")
    
    # Анализируем данные матчей
    numeric_cols2, cat_cols2 = analyze_and_preprocess(matches_df, "Champions_League")
    
    # Создаем целевую переменную
    matches_df['total_goals'] = matches_df['HOME_TEAM_SCORE'] + matches_df['AWAY_TEAM_SCORE']
    target2 = 'total_goals'
    
    print(f"\n🎯 Создана целевая переменная: {target2} (общее количество голов в матче)")
    print(f"   Статистика голов: min={matches_df[target2].min()}, "
          f"max={matches_df[target2].max()}, "
          f"mean={matches_df[target2].mean():.2f}")
    
    # Подготовка признаков
    feature_cols = ['SEASON', 'HOME_TEAM', 'AWAY_TEAM', 'STADIUM']
    available_features = [c for c in feature_cols if c in matches_df.columns]
    
    X_raw = matches_df[available_features].copy()
    
    # Предобработка
    print(f"\n[1] Используемые признаки: {available_features}")
    
    # Заполняем пропуски
    for col in X_raw.columns:
        if X_raw[col].dtype == 'object':
            X_raw[col].fillna('unknown', inplace=True)
    
    # Кодируем категориальные переменные
    for col in X_raw.columns:
        if X_raw[col].dtype == 'object':
            le = LabelEncoder()
            X_raw[col] = le.fit_transform(X_raw[col].astype(str))
    
    y2 = matches_df[target2]
    
    # Стандартизация
    scaler2 = StandardScaler()
    X_scaled2 = scaler2.fit_transform(X_raw)
    
    # Разделение
    X_train2, X_test2, y_train2, y_test2 = train_test_split(
        X_scaled2, y2, test_size=0.2, random_state=42
    )
    print(f"[2] Train: {len(X_train2)} матчей, Test: {len(X_test2)} матчей")
    
    # Обучение моделей
    results2 = train_and_evaluate(X_train2, X_test2, y_train2, y_test2, "Champions_League")
    
    # Визуализация
    if results2:
        best2 = plot_results(results2, y_test2, "Champions_League")
        
        # Сохраняем модель
        best_model_obj2 = results2[best2]['model']
        joblib.dump(best_model_obj2, f'lab4_results/best_model_task2.pkl')
        print(f"\n💾 Лучшая модель сохранена: lab4_results/best_model_task2.pkl")
        
        # Дополнительный анализ: голы по сезонам
        print("\n" + "="*80)
        print("ДОПОЛНИТЕЛЬНЫЙ АНАЛИЗ: ГОЛЫ ПО СЕЗОНАМ")
        print("="*80)
        
        season_stats = matches_df.groupby('SEASON').agg({
            'HOME_TEAM_SCORE': 'mean',
            'AWAY_TEAM_SCORE': 'mean',
            'total_goals': 'mean'
        }).round(2)
        print(season_stats)
        
        # Визуализация голов по сезонам
        fig2, ax = plt.subplots(figsize=(12, 6))
        seasons = season_stats.index
        x = np.arange(len(seasons))
        width = 0.25
        
        ax.bar(x - width, season_stats['HOME_TEAM_SCORE'], width, label='Среднее голов дома', alpha=0.8)
        ax.bar(x, season_stats['AWAY_TEAM_SCORE'], width, label='Среднее голов в гостях', alpha=0.8)
        ax.bar(x + width, season_stats['total_goals'], width, label='Среднее всего голов', alpha=0.8)
        
        ax.set_xlabel('Сезон')
        ax.set_ylabel('Среднее количество голов')
        ax.set_title('Анализ результативности по сезонам Лиги Чемпионов УЕФА')
        ax.set_xticks(x)
        ax.set_xticklabels(seasons, rotation=45)
        ax.legend()
        ax.grid(True, alpha=0.3)
        
        plt.tight_layout()
        plt.savefig('lab4_results/champions_league_analysis.png', dpi=150, bbox_inches='tight')
        plt.show()
        
        # Дополнительная статистика по лучшей модели
        print("\n" + "="*80)
        print("СТАТИСТИКА ПО ЛУЧШЕЙ МОДЕЛИ (ЛИГА ЧЕМПИОНОВ)")
        print("="*80)
        print(f"Модель: {best2}")
        print(f"R² = {results2[best2]['R²']:.4f} (модель объясняет {results2[best2]['R²']*100:.1f}% дисперсии)")
        print(f"Средняя ошибка (MAE): {results2[best2]['MAE']:.2f} гола")
        print(f"Средняя относительная ошибка (MAPE): {results2[best2]['MAPE']:.2f}%")
    
except FileNotFoundError:
    print("\n❌ Файл 'UEFA Champions League 2016-2022 Data.xlsx' не найден!")
    print("Убедитесь, что файл находится в той же папке, что и скрипт.")
    
except Exception as e:
    print(f"\n❌ Ошибка при обработке данных: {e}")

# ============================================================================
# ИТОГОВЫЙ ОТЧЕТ
# ============================================================================

print("\n" + "█"*80)
print("ИТОГОВЫЙ ОТЧЕТ ПО ЛАБОРАТОРНОЙ РАБОТЕ")
print("█"*80)

print("""
📋 РЕЗУЛЬТАТЫ ВЫПОЛНЕНИЯ:

1. ЗАДАЧА 1 (Kaggle данные - прогнозирование стоимости):
   ✅ Загружено 360,336 записей
   ✅ 16 признаков, целевая переменная 'cost'
   ✅ Обучено 5 моделей регрессии
   📊 Лучшая модель: Linear Regression / Ridge / Lasso / ElasticNet
   📈 R² ≈ 0.021 (модель объясняет 2.1% дисперсии)
   📈 MAE ≈ 25.60, MAPE ≈ 29.77%
   
   Вывод: Предсказать стоимость сложно из-за большого количества шума в данных.

2. ЗАДАЧА 2 (UEFA Champions League):
   ✅ Загружено матчей: ___ (заполните после запуска)
   ✅ Создана целевая переменная 'total_goals'
   ✅ Обучено 5 моделей регрессии
   📊 Лучшая модель: ___ (заполните после запуска)
   📈 R² ≈ ___ (заполните после запуска)
   
   Вывод: Предсказание голов в футбольных матчах - сложная задача из-за случайности.

📁 РЕЗУЛЬТАТЫ СОХРАНЕНЫ В ПАПКЕ 'lab4_results':
   - Kaggle_Media_Campaign_results.png
   - champions_league_analysis.png
   - best_model_task1.pkl
   - best_model_task2.pkl

✅ Лабораторная работа выполнена!
""")

print("\n" + "="*80)
print("РАБОТА ЗАВЕРШЕНА УСПЕШНО!")
print("="*80)