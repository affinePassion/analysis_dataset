"""
UEFA Champions League 2016-2022 Data Analysis Dashboard
Веб-приложение для анализа данных Лиги Чемпионов УЕФА
"""

import streamlit as st
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import pickle
import os
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

# Настройка страницы
st.set_page_config(
    page_title="UEFA Champions League Analytics",
    page_icon="⚽",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Заголовок приложения
st.title("⚽ UEFA Champions League 2016-2022")
st.subheader("Аналитическая панель данных Лиги Чемпионов УЕФА")

# Боковая панель навигации
st.sidebar.title("📋 Навигация")
page = st.sidebar.radio(
    "Выберите раздел:",
    ["📖 Описание проекта", "📊 EDA анализ", "🤖 ML модель"]
)

st.sidebar.markdown("---")
st.sidebar.markdown("### 👤 Информация")
st.sidebar.markdown("**Студент:** Соболев Р.В.")
st.sidebar.markdown("**Группа:** Б.ПИН.РИС - 22.06")
st.sidebar.markdown("**Дата:** 17.04.2026")

# Функция для создания схемы базы данных
def create_database_schema():
    """Создание визуальной схемы базы данных с помощью Plotly"""
    
    # Определение таблиц и их позиций
    tables = [
        {"name": "stadiums", "x": 1, "y": 4, "color": "#FF6B6B"},
        {"name": "teams", "x": 4, "y": 4, "color": "#4ECDC4"},
        {"name": "managers", "x": 7, "y": 4, "color": "#45B7D1"},
        {"name": "matches", "x": 2.5, "y": 2, "color": "#96CEB4"},
        {"name": "players", "x": 5.5, "y": 2, "color": "#FFEAA7"},
        {"name": "goals", "x": 4, "y": 0, "color": "#DDA0DD"}
    ]
    
    # Определение связей между таблицами
    edges = [
        {"from": "stadiums", "to": "teams", "label": "HOME_STADIUM → NAME"},
        {"from": "teams", "to": "players", "label": "TEAM_NAME → TEAM"},
        {"from": "teams", "to": "managers", "label": "TEAM_NAME → TEAM"},
        {"from": "stadiums", "to": "matches", "label": "NAME → STADIUM"},
        {"from": "teams", "to": "matches", "label": "TEAM_NAME → HOME_TEAM"},
        {"from": "teams", "to": "matches", "label": "TEAM_NAME → AWAY_TEAM"},
        {"from": "matches", "to": "goals", "label": "MATCH_ID → MATCH_ID"},
        {"from": "players", "to": "goals", "label": "PLAYER_ID → PID"}
    ]
    
    # Создание фигуры
    fig = go.Figure()
    
    # Координаты таблиц
    table_positions = {t["name"]: (t["x"], t["y"]) for t in tables}
    
    # Добавление связей (стрелок)
    edge_colors = ['#E74C3C', '#27AE60', '#2980B9', '#8E44AD', '#D35400', '#16A085', '#C0392B', '#7D3C98']
    
    for i, edge in enumerate(edges):
        from_pos = table_positions[edge["from"]]
        to_pos = table_positions[edge["to"]]
        
        # Расчет смещенных координат для красивого отображения
        dx = to_pos[0] - from_pos[0]
        dy = to_pos[1] - from_pos[1]
        
        # Создание изогнутой линии
        mid_x = (from_pos[0] + to_pos[0]) / 2
        mid_y = (from_pos[1] + to_pos[1]) / 2
        
        fig.add_trace(go.Scatter(
            x=[from_pos[0], mid_x, to_pos[0]],
            y=[from_pos[1], mid_y, to_pos[1]],
            mode='lines+markers+text',
            line=dict(color=edge_colors[i % len(edge_colors)], width=2.5),
            marker=dict(size=0.1, color=edge_colors[i % len(edge_colors)]),
            text=['', '', ''],
            textposition='top center',
            hoverinfo='text',
            hovertext=edge["label"],
            showlegend=False
        ))
        
        # Добавление стрелки на конце
        arrow_x = to_pos[0] - dx * 0.15
        arrow_y = to_pos[1] - dy * 0.15
        
        fig.add_trace(go.Scatter(
            x=[arrow_x, to_pos[0]],
            y=[arrow_y, to_pos[1]],
            mode='lines',
            line=dict(color=edge_colors[i % len(edge_colors)], width=2.5),
            showlegend=False,
            hoverinfo='none'
        ))
        
        # Добавление подписи связи
        fig.add_annotation(
            x=mid_x,
            y=mid_y + 0.15,
            text=f"<b>{edge['label']}</b>",
            showarrow=False,
            font=dict(size=8, color='#2C3E50'),
            bgcolor='rgba(255, 255, 255, 0.9)',
            borderpad=3,
            bordercolor='#BDC3C7',
            borderwidth=1
        )
    
    # Добавление таблиц
    for table in tables:
        fig.add_trace(go.Scatter(
            x=[table["x"]],
            y=[table["y"]],
            mode='markers+text',
            marker=dict(
                size=90,
                color=table["color"],
                symbol='square',
                line=dict(color='#2C3E50', width=2.5)
            ),
            text=[f"<b>{table['name']}</b>"],
            textposition='middle center',
            textfont=dict(size=12, color='white', family='Arial'),
            hoverinfo='text',
            hovertext=f"Таблица: {table['name']}",
            showlegend=False
        ))
    
    # Настройка макета
    fig.update_layout(
        title={
            'text': '<b>🗂️ Схема базы данных UEFA Champions League</b>',
            'x': 0.5,
            'xanchor': 'center',
            'font': {'size': 20, 'family': 'Arial'}
        },
        xaxis=dict(
            range=[0, 8],
            showgrid=False,
            zeroline=False,
            showticklabels=False,
            fixedrange=True
        ),
        yaxis=dict(
            range=[-0.5, 5],
            showgrid=False,
            zeroline=False,
            showticklabels=False,
            fixedrange=True
        ),
        height=550,
        margin=dict(l=20, r=20, t=80, b=20),
        plot_bgcolor='rgba(245, 245, 250, 1)',
        paper_bgcolor='rgba(245, 245, 250, 1)'
    )
    
    return fig

# Загрузка данных
@st.cache_data
def load_data():
    """Загрузка и кэширование данных"""
    data = {}
    try:
        data['stadiums'] = pd.read_csv('data/stadiums.csv', sep=';')
        data['teams'] = pd.read_csv('data/teams.csv', sep=';')
        data['players'] = pd.read_csv('data/players.csv', sep=';')
        data['managers'] = pd.read_csv('data/managers.csv', sep=';')
        data['matches'] = pd.read_csv('data/matches.csv', sep=';')
        data['goals'] = pd.read_csv('data/goals.csv', sep=';')
        return data, True
    except Exception as e:
        st.error(f"Ошибка загрузки данных: {e}")
        return None, False

# Загрузка данных
data, data_loaded = load_data()

# ========== СТРАНИЦА 1: ОПИСАНИЕ ПРОЕКТА ==========
if page == "📖 Описание проекта":
    st.markdown("## 📖 Общее описание проекта")
    
    col1, col2 = st.columns([2, 1])
    
    with col1:
        st.markdown("""
        ### 🎯 Цель проекта
        
        Данный проект представляет собой аналитическую панель для исследования 
        данных Лиги Чемпионов УЕФА за период с 2016 по 2022 год. Проект включает 
        в себя исследовательский анализ данных (EDA) и модель машинного обучения 
        для прогнозирования посещаемости матчей.
        
        ### 📊 Источник данных
        
        Данные содержат информацию о:
        - **86 стадионах** (название, город, страна, вместимость)
        - **74 командах** (название, страна, домашний стадион)
        - **2769 игроках** (имя, фамилия, позиция, рост, вес, команда)
        - **78 тренерах** (имя, фамилия, национальность, команда)
        - **744 матчах** (сезон, дата, счет, посещаемость)
        - **2279 голах** (игрок, минута, ассистент, описание)
        
        ### 🔧 Технологический стек
        
        - **Streamlit** - веб-фреймворк для визуализации данных
        - **PostgreSQL** - система управления базой данных
        - **PySpark** - фреймворк для обработки больших данных
        - **Scikit-learn** - библиотека машинного обучения
        - **Plotly / Matplotlib** - визуализация данных
        - **Pandas / NumPy** - анализ и обработка данных
        """)
    
    with col2:
        st.markdown("### 📈 Статистика датасета")
        if data_loaded:
            col_stats1, col_stats2 = st.columns(2)
            with col_stats1:
                st.metric("🏟️ Стадионы", f"{len(data['stadiums']):,}")
                st.metric("⚽ Команды", f"{len(data['teams']):,}")
                st.metric("👤 Игроки", f"{len(data['players']):,}")
            with col_stats2:
                st.metric("👔 Тренеры", f"{len(data['managers']):,}")
                st.metric("📅 Матчи", f"{len(data['matches']):,}")
                st.metric("🥅 Голы", f"{len(data['goals']):,}")
            
            st.markdown("---")
            st.markdown("### 📅 Период данных")
            seasons = data['matches']['SEASON'].unique()
            seasons_sorted = sorted(seasons)
            st.markdown(f"**Сезоны:** {', '.join(seasons_sorted)}")
    
    st.markdown("---")
    
    # Отображение схемы базы данных
    st.markdown("### 🗂️ Схема базы данных")
    
    schema_fig = create_database_schema()
    st.plotly_chart(schema_fig, width='stretch')
    
    # Легенда к схеме
    st.markdown("""
    <style>
    .legend-container {
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
        padding: 15px;
        background-color: #f8f9fa;
        border-radius: 10px;
        margin-top: 10px;
    }
    .legend-item {
        display: flex;
        align-items: center;
        gap: 5px;
    }
    .legend-color {
        width: 20px;
        height: 20px;
        border-radius: 5px;
    }
    </style>
    <div class="legend-container">
        <div class="legend-item"><div class="legend-color" style="background-color: #FF6B6B;"></div> stadiums - информация о стадионах</div>
        <div class="legend-item"><div class="legend-color" style="background-color: #4ECDC4;"></div> teams - футбольные клубы</div>
        <div class="legend-item"><div class="legend-color" style="background-color: #45B7D1;"></div> managers - тренеры команд</div>
        <div class="legend-item"><div class="legend-color" style="background-color: #96CEB4;"></div> matches - матчи турнира</div>
        <div class="legend-item"><div class="legend-color" style="background-color: #FFEAA7;"></div> players - футболисты</div>
        <div class="legend-item"><div class="legend-color" style="background-color: #DDA0DD;"></div> goals - забитые голы</div>
    </div>
    """, unsafe_allow_html=True)
    
    st.markdown("---")
    st.markdown("### 🔗 Связи между таблицами")
    
    col1, col2 = st.columns(2)
    
    with col1:
        st.markdown("""
        **Первичные ключи (PK):**
        - `stadiums.NAME` - уникальное название стадиона
        - `teams.TEAM_NAME` - уникальное название команды
        - `managers.MANAGER_ID` - уникальный ID тренера
        - `matches.MATCH_ID` - уникальный ID матча
        - `players.PLAYER_ID` - уникальный ID игрока
        - `goals.GOAL_ID` - уникальный ID гола
        """)
    
    with col2:
        st.markdown("""
        **Внешние ключи (FK):**
        - `teams.HOME_STADIUM` → `stadiums.NAME`
        - `players.TEAM` → `teams.TEAM_NAME`
        - `managers.TEAM` → `teams.TEAM_NAME`
        - `matches.HOME_TEAM` → `teams.TEAM_NAME`
        - `matches.AWAY_TEAM` → `teams.TEAM_NAME`
        - `matches.STADIUM` → `stadiums.NAME`
        - `goals.MATCH_ID` → `matches.MATCH_ID`
        - `goals.PID` → `players.PLAYER_ID`
        """)

# ========== СТРАНИЦА 2: EDA АНАЛИЗ ==========
elif page == "📊 EDA анализ":
    st.markdown("## 📊 Исследовательский анализ данных (EDA)")
    
    if not data_loaded:
        st.error("Данные не загружены. Проверьте наличие CSV файлов в папке data/")
        st.stop()
    
    # Вкладки для разных видов анализа
    tab1, tab2, tab3, tab4 = st.tabs([
        "🏆 Топ-10 команд", 
        "⚽ Топ бомбардиры", 
        "📈 Статистика по сезонам",
        "🏟️ Анализ стадионов"
    ])
    
    with tab1:
        st.markdown("### 🏆 Топ-10 команд по посещаемости домашних матчей")
        
        # Запрос 1: Суммарная посещаемость
        home_attendance = data['matches'].groupby('HOME_TEAM').agg({
            'ATTENDANCE': ['sum', 'mean', 'count']
        }).round(0)
        home_attendance.columns = ['total_attendance', 'avg_attendance', 'matches_count']
        home_attendance = home_attendance.sort_values('total_attendance', ascending=False).head(10)
        
        col1, col2 = st.columns(2)
        
        with col1:
            st.dataframe(
                home_attendance.style.format({
                    'total_attendance': '{:,.0f}',
                    'avg_attendance': '{:,.0f}',
                    'matches_count': '{:.0f}'
                }),
                width='stretch'
            )
        
        with col2:
            fig = px.bar(
                home_attendance.reset_index(),
                x='HOME_TEAM',
                y='total_attendance',
                title='Общая посещаемость домашних матчей',
                labels={'HOME_TEAM': 'Команда', 'total_attendance': 'Общая посещаемость'},
                color='total_attendance',
                color_continuous_scale='Viridis',
                text='total_attendance'
            )
            fig.update_traces(texttemplate='%{text:,.0f}', textposition='outside')
            fig.update_layout(xaxis_tickangle=-45, showlegend=False)
            st.plotly_chart(fig, width='stretch')
        
        st.markdown("---")
        st.markdown("### 📊 Сравнение средней и общей посещаемости")
        
        fig2 = px.scatter(
            home_attendance.reset_index(),
            x='matches_count',
            y='avg_attendance',
            size='total_attendance',
            color='HOME_TEAM',
            hover_name='HOME_TEAM',
            title='Зависимость средней посещаемости от количества домашних матчей',
            labels={
                'matches_count': 'Количество домашних матчей',
                'avg_attendance': 'Средняя посещаемость',
                'total_attendance': 'Общая посещаемость'
            }
        )
        fig2.update_layout(showlegend=False)
        st.plotly_chart(fig2, width='stretch')
    
    with tab2:
        st.markdown("### ⚽ Топ-10 бомбардиров турнира")
        
        # Запрос 2: Топ бомбардиров
        goals_by_player = data['goals'].merge(
            data['players'][['PLAYER_ID', 'FIRST_NAME', 'LAST_NAME', 'TEAM', 'NATIONALITY']],
            left_on='PID',
            right_on='PLAYER_ID',
            how='left'
        )
        top_scorers = goals_by_player.groupby(['FIRST_NAME', 'LAST_NAME', 'TEAM', 'NATIONALITY']).size().reset_index(name='GOALS')
        top_scorers = top_scorers.sort_values('GOALS', ascending=False).head(10)
        top_scorers['FULL_NAME'] = top_scorers['FIRST_NAME'].fillna('') + ' ' + top_scorers['LAST_NAME'].fillna('')
        top_scorers['FULL_NAME'] = top_scorers['FULL_NAME'].str.strip()
        
        col1, col2 = st.columns(2)
        
        with col1:
            st.dataframe(
                top_scorers[['FULL_NAME', 'TEAM', 'NATIONALITY', 'GOALS']].rename(
                    columns={'FULL_NAME': 'Игрок', 'TEAM': 'Команда', 'NATIONALITY': 'Национальность', 'GOALS': 'Голы'}
                ),
                width='stretch',
                hide_index=True
            )
        
        with col2:
            fig = px.bar(
                top_scorers,
                y='FULL_NAME',
                x='GOALS',
                title='Количество забитых голов',
                labels={'FULL_NAME': 'Игрок', 'GOALS': 'Голы'},
                orientation='h',
                color='GOALS',
                color_continuous_scale='Reds',
                text='GOALS'
            )
            fig.update_traces(texttemplate='%{text}', textposition='outside')
            fig.update_layout(yaxis={'categoryorder': 'total ascending'}, showlegend=False)
            st.plotly_chart(fig, width='stretch')
        
        st.markdown("---")
        st.markdown("### 🌍 Распределение бомбардиров по национальностям")
        
        top_scorers_nationality = top_scorers.groupby('NATIONALITY')['GOALS'].sum().reset_index()
        top_scorers_nationality = top_scorers_nationality.sort_values('GOALS', ascending=False)
        
        fig3 = px.pie(
            top_scorers_nationality,
            values='GOALS',
            names='NATIONALITY',
            title='Распределение голов топ-10 бомбардиров по национальностям'
        )
        st.plotly_chart(fig3, width='stretch')
    
    with tab3:
        st.markdown("### 📈 Статистика по сезонам")
        
        # Запрос 5: Среднее количество голов по сезонам
        season_stats = data['matches'].copy()
        season_stats['TOTAL_GOALS'] = season_stats['HOME_TEAM_SCORE'] + season_stats['AWAY_TEAM_SCORE']
        season_agg = season_stats.groupby('SEASON').agg({
            'MATCH_ID': 'count',
            'TOTAL_GOALS': ['sum', 'mean'],
            'ATTENDANCE': 'mean'
        }).round(2)
        season_agg.columns = ['matches', 'total_goals', 'avg_goals', 'avg_attendance']
        season_agg = season_agg.reset_index()
        
        col1, col2 = st.columns(2)
        
        with col1:
            # Создаем копию для отображения с переименованными колонками
            display_df = season_agg.copy()
            display_df.columns = ['Сезон', 'Матчей', 'Всего голов', 'Ср. голов', 'Ср. посещаемость']
            
            st.dataframe(
                display_df.style.format({
                    'Ср. голов': '{:.2f}',
                    'Ср. посещаемость': '{:,.0f}',
                    'Всего голов': '{:,.0f}',
                    'Матчей': '{:.0f}'
                }),
                width='stretch',
                hide_index=True
            )
        
        with col2:
            fig = make_subplots(specs=[[{"secondary_y": True}]])
            
            fig.add_trace(
                go.Scatter(
                    x=season_agg['SEASON'], 
                    y=season_agg['avg_goals'], 
                    name="Ср. голов за матч",
                    mode="lines+markers",
                    line=dict(color='#E74C3C', width=3),
                    marker=dict(size=10)
                ),
                secondary_y=False
            )
            
            fig.add_trace(
                go.Bar(
                    x=season_agg['SEASON'], 
                    y=season_agg['avg_attendance'],
                    name="Ср. посещаемость",
                    marker_color='#3498DB',
                    opacity=0.7
                ),
                secondary_y=True
            )
            
            fig.update_layout(
                title='Динамика голов и посещаемости по сезонам',
                hovermode='x unified',
                legend=dict(orientation='h', yanchor='bottom', y=1.02, xanchor='right', x=1)
            )
            fig.update_xaxes(title_text="Сезон")
            fig.update_yaxes(title_text="Среднее количество голов за матч", secondary_y=False, title_font_color='#E74C3C')
            fig.update_yaxes(title_text="Средняя посещаемость", secondary_y=True, title_font_color='#3498DB')
            
            st.plotly_chart(fig, width='stretch')
        
        st.markdown("---")
        st.markdown("### 📊 Общая статистика голов по сезонам")
        
        fig4 = px.bar(
            season_agg,
            x='SEASON',
            y='total_goals',
            title='Общее количество голов по сезонам',
            labels={'SEASON': 'Сезон', 'total_goals': 'Всего голов'},
            color='total_goals',
            color_continuous_scale='Blues',
            text='total_goals'
        )
        fig4.update_traces(texttemplate='%{text:,.0f}', textposition='outside')
        fig4.update_layout(showlegend=False)
        st.plotly_chart(fig4, width='stretch')
    
    with tab4:
        st.markdown("### 🏟️ Топ-10 стадионов по количеству матчей")
        
        # Запрос 4: Количество матчей на стадионах
        stadium_matches = data['matches'].groupby('STADIUM').size().reset_index(name='matches_count')
        stadium_matches = stadium_matches.merge(
            data['stadiums'][['NAME', 'CITY', 'COUNTRY', 'CAPACITY']],
            left_on='STADIUM',
            right_on='NAME',
            how='left'
        )
        stadium_matches = stadium_matches.sort_values('matches_count', ascending=False).head(10)
        
        col1, col2 = st.columns(2)
        
        with col1:
            # Создаем копию для отображения с переименованными колонками
            display_stadiums = stadium_matches[['NAME', 'CITY', 'COUNTRY', 'CAPACITY', 'matches_count']].copy()
            display_stadiums.columns = ['Стадион', 'Город', 'Страна', 'Вместимость', 'Матчей']
            
            st.dataframe(
                display_stadiums.style.format({'Вместимость': '{:,.0f}', 'Матчей': '{:.0f}'}),
                width='stretch',
                hide_index=True
            )
        
        with col2:
            fig = px.bar(
                stadium_matches,
                y='NAME',
                x='matches_count',
                title='Количество матчей на стадионе',
                labels={'NAME': 'Стадион', 'matches_count': 'Количество матчей'},
                orientation='h',
                color='matches_count',
                color_continuous_scale='Greens',
                text='matches_count'
            )
            fig.update_traces(texttemplate='%{text}', textposition='outside')
            fig.update_layout(yaxis={'categoryorder': 'total ascending'}, showlegend=False)
            st.plotly_chart(fig, width='stretch')
        
        st.markdown("---")
        st.markdown("### 📈 Зависимость количества матчей от вместимости")
        
        fig5 = px.scatter(
            stadium_matches,
            x='CAPACITY',
            y='matches_count',
            size='matches_count',
            color='COUNTRY',
            hover_name='NAME',
            title='Зависимость количества матчей от вместимости стадиона',
            labels={
                'CAPACITY': 'Вместимость стадиона',
                'matches_count': 'Количество матчей',
                'COUNTRY': 'Страна'
            }
        )
        fig5.update_layout(legend=dict(orientation='h', yanchor='bottom', y=-0.3))
        st.plotly_chart(fig5, width='stretch')

# ========== СТРАНИЦА 3: ML МОДЕЛЬ ==========
elif page == "🤖 ML модель":
    st.markdown("## 🤖 Машинное обучение")
    st.markdown("### 🎯 Прогнозирование посещаемости матчей Лиги Чемпионов")
    
    if not data_loaded:
        st.error("Данные не загружены. Проверьте наличие CSV файлов в папке data/")
        st.stop()
    
    # Подготовка данных для ML
    @st.cache_data
    def prepare_ml_data():
        df = data['matches'].copy()
        
        # Удаляем строки с пропущенной посещаемостью
        df = df.dropna(subset=['ATTENDANCE'])
        
        # Создаем дополнительные признаки
        df['TOTAL_GOALS'] = df['HOME_TEAM_SCORE'] + df['AWAY_TEAM_SCORE']
        df['GOAL_DIFFERENCE'] = abs(df['HOME_TEAM_SCORE'] - df['AWAY_TEAM_SCORE'])
        
        # Кодируем категориальные признаки
        le_home = LabelEncoder()
        le_away = LabelEncoder()
        le_stadium = LabelEncoder()
        le_season = LabelEncoder()
        
        df['HOME_TEAM_ENC'] = le_home.fit_transform(df['HOME_TEAM'])
        df['AWAY_TEAM_ENC'] = le_away.fit_transform(df['AWAY_TEAM'])
        df['STADIUM_ENC'] = le_stadium.fit_transform(df['STADIUM'])
        df['SEASON_ENC'] = le_season.fit_transform(df['SEASON'])
        
        # Выбираем признаки и целевую переменную
        features = ['HOME_TEAM_ENC', 'AWAY_TEAM_ENC', 'STADIUM_ENC', 'SEASON_ENC',
                   'HOME_TEAM_SCORE', 'AWAY_TEAM_SCORE', 'TOTAL_GOALS', 'GOAL_DIFFERENCE']
        
        X = df[features].fillna(0)
        y = df['ATTENDANCE'].fillna(0)
        
        # Разделяем на обучающую и тестовую выборки
        X_train, X_test, y_train, y_test = train_test_split(
            X, y, test_size=0.2, random_state=42
        )
        
        return X_train, X_test, y_train, y_test, le_home, le_away, le_stadium, le_season, df
    
    X_train, X_test, y_train, y_test, le_home, le_away, le_stadium, le_season, df = prepare_ml_data()
    
    # Вкладки
    tab1, tab2 = st.tabs(["🎯 Обучающая и тестовая выборки", "🔮 Предсказание"])
    
    with tab1:
        st.markdown("### 📊 Разделение данных")
        
        col1, col2, col3 = st.columns(3)
        
        with col1:
            st.metric("📚 Обучающая выборка", f"{len(X_train):,} записей")
        with col2:
            st.metric("📝 Тестовая выборка", f"{len(X_test):,} записей")
        with col3:
            st.metric("📋 Всего данных", f"{len(df):,} записей")
        
        st.markdown("---")
        st.markdown("### 📈 Распределение признаков")
        
        col1, col2 = st.columns(2)
        
        with col1:
            fig = px.histogram(
                df, x='ATTENDANCE', nbins=50,
                title='Распределение посещаемости матчей',
                labels={'ATTENDANCE': 'Посещаемость', 'count': 'Частота'},
                color_discrete_sequence=['#3498DB']
            )
            fig.update_layout(showlegend=False)
            st.plotly_chart(fig, use_container_width=True, key="attendance_hist")
        
        with col2:
            # Убираем trendline, чтобы избежать ошибки с statsmodels
            fig = px.scatter(
                df, x='TOTAL_GOALS', y='ATTENDANCE',
                title='Зависимость посещаемости от количества голов',
                labels={'TOTAL_GOALS': 'Всего голов в матче', 'ATTENDANCE': 'Посещаемость'},
                opacity=0.5,
                color_discrete_sequence=['#E74C3C']
            )
            st.plotly_chart(fig, use_container_width=True, key="goals_scatter")
        
        st.markdown("---")
        st.markdown("### 🔥 Матрица корреляции признаков")
        
        # Выбираем только числовые колонки для корреляции
        numeric_cols = ['HOME_TEAM_SCORE', 'AWAY_TEAM_SCORE', 'TOTAL_GOALS', 
                        'GOAL_DIFFERENCE', 'ATTENDANCE']
        corr_matrix = df[numeric_cols].corr()
        
        fig = px.imshow(
            corr_matrix,
            text_auto=True,
            aspect='auto',
            title='Корреляция между признаками',
            color_continuous_scale='RdBu_r',
            zmin=-1, zmax=1
        )
        st.plotly_chart(fig, width='stretch')
        
    
    with tab2:
        st.markdown("### 🔮 Прогнозирование посещаемости")
        
        # Обучение модели
        @st.cache_resource
        def train_model(X_train, y_train):
            model = RandomForestRegressor(
                n_estimators=100,
                max_depth=10,
                random_state=42,
                n_jobs=-1
            )
            model.fit(X_train, y_train)
            return model
        
        # Загрузка или обучение модели
        model_path = 'models/attendance_model.pkl'
        
        if os.path.exists(model_path):
            with open(model_path, 'rb') as f:
                model = pickle.load(f)
            st.success("✅ Загружена сохраненная модель")
        else:
            with st.spinner("🔄 Обучение модели..."):
                model = train_model(X_train, y_train)
                os.makedirs('models', exist_ok=True)
                with open(model_path, 'wb') as f:
                    pickle.dump(model, f)
            st.success("✅ Модель обучена и сохранена")
        
        # Оценка модели
        y_pred = model.predict(X_test)
        
        st.markdown("### 📊 Метрики качества модели")
        
        col1, col2, col3 = st.columns(3)
        
        with col1:
            mae = mean_absolute_error(y_test, y_pred)
            st.metric("📊 MAE", f"{mae:,.0f}")
        
        with col2:
            rmse = np.sqrt(mean_squared_error(y_test, y_pred))
            st.metric("📈 RMSE", f"{rmse:,.0f}")
        
        with col3:
            r2 = r2_score(y_test, y_pred)
            st.metric("🎯 R² Score", f"{r2:.3f}")
        
        st.markdown("---")
        st.markdown("### 🎮 Интерактивное предсказание")
        st.markdown("Выберите параметры матча для прогнозирования посещаемости:")
        
        col1, col2 = st.columns(2)
        
        with col1:
            home_team = st.selectbox(
                "🏠 Домашняя команда",
                options=sorted(df['HOME_TEAM'].unique()),
                key="home_team_select"
            )
            away_team = st.selectbox(
                "✈️ Гостевая команда",
                options=sorted(df['AWAY_TEAM'].unique()),
                key="away_team_select"
            )
            season = st.selectbox(
                "📅 Сезон",
                options=sorted(df['SEASON'].unique()),
                key="season_select"
            )
        
        with col2:
            home_score = st.slider("⚽ Голы домашней команды", 0, 10, 2, key="home_score_slider")
            away_score = st.slider("⚽ Голы гостевой команды", 0, 10, 1, key="away_score_slider")
            stadium = st.selectbox(
                "🏟️ Стадион",
                options=sorted(df['STADIUM'].dropna().unique()),
                key="stadium_select"
            )
        
        total_goals = home_score + away_score
        goal_diff = abs(home_score - away_score)
        
        if st.button("🎯 Предсказать посещаемость", type="primary", width='stretch', key="predict_button"):
            # Подготовка входных данных
            input_data = pd.DataFrame({
                'HOME_TEAM_ENC': [le_home.transform([home_team])[0] if home_team in le_home.classes_ else 0],
                'AWAY_TEAM_ENC': [le_away.transform([away_team])[0] if away_team in le_away.classes_ else 0],
                'STADIUM_ENC': [le_stadium.transform([stadium])[0] if stadium in le_stadium.classes_ else 0],
                'SEASON_ENC': [le_season.transform([season])[0] if season in le_season.classes_ else 0],
                'HOME_TEAM_SCORE': [home_score],
                'AWAY_TEAM_SCORE': [away_score],
                'TOTAL_GOALS': [total_goals],
                'GOAL_DIFFERENCE': [goal_diff]
            })
            
            prediction = model.predict(input_data)[0]
            
            st.markdown("---")
            st.success(f"### 🎉 Прогнозируемая посещаемость: {prediction:,.0f} зрителей")
            
            # Визуализация предсказания
            col1, col2 = st.columns([2, 1])
            
            with col1:
                fig = go.Figure(go.Indicator(
                    mode="gauge+number+delta",
                    value=prediction,
                    title={'text': "Прогноз посещаемости", 'font': {'size': 18}},
                    delta={'reference': df['ATTENDANCE'].mean(), 'increasing': {'color': "#27AE60"}},
                    gauge={
                        'axis': {'range': [0, 100000], 'tickwidth': 1, 'tickcolor': "#2C3E50"},
                        'bar': {'color': "#3498DB"},
                        'bgcolor': "white",
                        'borderwidth': 2,
                        'bordercolor': "#BDC3C7",
                        'steps': [
                            {'range': [0, 25000], 'color': '#E8F8F5'},
                            {'range': [25000, 50000], 'color': '#D1F2EB'},
                            {'range': [50000, 75000], 'color': '#A3E4D7'},
                            {'range': [75000, 100000], 'color': '#76D7C4'}
                        ],
                        'threshold': {
                            'line': {'color': "#E74C3C", 'width': 4},
                            'thickness': 0.75,
                            'value': 80000
                        }
                    }
                ))
                fig.update_layout(height=300)
                st.plotly_chart(fig, use_container_width=True, key="prediction_gauge")
            
            with col2:
                st.markdown("### 📊 Сравнение")
                avg_attendance = df['ATTENDANCE'].mean()
                st.metric(
                    "Средняя посещаемость", 
                    f"{avg_attendance:,.0f}",
                    delta=f"{prediction - avg_attendance:,.0f}"
                )
                
                max_attendance = df['ATTENDANCE'].max()
                min_attendance = df['ATTENDANCE'].min()
                
                st.markdown(f"**Максимальная:** {max_attendance:,.0f}")
                st.markdown(f"**Минимальная:** {min_attendance:,.0f}")
            
            # Дополнительная информация
            st.markdown("---")
            st.markdown("### 📋 Параметры прогноза")
            
            col1, col2, col3, col4 = st.columns(4)
            with col1:
                st.metric("🏠 Хозяева", home_team)
            with col2:
                st.metric("✈️ Гости", away_team)
            with col3:
                st.metric("⚽ Счет", f"{home_score}:{away_score}")
            with col4:
                st.metric("🏟️ Стадион", stadium[:20] + "..." if len(stadium) > 20 else stadium)

# Подвал приложения
st.markdown("---")
st.markdown("""
<div style='text-align: center; color: #7F8C8D; padding: 20px;'>
    <p>© 2026 | Соболев Р.В. | Б.ПИН.РИС - 22.06 | Тверской государственный технический университет</p>
    <p>Практическая работа №2 | Анализ больших данных | UEFA Champions League Analytics</p>
</div>
""", unsafe_allow_html=True)