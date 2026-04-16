import re
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from wordcloud import WordCloud
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.manifold import TSNE
from gensim.models import Word2Vec
import nltk
from nltk.corpus import stopwords
import pymorphy3

# Скачиваем стоп-слова для английского (для удаления английских слов из русских песен)
nltk.download('stopwords')
english_stops = set(stopwords.words('english'))

# Инициализируем морфологический анализатор
morph = pymorphy3.MorphAnalyzer()

# Русские стоп-слова (добавим базовые)
russian_stops = set(['и', 'в', 'во', 'не', 'что', 'на', 'я', 'с', 'со', 'как', 'а', 'то', 'все', 'она', 'так', 'его', 'но', 'да', 'ты', 'к', 'у', 'же', 'вы', 'за', 'бы', 'по', 'только', 'ее', 'мне', 'было', 'вот', 'от', 'меня', 'еще', 'нет', 'о', 'из', 'ему', 'теперь', 'когда', 'даже', 'ну', 'вдруг', 'ли', 'если', 'уже', 'или', 'ни', 'быть', 'был', 'него', 'до', 'вас', 'нибудь', 'опять', 'уж', 'вам', 'ведь', 'там', 'потом', 'себя', 'ничего', 'ей', 'может', 'они', 'тут', 'где', 'есть', 'надо', 'ней', 'для', 'мы', 'тебя', 'их', 'чем', 'была', 'сам', 'чтоб', 'без', 'будто', 'чего', 'раз', 'тоже', 'себе', 'под', 'будет', 'ж', 'тогда', 'кто', 'этот', 'того', 'потому', 'этого', 'какой', 'совсем', 'ним', 'здесь', 'этом', 'один', 'почти', 'мой', 'тем', 'чтобы', 'нее', 'сейчас', 'были', 'куда', 'зачем', 'всех', 'никогда', 'можно', 'при', 'наконец', 'два', 'об', 'другой', 'хоть', 'после', 'над', 'больше', 'тот', 'через', 'эти', 'нас', 'про', 'всего', 'них', 'какая', 'много', 'разве', 'три', 'эту', 'моя', 'впрочем', 'хорошо', 'свою', 'этой', 'перед', 'иногда', 'лучше', 'чуть', 'том', 'нельзя', 'такой', 'им', 'более', 'всегда', 'конечно', 'всю', 'между'])

# Функция предобработки текста
def preprocess_text(text):
    # 1. Приводим к нижнему регистру
    text = text.lower()
    # 2. Удаляем знаки препинания и цифры
    text = re.sub(r'[^\w\s]', ' ', text)
    text = re.sub(r'\d+', ' ', text)
    # 3. Разбиваем на слова
    words = text.split()
    
    processed_words = []
    for word in words:
        # 4. Удаляем слишком короткие слова
        if len(word) < 2:
            continue
        # 5. Удаляем английские слова (стоп-слова)
        if word in english_stops:
            continue
        # 6. Удаляем русские стоп-слова
        if word in russian_stops:
            continue
            
        # 7. Лемматизация (приводим к начальной форме)
        try:
            lemma = morph.parse(word)[0].normal_form
            # Если лемма не пустая и не стоп-слово
            if len(lemma) > 2 and lemma not in russian_stops:
                processed_words.append(lemma)
        except:
            # Если ошибка лемматизации, оставляем слово как есть
            if len(word) > 2:
                processed_words.append(word)
                
    return ' '.join(processed_words)

# --- Загрузка данных ---
print("1. Загрузка текстов песен...")
with open('tracks.txt', 'r', encoding='utf-8') as f:
    content = f.read()

# Разделяем на песни (по маркеру "Песня X")
songs_raw = re.split(r'Песня \d+\n', content)
# Убираем пустые строки
songs_raw = [song.strip() for song in songs_raw if song.strip()]

print(f"   Загружено песен: {len(songs_raw)}")

# --- Предобработка ---
print("2. Предобработка текста (лемматизация, удаление стоп-слов)...")
processed_songs = []
for i, song in enumerate(songs_raw):
    cleaned = preprocess_text(song)
    if cleaned:  # Добавляем только непустые
        processed_songs.append(cleaned)
    print(f"   Песня {i+1}: {len(song.split())} слов -> {len(cleaned.split())} значимых слов")

# --- TF-IDF ---
print("\n3. Расчет TF-IDF...")
vectorizer = TfidfVectorizer(max_features=50)  # Берем топ-50 слов
tfidf_matrix = vectorizer.fit_transform(processed_songs)
feature_names = vectorizer.get_feature_names_out()
tfidf_scores = tfidf_matrix.sum(axis=0).A1

# Сортируем слова по TF-IDF
word_tfidf = sorted(zip(feature_names, tfidf_scores), key=lambda x: x[1], reverse=True)

print("\n   Топ-10 слов по TF-IDF:")
for word, score in word_tfidf[:10]:
    print(f"      {word}: {score:.4f}")

# --- WordCloud ---
print("\n4. Построение WordCloud...")
# Создаем словарь для облака слов
word_freq = {word: score for word, score in word_tfidf[:50]}

plt.figure(figsize=(12, 8))
wordcloud = WordCloud(width=800, height=400, background_color='black', 
                      colormap='viridis', max_words=50, font_path=None)
wordcloud.generate_from_frequencies(word_freq)

plt.imshow(wordcloud, interpolation='bilinear')
plt.axis('off')
plt.title('Топ-50 слов по TF-IDF', fontsize=16)
plt.tight_layout()
plt.savefig('wordcloud.png', dpi=150, bbox_inches='tight')
plt.show()
print("   Облако слов сохранено как 'wordcloud.png'")

# --- Word2Vec ---
print("\n5. Обучение Word2Vec...")
# Для Word2Vec нужны предложения в виде списка списков слов
sentences = [song.split() for song in processed_songs if len(song.split()) > 1]

# Обучаем модель
model_w2v = Word2Vec(sentences=sentences, vector_size=100, window=5, 
                      min_count=2, workers=4, epochs=10, sg=1)  # sg=1 - Skip-gram

print(f"   Словарь модели: {len(model_w2v.wv)} уникальных слов")

# --- Похожие слова ---
print("\n6. Поиск похожих слов...")
# Выбираем несколько слов из топа
test_words = ['брат', 'курю', 'дым', 'холодный']
for word in test_words:
    if word in model_w2v.wv:
        print(f"\n   Слова, похожие на '{word}':")
        similar = model_w2v.wv.most_similar(word, topn=5)
        for sim_word, score in similar:
            print(f"      {sim_word}: {score:.3f}")
    else:
        print(f"\n   Слово '{word}' отсутствует в словаре модели")

# --- t-SNE ---
print("\n7. Построение графика t-SNE для 15 частых слов...")
# Берем 15 самых частых слов из TF-IDF
top_words = [word for word, _ in word_tfidf[:15] if word in model_w2v.wv]
# Если в модели нет некоторых слов, берем другие
if len(top_words) < 15:
    for word, _ in word_tfidf[15:]:
        if word in model_w2v.wv and len(top_words) < 15:
            top_words.append(word)

print(f"   Слова для визуализации: {top_words}")

# Получаем вектора
vectors = np.array([model_w2v.wv[word] for word in top_words])

# Уменьшаем размерность до 2D
tsne = TSNE(n_components=2, random_state=42, perplexity=min(5, len(top_words)-1))
vectors_2d = tsne.fit_transform(vectors)

# Рисуем
plt.figure(figsize=(12, 8))
plt.scatter(vectors_2d[:, 0], vectors_2d[:, 1], c='blue', s=100)

for i, word in enumerate(top_words):
    plt.annotate(word, (vectors_2d[i, 0], vectors_2d[i, 1]), fontsize=12, ha='center')

plt.title('t-SNE визуализация векторных представлений слов (Word2Vec)', fontsize=14)
plt.xlabel('Компонента 1')
plt.ylabel('Компонента 2')
plt.grid(True, alpha=0.3)
plt.tight_layout()
plt.savefig('tsne_words.png', dpi=150, bbox_inches='tight')
plt.show()
print("   График t-SNE сохранен как 'tsne_words.png'")

# --- Итоговая статистика ---
print("\n" + "="*50)
print("ИТОГОВАЯ СТАТИСТИКА:")
print("="*50)
print(f"Всего песен в обработке: {len(processed_songs)}")
print(f"Уникальных слов после предобработки: {len(model_w2v.wv)}")
print(f"Топ-3 слова по TF-IDF: {word_tfidf[0][0]}, {word_tfidf[1][0]}, {word_tfidf[2][0]}")
print("\nГрафики сохранены:")
print("   - wordcloud.png (облако слов)")
print("   - tsne_words.png (визуализация слов)")