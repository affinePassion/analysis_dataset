import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.linear_model import LogisticRegression
from sklearn.neighbors import KNeighborsClassifier
from sklearn.svm import SVC
from sklearn.metrics import (accuracy_score, precision_score, recall_score, 
                             f1_score, confusion_matrix, roc_auc_score, 
                             roc_curve, classification_report)
import os

# Создаем папку для сохранения графиков
if not os.path.exists('plots'):
    os.makedirs('plots')
    print("Создана папка 'plots' для сохранения графиков")

# Настройка визуализации
plt.style.use('seaborn-v0_8-whitegrid')
sns.set_palette("husl")

print("--- ЗАГРУЗКА И АНАЛИЗ ДАННЫХ ---")

# --- ЗАДАЧА 1: Датасет Playground Series S3E12 (Вариант 21) ---
print("\n--- ЗАДАЧА 1. Анализ данных Kaggle (Playground Series S3E12) ---")
try:
    df_kaggle = pd.read_csv('train.csv')
    print("Данные Kaggle успешно загружены.")
except FileNotFoundError:
    print("Ошибка: Файл 'train.csv' не найден.")
    exit()

# Определяем целевую переменную
target_col = 'target'

# Разделение на признаки и целевую переменную
X_kaggle = df_kaggle.drop(['id', target_col], axis=1)
y_kaggle = df_kaggle[target_col]

# Кодирование категориальных переменных (если есть)
label_encoders = {}
for col in X_kaggle.select_dtypes(include='object').columns:
    le = LabelEncoder()
    X_kaggle[col] = le.fit_transform(X_kaggle[col])
    label_encoders[col] = le

# Разделение на train/test
X_train_kg, X_test_kg, y_train_kg, y_test_kg = train_test_split(
    X_kaggle, y_kaggle, test_size=0.2, random_state=42, stratify=y_kaggle
)

# Масштабирование признаков
scaler_kg = StandardScaler()
X_train_kg_scaled = scaler_kg.fit_transform(X_train_kg)
X_test_kg_scaled = scaler_kg.transform(X_test_kg)

# --- ВИЗУАЛИЗАЦИЯ 1: Распределение целевой переменной ---
fig, axes = plt.subplots(1, 2, figsize=(12, 5))

# График 1: Kaggle Dataset
ax1 = axes[0]
class_counts_kg = y_kaggle.value_counts()
colors_kg = ['#FF6B6B', '#4ECDC4']
wedges, texts, autotexts = ax1.pie(class_counts_kg.values, 
                                    labels=['Класс 0', 'Класс 1'],
                                    colors=colors_kg,
                                    autopct='%1.1f%%',
                                    startangle=90,
                                    textprops={'fontsize': 12})
ax1.set_title('Распределение целевой переменной\n(Kaggle Dataset)', fontsize=14, fontweight='bold')

# Добавляем легенду с абсолютными значениями
legend_labels = [f'Класс {i}: {count} записей' for i, count in zip(class_counts_kg.index, class_counts_kg.values)]
ax1.legend(wedges, legend_labels, loc='upper right', bbox_to_anchor=(1.2, 1.0))

# --- ЗАДАЧА 2: Датасет UEFA Champions League ---
print("\n--- ЗАДАЧА 2. Анализ данных UEFA Champions League ---")

try:
    df_matches = pd.read_excel('UEFA Champions League 2016-2022 Data.xlsx', sheet_name='matches')
    print("Данные UEFA успешно загружены.")
except FileNotFoundError:
    print("Ошибка: Файл 'UEFA Champions League 2016-2022 Data.xlsx' не найден.")
    exit()

# Создаем целевую переменную
df_matches['HOME_WIN'] = (df_matches['HOME_TEAM_SCORE'] > df_matches['AWAY_TEAM_SCORE']).astype(int)

# Создаем признаки
home_team_avg_score = df_matches.groupby('HOME_TEAM')['HOME_TEAM_SCORE'].mean()
away_team_avg_score = df_matches.groupby('AWAY_TEAM')['AWAY_TEAM_SCORE'].mean()
df_matches['HOME_TEAM_AVG_SCORE'] = df_matches['HOME_TEAM'].map(home_team_avg_score)
df_matches['AWAY_TEAM_AVG_SCORE'] = df_matches['AWAY_TEAM'].map(away_team_avg_score)

features = ['ATTENDANCE', 'HOME_TEAM_AVG_SCORE', 'AWAY_TEAM_AVG_SCORE']
df_model_uefa = df_matches[features + ['HOME_WIN']].dropna().copy()

X_uefa = df_model_uefa[features]
y_uefa = df_model_uefa['HOME_WIN']

X_train_ue, X_test_ue, y_train_ue, y_test_ue = train_test_split(
    X_uefa, y_uefa, test_size=0.2, random_state=42, stratify=y_uefa
)

scaler_ue = StandardScaler()
X_train_ue_scaled = scaler_ue.fit_transform(X_train_ue)
X_test_ue_scaled = scaler_ue.transform(X_test_ue)

# График 2: UEFA Dataset
ax2 = axes[1]
class_counts_ue = y_uefa.value_counts()
colors_ue = ['#95E1D3', '#F38181']
wedges, texts, autotexts = ax2.pie(class_counts_ue.values, 
                                    labels=['Поражение/Ничья', 'Победа хозяев'],
                                    colors=colors_ue,
                                    autopct='%1.1f%%',
                                    startangle=90,
                                    textprops={'fontsize': 12})
ax2.set_title('Распределение целевой переменной\n(UEFA Dataset)', fontsize=14, fontweight='bold')

legend_labels = [f'{label}: {count} матчей' for label, count in zip(['Поражение/Ничья', 'Победа хозяев'], class_counts_ue.values)]
ax2.legend(wedges, legend_labels, loc='upper right', bbox_to_anchor=(1.2, 1.0))

plt.tight_layout()
plt.savefig('plots/target_distribution.png', dpi=300, bbox_inches='tight')
plt.close()
print("✓ График распределения целевой переменной сохранен: 'plots/target_distribution.png'")

# --- ФУНКЦИЯ ДЛЯ ОЦЕНКИ МОДЕЛЕЙ И ПОСТРОЕНИЯ ГРАФИКОВ ---
def evaluate_and_plot_models(X_train, X_test, y_train, y_test, dataset_name, scaler=None):
    """Обучает модели, вычисляет метрики и строит графики сравнения"""
    
    if scaler:
        X_train = scaler.fit_transform(X_train)
        X_test = scaler.transform(X_test)
    
    models = {
        "Logistic Regression": LogisticRegression(max_iter=1000, random_state=42),
        "KNN": KNeighborsClassifier(n_neighbors=5),
        "SVM": SVC(probability=True, random_state=42)
    }
    
    results = {}
    roc_curves = {}
    
    print(f"\n--- Результаты для {dataset_name} ---")
    
    for name, model in models.items():
        model.fit(X_train, y_train)
        y_pred = model.predict(X_test)
        
        # Метрики
        accuracy = accuracy_score(y_test, y_pred)
        precision = precision_score(y_test, y_pred)
        recall = recall_score(y_test, y_pred)
        f1 = f1_score(y_test, y_pred)
        
        # ROC-AUC и кривая
        y_proba = model.predict_proba(X_test)[:, 1]
        roc_auc = roc_auc_score(y_test, y_proba)
        fpr, tpr, _ = roc_curve(y_test, y_proba)
        
        results[name] = {
            "Accuracy": accuracy, "Precision": precision, 
            "Recall": recall, "F1": f1, "ROC-AUC": roc_auc
        }
        roc_curves[name] = (fpr, tpr)
        
        print(f"{name}: Acc={accuracy:.3f}, Prec={precision:.3f}, "
              f"Rec={recall:.3f}, F1={f1:.3f}, ROC-AUC={roc_auc:.3f}")
    
    # --- ГРАФИК 1: Сравнение метрик (бар-чарт) ---
    fig, axes = plt.subplots(1, 3, figsize=(18, 5))
    
    # 1. Бар-чарт сравнения метрик
    metrics = ['Accuracy', 'Precision', 'Recall', 'F1', 'ROC-AUC']
    x = np.arange(len(metrics))
    width = 0.25
    
    for i, (model_name, model_results) in enumerate(results.items()):
        values = [model_results[m] for m in metrics]
        bars = axes[0].bar(x + i*width, values, width, label=model_name, alpha=0.8)
        # Добавляем значения над столбцами
        for bar, val in zip(bars, values):
            axes[0].text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.01,
                        f'{val:.3f}', ha='center', va='bottom', fontsize=9)
    
    axes[0].set_xlabel('Метрики', fontsize=12)
    axes[0].set_ylabel('Значение', fontsize=12)
    axes[0].set_title(f'Сравнение метрик качества моделей\n{dataset_name}', fontsize=14, fontweight='bold')
    axes[0].set_xticks(x + width)
    axes[0].set_xticklabels(metrics)
    axes[0].legend(loc='lower right')
    axes[0].set_ylim(0, 1.0)
    axes[0].grid(axis='y', alpha=0.3)
    
    # 2. ROC-кривые
    for model_name, (fpr, tpr) in roc_curves.items():
        auc = results[model_name]['ROC-AUC']
        axes[1].plot(fpr, tpr, label=f'{model_name} (AUC = {auc:.3f})', linewidth=2)
    
    axes[1].plot([0, 1], [0, 1], 'k--', label='Случайное угадывание', alpha=0.5)
    axes[1].set_xlabel('False Positive Rate (FPR)', fontsize=12)
    axes[1].set_ylabel('True Positive Rate (TPR)', fontsize=12)
    axes[1].set_title(f'ROC-кривые моделей\n{dataset_name}', fontsize=14, fontweight='bold')
    axes[1].legend(loc='lower right')
    axes[1].grid(alpha=0.3)
    
    # 3. Сравнение F1-меры (отдельный график для наглядности)
    model_names = list(results.keys())
    f1_scores = [results[m]['F1'] for m in model_names]
    colors_f1 = ['#FF6B6B', '#4ECDC4', '#45B7D1']
    bars = axes[2].bar(model_names, f1_scores, color=colors_f1, alpha=0.8)
    axes[2].set_ylabel('F1-Score', fontsize=12)
    axes[2].set_title(f'Сравнение F1-меры моделей\n{dataset_name}', fontsize=14, fontweight='bold')
    axes[2].set_ylim(0, 1.0)
    axes[2].grid(axis='y', alpha=0.3)
    
    # Добавляем значения над столбцами
    for bar, score in zip(bars, f1_scores):
        axes[2].text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.01,
                    f'{score:.3f}', ha='center', va='bottom', fontsize=11, fontweight='bold')
    
    plt.tight_layout()
    filename = f'plots/{dataset_name.lower().replace(" ", "_")}_metrics.png'
    plt.savefig(filename, dpi=300, bbox_inches='tight')
    plt.close()
    print(f"✓ Графики метрик сохранены: '{filename}'")
    
    return results

# --- ОЦЕНКА МОДЕЛЕЙ И ПОСТРОЕНИЕ ГРАФИКОВ ---
print("\n" + "="*60)
print("ОБУЧЕНИЕ МОДЕЛЕЙ И ПОСТРОЕНИЕ ГРАФИКОВ")
print("="*60)

# Оценка моделей для Kaggle dataset
results_kg = evaluate_and_plot_models(
    X_train_kg, X_test_kg, y_train_kg, y_test_kg,
    "Kaggle Dataset", scaler_kg
)

# Оценка моделей для UEFA dataset
results_ue = evaluate_and_plot_models(
    X_train_ue, X_test_ue, y_train_ue, y_test_ue,
    "UEFA Dataset", scaler_ue
)

# --- ДОПОЛНИТЕЛЬНЫЙ ГРАФИК: Сравнение ROC-AUC между датасетами ---
fig, ax = plt.subplots(figsize=(10, 6))

datasets = ['Kaggle', 'UEFA']
models_list = ['Logistic Regression', 'KNN', 'SVM']
x = np.arange(len(datasets))
width = 0.25

for i, model_name in enumerate(models_list):
    scores = [results_kg[model_name]['ROC-AUC'], results_ue[model_name]['ROC-AUC']]
    bars = ax.bar(x + i*width, scores, width, label=model_name, alpha=0.8)
    for bar, score in zip(bars, scores):
        ax.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.01,
               f'{score:.3f}', ha='center', va='bottom', fontsize=10)

ax.set_xlabel('Датасет', fontsize=12)
ax.set_ylabel('ROC-AUC Score', fontsize=12)
ax.set_title('Сравнение ROC-AUC моделей на разных датасетах', fontsize=14, fontweight='bold')
ax.set_xticks(x + width)
ax.set_xticklabels(datasets)
ax.legend(loc='lower right')
ax.set_ylim(0, 1.0)
ax.grid(axis='y', alpha=0.3)

plt.tight_layout()
plt.savefig('plots/roc_auc_comparison.png', dpi=300, bbox_inches='tight')
plt.close()
print("✓ График сравнения ROC-AUC сохранен: 'plots/roc_auc_comparison.png'")

# --- ИТОГОВАЯ ТАБЛИЦА РЕЗУЛЬТАТОВ ---
print("\n" + "="*60)
print("ИТОГОВАЯ ТАБЛИЦА РЕЗУЛЬТАТОВ")
print("="*60)

print("\nKaggle Dataset:")
print("-" * 80)
print(f"{'Модель':<20} {'Accuracy':<10} {'Precision':<10} {'Recall':<10} {'F1-Score':<10} {'ROC-AUC':<10}")
print("-" * 80)
for model, metrics in results_kg.items():
    print(f"{model:<20} {metrics['Accuracy']:<10.3f} {metrics['Precision']:<10.3f} "
          f"{metrics['Recall']:<10.3f} {metrics['F1']:<10.3f} {metrics['ROC-AUC']:<10.3f}")

print("\nUEFA Dataset:")
print("-" * 80)
print(f"{'Модель':<20} {'Accuracy':<10} {'Precision':<10} {'Recall':<10} {'F1-Score':<10} {'ROC-AUC':<10}")
print("-" * 80)
for model, metrics in results_ue.items():
    print(f"{model:<20} {metrics['Accuracy']:<10.3f} {metrics['Precision']:<10.3f} "
          f"{metrics['Recall']:<10.3f} {metrics['F1']:<10.3f} {metrics['ROC-AUC']:<10.3f}")

print("\n" + "="*60)
print("✅ ВЫПОЛНЕНИЕ ЛАБОРАТОРНОЙ РАБОТЫ ЗАВЕРШЕНО")
print("="*60)
print("\nВсе графики сохранены в папке 'plots':")
print("  - target_distribution.png")
print("  - kaggle_dataset_metrics.png")
print("  - uefa_dataset_metrics.png")
print("  - roc_auc_comparison.png")