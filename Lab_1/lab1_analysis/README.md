# Лабораторная работа №1: Анализ данных Лиги чемпионов УЕФА

## Описание проекта
Проект выполняет исследовательский анализ данных UEFA Champions League (2016-2022) 
в соответствии с требованиями лабораторной работы №1.

**Уровень сложности:** Medium  
**Вариант:** 20

## Структура проекта
uefa_cl_analysis/
├── data/ # Исходные данные
├── scripts/ # Python скрипты
├── output/ # Результаты визуализации
├── requirements.txt # Зависимости Python
├── database_dump.sql # Дамп базы данных
└── README.md # Документация


## Установка и запуск

### 1. Установите PostgreSQL
Скачайте и установите PostgreSQL с официального сайта.

### 2. Настройте подключение к БД
Выполните скрипты в порядке
# 1. Создание базы данных
python scripts/create_db.py

# 2. Загрузка данных из Excel
python scripts/load_data.py

# 3. Описание данных
python scripts/data_descr.py

# 4. Одномерный анализ (2 гистограммы)
python scripts/one-dimensional_analysis.py

# 5. Многомерный анализ (2 графика)
python scripts/multidimensional_analysis.py