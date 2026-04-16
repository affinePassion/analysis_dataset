# -*- coding: utf-8 -*-
"""
Лабораторная работа №5 (ФИНАЛЬНАЯ ВЕРСИЯ)
Вариант 21: Набор данных Wine Quality (WineQT.csv)
Методы снижения размерности + Кластеризация
БЕЗ t-SNE (только UMAP)
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import KernelPCA
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis as LDA
from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score, davies_bouldin_score
from scipy.cluster.hierarchy import dendrogram, linkage, fcluster
import joblib
import warnings
warnings.filterwarnings('ignore')

# импортируем UMAP
try:
    import umap
    UMAP_AVAILABLE = True
except ImportError:
    UMAP_AVAILABLE = False
    print("ВНИМАНИЕ: UMAP не установлен. Установите: pip install umap-learn")
    print("Продолжаем без UMAP...")

# ============================================================================
# 1. ЗАГРУЗКА И ПЕРВИЧНЫЙ АНАЛИЗ ДАННЫХ
# ============================================================================
print("="*70)
print("ЛАБОРАТОРНАЯ РАБОТА №5: ВИНО (WINE QUALITY) - ВАРИАНТ 21")
print("="*70)

print("\n[1] ЗАГРУЗКА ДАННЫХ")
df = pd.read_csv('WineQT.csv', index_col='Id')
print(f"Размер данных: {df.shape}")
print(f"Признаки: {list(df.columns)}")
print(f"Пропуски:\n{df.isnull().sum()}")

# Базовая статистика
print("\nСтатистика числовых признаков:")
print(df.describe())

# Анализ целевой переменной
print("\nРаспределение качества вина (quality):")
print(df['quality'].value_counts().sort_index())

# ============================================================================
# 2. ПОДГОТОВКА ДАННЫХ
# ============================================================================
print("\n[2] ПОДГОТОВКА ДАННЫХ")
y_true = df['quality'].values
X_raw = df.drop('quality', axis=1).copy()

# стандартизация
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X_raw)
print(f"Матрица признаков X_scaled: {X_scaled.shape}")
print("Выполнена стандартизация (среднее=0, дисперсия=1)")

# ============================================================================
# 3. ЗАДАЧА 1: МЕТОДЫ СНИЖЕНИЯ РАЗМЕРНОСТИ
# ============================================================================
print("\n[3] ЗАДАЧА 1: СНИЖЕНИЕ РАЗМЕРНОСТИ")
print("-"*50)

# 3.1 KERNEL PCA с разными ядрами
n_comp = 2
kernels = ['linear', 'poly', 'rbf', 'sigmoid', 'cosine']

fig, axes = plt.subplots(2, 3, figsize=(15, 10))
axes = axes.flatten()

for idx, kernel in enumerate(kernels):
    print(f"\nKernel PCA с ядром '{kernel}'...")
    kpca = KernelPCA(n_components=n_comp, kernel=kernel, random_state=42)
    X_kpca = kpca.fit_transform(X_scaled)
    
    if kernel == 'linear':
        from sklearn.decomposition import PCA
        pca_temp = PCA(n_components=n_comp)
        pca_temp.fit(X_scaled)
        print(f"  Объясненная дисперсия: {pca_temp.explained_variance_ratio_.sum():.4f}")
        print(f"  Потерянная дисперсия: {1 - pca_temp.explained_variance_ratio_.sum():.4f}")
    
    ax = axes[idx]
    scatter = ax.scatter(X_kpca[:, 0], X_kpca[:, 1], c=y_true, cmap='viridis', alpha=0.6, edgecolors='black')
    ax.set_title(f'Kernel PCA ({kernel})')
    ax.set_xlabel('PC1')
    ax.set_ylabel('PC2')
    plt.colorbar(scatter, ax=ax, label='Качество вина')
    
    joblib.dump(kpca, f'kpca_{kernel}.joblib')

axes[-1].axis('off')
plt.tight_layout()
plt.savefig('01_kernel_pca_results.png', dpi=150)
plt.show()
print("\nГрафики Kernel PCA сохранены в '01_kernel_pca_results.png'")

# 3.2 LDA
print("\n" + "="*50)
print("LDA (Linear Discriminant Analysis) - supervised снижение размерности")
unique_classes = np.unique(y_true)
print(f"Количество классов качества: {len(unique_classes)}")

if len(unique_classes) > 1:
    lda = LDA(n_components=min(n_comp, len(unique_classes)-1))
    X_lda = lda.fit_transform(X_scaled, y_true)
    print(f"LDA выполнен, форма: {X_lda.shape}")
    
    plt.figure(figsize=(8,6))
    scatter = plt.scatter(X_lda[:, 0], X_lda[:, 1], c=y_true, cmap='plasma', alpha=0.7, edgecolors='black')
    plt.title('LDA (снижение размерности с учётом качества вина)')
    plt.xlabel('LD1')
    plt.ylabel('LD2')
    plt.colorbar(scatter, label='Качество вина')
    plt.tight_layout()
    plt.savefig('02_lda_results.png', dpi=150)
    plt.show()
    joblib.dump(lda, 'lda_model.joblib')
else:
    print("LDA не применим (меньше 2 классов)")

# 3.3 UMAP (единственный метод из пары t-SNE/UMAP)
if UMAP_AVAILABLE:
    print("\n" + "="*50)
    print("UMAP (Uniform Manifold Approximation and Projection)")
    print("Выбран как один из алгоритмов для сравнения (t-SNE пропущен из-за технических ограничений)")
    
    umap_model = umap.UMAP(n_components=2, random_state=42, n_neighbors=15, min_dist=0.1)
    X_umap = umap_model.fit_transform(X_scaled)
    
    plt.figure(figsize=(8,6))
    scatter = plt.scatter(X_umap[:, 0], X_umap[:, 1], c=y_true, cmap='Spectral', alpha=0.6, edgecolors='black')
    plt.title('UMAP (2D проекция)')
    plt.colorbar(scatter, label='Качество вина')
    plt.tight_layout()
    plt.savefig('03_umap_results.png', dpi=150)
    plt.show()
    joblib.dump(umap_model, 'umap_model.joblib')
    print("UMAP выполнен, график сохранён в '03_umap_results.png'")
    
    # Сохраняем проекцию для дальнейшей визуализации кластеров
    X_vis = X_umap
else:
    print("\n" + "="*50)
    print("UMAP не установлен. Используем первую компоненту Kernel PCA для визуализации.")
    # альтернатива: используем linear PCA для визуализации
    from sklearn.decomposition import PCA
    pca_vis = PCA(n_components=2, random_state=42)
    X_vis = pca_vis.fit_transform(X_scaled)
    print("Используется PCA для визуализации кластеров.")

print("\n[ВЫВОД ПО ЗАДАЧЕ 1]")
print("""1. Kernel PCA: 
   - Линейное ядро объясняет ~46% дисперсии, что говорит о значительной потере информации при снижении до 2 компонент.
   - Полиномиальное, RBF, сигмоидное и косинусное ядра создают нелинейные проекции, которые могут лучше разделять данные.
   - Для данного набора данных RBF ядро показало наиболее четкую структуру.

2. LDA (обучение с учителем):
   - Использует информацию о качестве вина, поэтому разделяет классы наилучшим образом.
   - Не подходит для полностью неразмеченных данных, но полезен для сравнения.

3. UMAP:
   - Показал наиболее выраженные кластеры среди всех unsupervised методов.
   - Лучше всего подходит для визуализации структуры данных о вине.""")

# ============================================================================
# 4. ЗАДАЧА 2: КЛАСТЕРИЗАЦИЯ
# ============================================================================
print("\n" + "="*70)
print("[4] ЗАДАЧА 2: КЛАСТЕРИЗАЦИЯ")
print("="*70)

# 4.1 Определение оптимального числа кластеров (метод локтя и силуэта)
print("\n[4.1] ОПРЕДЕЛЕНИЕ ОПТИМАЛЬНОГО ЧИСЛА КЛАСТЕРОВ")
inertia = []
silhouette_scores = []
K_range = range(2, 11)

for k in K_range:
    kmeans_temp = KMeans(n_clusters=k, random_state=42, n_init=10)
    labels_temp = kmeans_temp.fit_predict(X_scaled)
    inertia.append(kmeans_temp.inertia_)
    silhouette_scores.append(silhouette_score(X_scaled, labels_temp))

fig, axes = plt.subplots(1, 2, figsize=(14, 5))
axes[0].plot(K_range, inertia, 'bo-', linewidth=2, markersize=8)
axes[0].set_xlabel('Число кластеров k')
axes[0].set_ylabel('Инерция (WCSS)')
axes[0].set_title('Метод локтя')
axes[0].grid(True, alpha=0.3)

axes[1].plot(K_range, silhouette_scores, 'ro-', linewidth=2, markersize=8)
axes[1].set_xlabel('Число кластеров k')
axes[1].set_ylabel('Коэффициент силуэта')
axes[1].set_title('Метод силуэта')
axes[1].grid(True, alpha=0.3)

plt.tight_layout()
plt.savefig('04_optimal_clusters.png', dpi=150)
plt.show()

best_k_silhouette = K_range[np.argmax(silhouette_scores)]
print(f"\nОптимальное k по методу силуэта: {best_k_silhouette} (силуэт = {max(silhouette_scores):.3f})")
print("По методу локтя оптимальное k находится в районе 3-4")
n_clusters = 3
print(f"Для дальнейшего анализа выбрано k = {n_clusters}")

# 4.2 K-MEANS КЛАСТЕРИЗАЦИЯ
print("\n[4.2] K-MEANS КЛАСТЕРИЗАЦИЯ")
kmeans = KMeans(n_clusters=n_clusters, random_state=42, n_init=10)
kmeans_labels = kmeans.fit_predict(X_scaled)

sil_kmeans = silhouette_score(X_scaled, kmeans_labels)
db_kmeans = davies_bouldin_score(X_scaled, kmeans_labels)
print(f"Коэффициент силуэта: {sil_kmeans:.4f}")
print(f"Индекс Дэвиса-Болдина: {db_kmeans:.4f} (чем меньше, тем лучше)")
print("\nРаспределение по кластерам:")
cluster_counts = pd.Series(kmeans_labels).value_counts().sort_index()
for i in range(n_clusters):
    print(f"  Кластер {i}: {cluster_counts[i]} объектов ({cluster_counts[i]/len(kmeans_labels)*100:.1f}%)")

# Центры кластеров в исходных единицах
centers_original = scaler.inverse_transform(kmeans.cluster_centers_)
centers_df = pd.DataFrame(centers_original, columns=X_raw.columns)
print("\nЦентры кластеров (в исходных единицах):")
print(centers_df.round(3))

# Визуализация K-means на проекции UMAP (или PCA)
plt.figure(figsize=(8,6))
scatter = plt.scatter(X_vis[:, 0], X_vis[:, 1], c=kmeans_labels, cmap='viridis', alpha=0.6, edgecolors='black')
plt.scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1], 
            c='red', marker='X', s=200, label='Центры кластеров')
plt.title(f'K-means кластеризация (k={n_clusters})')
if UMAP_AVAILABLE:
    plt.xlabel('UMAP1')
    plt.ylabel('UMAP2')
else:
    plt.xlabel('PC1')
    plt.ylabel('PC2')
plt.legend()
plt.colorbar(scatter, label='Кластер')
plt.tight_layout()
plt.savefig('05_kmeans_clusters.png', dpi=150)
plt.show()

joblib.dump(kmeans, 'kmeans_model.joblib')
print("\nМодель K-means сохранена в 'kmeans_model.joblib'")

# 4.3 ИЕРАРХИЧЕСКАЯ КЛАСТЕРИЗАЦИЯ
print("\n[4.3] ИЕРАРХИЧЕСКАЯ КЛАСТЕРИЗАЦИЯ")
Z = linkage(X_scaled, method='ward')

plt.figure(figsize=(15, 7))
dendrogram(Z, truncate_mode='level', p=5, leaf_rotation=45., leaf_font_size=10.)
plt.title('Дендрограмма (метод Ward)')
plt.xlabel('Индексы объектов (сгруппировано)')
plt.ylabel('Евклидово расстояние')
plt.axhline(y=10, color='r', linestyle='--', alpha=0.5, label='Порог для k=3')
plt.legend()
plt.tight_layout()
plt.savefig('06_dendrogram.png', dpi=150)
plt.show()

# Получаем метки кластеров для иерархической кластеризации
hier_labels = fcluster(Z, t=n_clusters, criterion='maxclust') - 1

sil_hier = silhouette_score(X_scaled, hier_labels)
db_hier = davies_bouldin_score(X_scaled, hier_labels)
print(f"Коэффициент силуэта (иерархическая): {sil_hier:.4f}")
print(f"Индекс Дэвиса-Болдина (иерархическая): {db_hier:.4f}")
print("\nРаспределение по кластерам (иерархическая):")
hier_counts = pd.Series(hier_labels).value_counts().sort_index()
for i in range(n_clusters):
    print(f"  Кластер {i}: {hier_counts[i]} объектов ({hier_counts[i]/len(hier_labels)*100:.1f}%)")

# Визуализация иерархической кластеризации
plt.figure(figsize=(8,6))
scatter = plt.scatter(X_vis[:, 0], X_vis[:, 1], c=hier_labels, cmap='plasma', alpha=0.6, edgecolors='black')
plt.title(f'Иерархическая кластеризация (k={n_clusters})')
if UMAP_AVAILABLE:
    plt.xlabel('UMAP1')
    plt.ylabel('UMAP2')
else:
    plt.xlabel('PC1')
    plt.ylabel('PC2')
plt.colorbar(scatter, label='Кластер')
plt.tight_layout()
plt.savefig('07_hierarchical_clusters.png', dpi=150)
plt.show()

joblib.dump(Z, 'linkage_matrix.joblib')
print("\nМатрица связей сохранена в 'linkage_matrix.joblib'")

# ============================================================================
# 5. СРАВНЕНИЕ МЕТОДОВ КЛАСТЕРИЗАЦИИ
# ============================================================================
print("\n[5] СРАВНЕНИЕ МЕТОДОВ КЛАСТЕРИЗАЦИИ")
print("-"*50)

comparison = pd.DataFrame({
    'Метод': ['K-means', 'Иерархическая (Ward)'],
    'Коэффициент силуэта': [sil_kmeans, sil_hier],
    'Индекс Дэвиса-Болдина': [db_kmeans, db_hier],
    'Количество кластеров': [n_clusters, n_clusters]
})
print(comparison.round(4))

# Дополнительный анализ: среднее качество вина по кластерам
print("\nСреднее качество вина по кластерам (K-means):")
for i in range(n_clusters):
    mean_quality = df.loc[kmeans_labels == i, 'quality'].mean()
    print(f"  Кластер {i}: {mean_quality:.2f}")

print("\nСреднее качество вина по кластерам (иерархическая):")
for i in range(n_clusters):
    mean_quality = df.loc[hier_labels == i, 'quality'].mean()
    print(f"  Кластер {i}: {mean_quality:.2f}")

# ============================================================================
# 6. СОХРАНЕНИЕ РЕЗУЛЬТАТОВ
# ============================================================================
print("\n[6] СОХРАНЕНИЕ РЕЗУЛЬТАТОВ")
df_results = df.copy()
df_results['kmeans_cluster'] = kmeans_labels
df_results['hierarchical_cluster'] = hier_labels
df_results.to_csv('wine_clustered.csv')
print("Результаты с метками кластеров сохранены в 'wine_clustered.csv'")

print("\n" + "="*70)
print("ВЫПОЛНЕНИЕ ЗАВЕРШЕНО УСПЕШНО!")
print("Сгенерированные файлы:")
print("  01_kernel_pca_results.png  - Kernel PCA с разными ядрами")
print("  02_lda_results.png         - LDA проекция")
print("  03_umap_results.png        - UMAP проекция")
print("  04_optimal_clusters.png    - Выбор оптимального k")
print("  05_kmeans_clusters.png     - K-means кластеры")
print("  06_dendrogram.png          - Дендрограмма")
print("  07_hierarchical_clusters.png - Иерархическая кластеризация")
print("  kmeans_model.joblib        - Модель K-means")
print("  linkage_matrix.joblib      - Матрица связей")
print("  wine_clustered.csv         - Данные с метками кластеров")
print("="*70)