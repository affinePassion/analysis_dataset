import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sqlalchemy import create_engine

DB_CONFIG = {
        'host': 'povt-cluster.tstu.tver.ru',
        'user': 'mpi',
        'password': '135a1',
        'port': '5432',
        'database': 'uefa_champions_league_20'
}
connection_string = f"postgresql://{DB_CONFIG['user']}:{DB_CONFIG['password']}@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}"
    
engine = create_engine(connection_string)

# Загружаем таблицу matches
df = pd.read_sql("SELECT * FROM matches", engine)
print("=== Самостоятельная часть: UEFA Champions League ===")
print(f"Строк: {df.shape[0]}, столбцов: {df.shape[1]}\n")
print("Столбцы в таблице matches:", df.columns.tolist())

# ---------- Добавляем вычисляемый столбец ----------
# Убедимся, что названия столбцов соответствуют вашим
home_score_col = 'HOME_TEAM_SCORE'
away_score_col = 'AWAY_TEAM_SCORE'
df['total_goals'] = df[home_score_col] + df[away_score_col]

# ---------- 2. Кодирование категориальных переменных ----------
df_encoded = df.copy()

# LabelEncoder для сезона
le_season = LabelEncoder()
df_encoded['season_encoded'] = le_season.fit_transform(df_encoded['SEASON'])

# LabelEncoder для команд (много уникальных, но для корреляции можно)
le_home = LabelEncoder()
le_away = LabelEncoder()
df_encoded['home_team_enc'] = le_home.fit_transform(df_encoded['HOME_TEAM'])
df_encoded['away_team_enc'] = le_away.fit_transform(df_encoded['AWAY_TEAM'])

# LabelEncoder для стадиона
le_stadium = LabelEncoder()
df_encoded['stadium_enc'] = le_stadium.fit_transform(df_encoded['STADIUM'])

print("\nКатегориальные переменные закодированы (season_encoded, home_team_enc, away_team_enc, stadium_enc).")

# ---------- 3. EDA числовых переменных ----------
numeric_cols = df.select_dtypes(include=[np.number]).columns.tolist()
if 'total_goals' not in numeric_cols:
    numeric_cols.append('total_goals')
eda_num = pd.DataFrame(index=numeric_cols)
for col in numeric_cols:
    series = df[col].dropna()
    eda_num.loc[col, 'доля_пропусков'] = df[col].isna().mean()
    eda_num.loc[col, 'min'] = series.min()
    eda_num.loc[col, 'max'] = series.max()
    eda_num.loc[col, 'mean'] = series.mean()
    eda_num.loc[col, 'median'] = series.median()
    eda_num.loc[col, 'дисперсия'] = series.var()
    eda_num.loc[col, '0.1_квантиль'] = series.quantile(0.1)
    eda_num.loc[col, '0.9_квантиль'] = series.quantile(0.9)
    eda_num.loc[col, 'Q1'] = series.quantile(0.25)
    eda_num.loc[col, 'Q3'] = series.quantile(0.75)
print("\n=== Числовые переменные ===")
print(eda_num)

# ---------- 4. EDA категориальных переменных ----------
categorical_cols = df.select_dtypes(include=['object']).columns.tolist()
eda_cat = pd.DataFrame(index=categorical_cols)
for col in categorical_cols:
    series = df[col].dropna()
    eda_cat.loc[col, 'доля_пропусков'] = df[col].isna().mean()
    eda_cat.loc[col, 'уникальных_значений'] = series.nunique()
    eda_cat.loc[col, 'мода'] = series.mode().iloc[0] if not series.mode().empty else np.nan
print("\n=== Категориальные переменные ===")
print(eda_cat)

# ---------- 5. Статистические гипотезы ----------
alpha = 0.05
print("\n=== Проверка гипотез ===")

# Гипотеза 1: среднее количество голов домашней команды отличается от гостевой
home_scores = df[home_score_col].dropna()
away_scores = df[away_score_col].dropna()
shapiro_home = stats.shapiro(home_scores)
shapiro_away = stats.shapiro(away_scores)
print(f"home_score нормальность p-value = {shapiro_home.pvalue:.4f}")
print(f"away_score нормальность p-value = {shapiro_away.pvalue:.4f}")
if shapiro_home.pvalue > alpha and shapiro_away.pvalue > alpha:
    t_stat, p_val = stats.ttest_ind(home_scores, away_scores, equal_var=False)
    test_name = "t-test"
else:
    u_stat, p_val = stats.mannwhitneyu(home_scores, away_scores, alternative='two-sided')
    test_name = "Mann-Whitney U"
print(f"{test_name} p-value = {p_val:.4f}")
if p_val < alpha:
    print("Гипотеза H0 отвергается: количество голов домашней и гостевой команд различается статистически значимо.")
else:
    print("Нет оснований отвергнуть H0: статистически значимых различий нет.")

# Гипотеза 2: количество голов в матчах с высокой посещаемостью отличается от матчей с низкой
attendance_median = df['ATTENDANCE'].median()
high_attendance = df[df['ATTENDANCE'] > attendance_median]['total_goals'].dropna()
low_attendance = df[df['ATTENDANCE'] <= attendance_median]['total_goals'].dropna()
shapiro_high = stats.shapiro(high_attendance)
shapiro_low = stats.shapiro(low_attendance)
print(f"\nВысокая посещаемость (> {attendance_median}) нормальность p-value = {shapiro_high.pvalue:.4f}")
print(f"Низкая посещаемость (≤ {attendance_median}) нормальность p-value = {shapiro_low.pvalue:.4f}")
if shapiro_high.pvalue > alpha and shapiro_low.pvalue > alpha:
    t_stat, p_val = stats.ttest_ind(high_attendance, low_attendance, equal_var=False)
    test_name = "t-test"
else:
    u_stat, p_val = stats.mannwhitneyu(high_attendance, low_attendance, alternative='two-sided')
    test_name = "Mann-Whitney U"
print(f"{test_name} p-value = {p_val:.4f}")
if p_val < alpha:
    print("Гипотеза H0 отвергается: количество голов в матчах с высокой и низкой посещаемостью различается.")
else:
    print("Нет оснований отвергнуть H0: различий в количестве голов не обнаружено.")

# ---------- 6. Корреляция признаков и целевого столбца ----------
target = 'total_goals'
# Выбираем признаки (числовые и закодированные)
features = [
    home_score_col, away_score_col, 'ATTENDANCE',
    'season_encoded', 'stadium_enc', 'home_team_enc', 'away_team_enc'
]
# Добавим закодированные команды, если нужно
features.extend(['home_team_enc', 'away_team_enc'])

# Убедимся, что все столбцы существуют
existing_features = [f for f in features if f in df_encoded.columns]
print("\nИспользуемые признаки для корреляции:", existing_features)

corr_matrix = df_encoded[existing_features + [target]].corr()
print("\n=== Корреляция с целевым столбцом total_goals ===")
print(corr_matrix[target].sort_values(ascending=False))

# Визуализация
plt.figure(figsize=(10, 10))
sns.heatmap(corr_matrix, annot=True, fmt='.2f', cmap='coolwarm', square=True,
            annot_kws={'size': 8}, cbar_kws={'shrink': 0.8})
plt.xticks(rotation=45, ha='right', fontsize=6)
plt.yticks(fontsize=6)
plt.title('Корреляционная матрица (UEFA Champions League)')
plt.tight_layout()
plt.savefig('Lab_2\correlation_matrix.png', dpi=300) 
plt.show()

print("\nСамостоятельная часть выполнена.")