import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats
from sklearn.preprocessing import LabelEncoder, OneHotEncoder

df = sns.load_dataset('mpg')
print("=== Общая часть: mpg ===")
print(f"Строк: {df.shape[0]}, столбцов: {df.shape[1]}\n")

numeric_cols = df.select_dtypes(include=[np.number]).columns.tolist()
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
print("=== Числовые переменные ===")
print(eda_num)


categorical_cols = df.select_dtypes(include=['object']).columns.tolist()
eda_cat = pd.DataFrame(index=categorical_cols)
for col in categorical_cols:
    series = df[col].dropna()
    eda_cat.loc[col, 'доля_пропусков'] = df[col].isna().mean()
    eda_cat.loc[col, 'уникальных_значений'] = series.nunique()
    eda_cat.loc[col, 'мода'] = series.mode().iloc[0] if not series.mode().empty else np.nan
print("\n=== Категориальные переменные ===")
print(eda_cat)

alpha = 0.05
print("\n=== Проверка гипотез ===")

# Гипотеза 1: Средний расход топлива у 4 и 8 цилиндров отличается
cyl_4 = df[df['cylinders'] == 4]['mpg'].dropna()
cyl_8 = df[df['cylinders'] == 8]['mpg'].dropna()
shapiro_4 = stats.shapiro(cyl_4)
shapiro_8 = stats.shapiro(cyl_8)
print(f"Цилиндры 4: нормальность p-value = {shapiro_4.pvalue:.4f}")
print(f"Цилиндры 8: нормальность p-value = {shapiro_8.pvalue:.4f}")
if shapiro_4.pvalue > alpha and shapiro_8.pvalue > alpha:
    t_stat, p_val = stats.ttest_ind(cyl_4, cyl_8, equal_var=False)
    test_name = "t-test"
else:
    u_stat, p_val = stats.mannwhitneyu(cyl_4, cyl_8, alternative='two-sided')
    test_name = "Mann-Whitney U"
print(f"{test_name} p-value = {p_val:.4f}")
if p_val < alpha:
    print("Гипотеза H0 отвергается: расход топлива у 4-цилиндровых и 8-цилиндровых автомобилей различается.")
else:
    print("Нет оснований отвергнуть H0: различий в расходе топлива не обнаружено.")


clean_data = df[['horsepower', 'mpg']].dropna()
corr, p_val_corr = stats.pearsonr(clean_data['horsepower'], clean_data['mpg'])
print(f"\nКорреляция horsepower и mpg: r = {corr:.4f}, p-value = {p_val_corr:.4f}")
if p_val_corr < alpha:
    print("Корреляция статистически значима, мощность влияет на расход топлива.")
else:
    print("Корреляция не значима.")


df_encoded = df.copy()
le_origin = LabelEncoder()
df_encoded['origin_encoded'] = le_origin.fit_transform(df_encoded['origin'])
print("\nКатегориальная переменная origin закодирована (LabelEncoder).")


target = 'mpg'
features = ['cylinders', 'displacement', 'horsepower', 'weight', 'acceleration', 'model_year', 'origin_encoded']
corr_matrix = df_encoded[features + [target]].corr()
print("\n=== Корреляция с целевым столбцом mpg ===")
print(corr_matrix[target].sort_values(ascending=False))


print("\n=== Реализация градиентного спуска ===")
X = df[['horsepower']].fillna(0).values
y = df['mpg'].fillna(0).values

X_mean, X_std = X.mean(), X.std()
y_mean, y_std = y.mean(), y.std()
X_norm = (X - X_mean) / X_std
y_norm = (y - y_mean) / y_std
y_norm = y_norm.reshape(-1, 1)  

def mse(y_true, y_pred):
    return np.mean((y_true - y_pred) ** 2)

def batch_gd(X, y, lr=0.01, epochs=1000):
    m = len(y)
    w, b = 0.0, 0.0
    losses = []
    for epoch in range(epochs):
        y_pred = w * X + b
        loss = mse(y, y_pred)
        losses.append(loss)
        dw = (2/m) * np.sum((y_pred - y) * X)
        db = (2/m) * np.sum(y_pred - y)
        w -= lr * dw
        b -= lr * db
    return w, b, losses

def sgd(X, y, lr=0.01, epochs=1000, batch_size=1):
    m = len(y)
    w, b = 0.0, 0.0
    losses = []
    for epoch in range(epochs):
        indices = np.random.permutation(m)
        X_shuffled = X[indices]
        y_shuffled = y[indices]
        for i in range(0, m, batch_size):
            X_batch = X_shuffled[i:i+batch_size]
            y_batch = y_shuffled[i:i+batch_size]
            y_pred_batch = w * X_batch + b
            dw = (2/len(y_batch)) * np.sum((y_pred_batch - y_batch) * X_batch)
            db = (2/len(y_batch)) * np.sum(y_pred_batch - y_batch)
            w -= lr * dw
            b -= lr * db
        y_pred_full = w * X + b
        losses.append(mse(y, y_pred_full))
    return w, b, losses

w_batch, b_batch, losses_batch = batch_gd(X_norm, y_norm, lr=0.005, epochs=500)
w_sgd, b_sgd, losses_sgd = sgd(X_norm, y_norm, lr=0.1, epochs=500, batch_size=1)

print(f"Обычный градиентный спуск: w = {w_batch:.4f}, b = {b_batch:.4f}")
print(f"Стохастический градиентный спуск:      w = {w_sgd:.4f}, b = {b_sgd:.4f}")

plt.plot(losses_batch, label='Обычный ГС')
plt.plot(losses_sgd, label='Стохастический ГС')
plt.xlabel('Эпоха')
plt.ylabel('MSE')
plt.legend()
plt.title('Сходимость градиентного спуска (mpg)')
plt.show()

print("\nОбщая часть выполнена.")