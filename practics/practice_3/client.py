"""
UEFA Champions League Streamlit Client
Клиентская часть, работающая с FastAPI сервером
"""

import streamlit as st
import requests
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots

# Конфигурация API
API_URL = "http://localhost:8000"

# Настройка страницы
st.set_page_config(
    page_title="UEFA Champions League Analytics",
    page_icon="⚽",
    layout="wide"
)

st.title("⚽ UEFA Champions League 2016-2022")
st.subheader("Аналитическая панель данных Лиги Чемпионов УЕФА")

# Боковая панель
st.sidebar.title("📋 Навигация")
page = st.sidebar.radio(
    "Выберите раздел:",
    ["📖 Описание", "📊 EDA анализ", "🤖 ML модель"]
)

st.sidebar.markdown("---")
st.sidebar.markdown("### 🔌 Статус API")

# Проверка соединения с API
try:
    response = requests.get(f"{API_URL}/", timeout=5)
    if response.status_code == 200:
        st.sidebar.success("✅ API подключен")
        api_data = response.json()
        st.sidebar.markdown(f"**Версия:** {api_data.get('version', 'N/A')}")
    else:
        st.sidebar.error("❌ API недоступен")
except:
    st.sidebar.error("❌ Не удалось подключиться к API")

st.sidebar.markdown("---")
st.sidebar.markdown("### 👤 Информация")
st.sidebar.markdown("**Студент:** Соболев Р.В.")
st.sidebar.markdown("**Группа:** Б.ПИН.РИС - 22.06")

# ========== Функции для запросов к API ==========

@st.cache_data
def get_stats():
    """Получение статистики датасета"""
    response = requests.get(f"{API_URL}/stats")
    return response.json() if response.status_code == 200 else None

@st.cache_data
def get_top_attendance(limit=10):
    """Топ команд по посещаемости"""
    response = requests.get(f"{API_URL}/teams/top-attendance", params={"limit": limit})
    return response.json() if response.status_code == 200 else []

@st.cache_data
def get_top_scorers(limit=10):
    """Топ бомбардиров"""
    response = requests.get(f"{API_URL}/players/top-scorers", params={"limit": limit})
    return response.json() if response.status_code == 200 else []

@st.cache_data
def get_season_stats():
    """Статистика по сезонам"""
    response = requests.get(f"{API_URL}/seasons/stats")
    return response.json() if response.status_code == 200 else []

@st.cache_data
def get_top_stadiums(limit=10):
    """Топ стадионов"""
    response = requests.get(f"{API_URL}/stadiums/top-matches", params={"limit": limit})
    return response.json() if response.status_code == 200 else []

@st.cache_data
def get_ml_metrics():
    """Метрики ML модели"""
    response = requests.get(f"{API_URL}/ml/metrics")
    return response.json() if response.status_code == 200 else None

def predict_attendance(home_team, away_team, stadium, season, home_score, away_score):
    """Предсказание посещаемости"""
    data = {
        "home_team": home_team,
        "away_team": away_team,
        "stadium": stadium,
        "season": season,
        "home_score": home_score,
        "away_score": away_score
    }
    response = requests.post(f"{API_URL}/ml/predict", json=data)
    return response.json() if response.status_code == 200 else None

# ========== Страницы ==========

if page == "📖 Описание":
    st.markdown("## 📖 Описание проекта")
    
    stats = get_stats()
    
    if stats:
        col1, col2 = st.columns(2)
        
        with col1:
            st.markdown("""
            ### 🎯 Цель проекта
            Данный проект представляет собой аналитическую панель для исследования 
            данных Лиги Чемпионов УЕФА за период с 2016 по 2022 год.
            
            ### 🛠️ Архитектура
            - **Frontend:** Streamlit
            - **Backend:** FastAPI
            - **ML:** Scikit-learn (RandomForestRegressor)
            """)
        
        with col2:
            st.markdown("### 📊 Статистика датасета")
            col_a, col_b = st.columns(2)
            with col_a:
                st.metric("🏟️ Стадионы", stats['stadiums'])
                st.metric("⚽ Команды", stats['teams'])
                st.metric("👤 Игроки", stats['players'])
            with col_b:
                st.metric("👔 Тренеры", stats['managers'])
                st.metric("📅 Матчи", stats['matches'])
                st.metric("🥅 Голы", stats['goals'])
            
            st.markdown(f"**📅 Сезоны:** {', '.join(stats['seasons'])}")

elif page == "📊 EDA анализ":
    st.markdown("## 📊 Исследовательский анализ данных")
    
    tab1, tab2, tab3, tab4 = st.tabs([
        "🏆 Топ команд", "⚽ Топ бомбардиры", "📈 Сезоны", "🏟️ Стадионы"
    ])
    
    with tab1:
        st.markdown("### 🏆 Топ-10 команд по посещаемости")
        
        data = get_top_attendance()
        if data:
            df = pd.DataFrame(data)
            
            col1, col2 = st.columns(2)
            with col1:
                st.dataframe(df, hide_index=True)
            with col2:
                fig = px.bar(df, x='team_name', y='total_attendance',
                           title='Общая посещаемость', color='total_attendance')
                st.plotly_chart(fig, use_container_width=True)
    
    with tab2:
        st.markdown("### ⚽ Топ-10 бомбардиров")
        
        data = get_top_scorers()
        if data:
            df = pd.DataFrame(data)
            
            col1, col2 = st.columns(2)
            with col1:
                st.dataframe(df[['full_name', 'team', 'goals']], hide_index=True)
            with col2:
                fig = px.bar(df, y='full_name', x='goals', orientation='h',
                           title='Количество голов', color='goals')
                st.plotly_chart(fig, use_container_width=True)
    
    with tab3:
        st.markdown("### 📈 Статистика по сезонам")
        
        data = get_season_stats()
        if data:
            df = pd.DataFrame(data)
            st.dataframe(df, hide_index=True)
            
            fig = make_subplots(specs=[[{"secondary_y": True}]])
            fig.add_trace(go.Scatter(x=df['season'], y=df['avg_goals'],
                                     name="Ср. голов", mode="lines+markers"), secondary_y=False)
            fig.add_trace(go.Bar(x=df['season'], y=df['avg_attendance'],
                                 name="Ср. посещаемость"), secondary_y=True)
            st.plotly_chart(fig, use_container_width=True)
    
    with tab4:
        st.markdown("### 🏟️ Топ-10 стадионов по матчам")
        
        data = get_top_stadiums()
        if data:
            df = pd.DataFrame(data)
            
            col1, col2 = st.columns(2)
            with col1:
                st.dataframe(df, hide_index=True)
            with col2:
                fig = px.scatter(df, x='capacity', y='matches_count', size='matches_count',
                               color='country', hover_name='name')
                st.plotly_chart(fig, use_container_width=True)

elif page == "🤖 ML модель":
    st.markdown("## 🤖 Машинное обучение")
    
    tab1, tab2 = st.tabs(["📊 Метрики", "🔮 Предсказание"])
    
    with tab1:
        st.markdown("### 📊 Метрики модели")
        
        metrics = get_ml_metrics()
        if metrics:
            col1, col2, col3 = st.columns(3)
            with col1:
                st.metric("📚 Обучающая выборка", metrics['train_size'])
            with col2:
                st.metric("📝 Тестовая выборка", metrics['test_size'])
            with col3:
                st.metric("🎯 R² Score", f"{metrics['r2']:.3f}")
            
            col1, col2 = st.columns(2)
            with col1:
                st.metric("📊 MAE", f"{metrics['mae']:,.0f}")
            with col2:
                st.metric("📈 RMSE", f"{metrics['rmse']:,.0f}")
    
    with tab2:
        st.markdown("### 🔮 Предсказание посещаемости")
        
        stats = get_stats()
        if stats:
            col1, col2 = st.columns(2)
            
            with col1:
                # Получаем списки из данных
                top_attendance = get_top_attendance(50)
                teams = sorted(list(set([t['team_name'] for t in top_attendance])))
                stadiums_data = get_top_stadiums(50)
                stadiums = sorted([s['name'] for s in stadiums_data])
                
                home_team = st.selectbox("🏠 Домашняя команда", teams)
                away_team = st.selectbox("✈️ Гостевая команда", teams)
                season = st.selectbox("📅 Сезон", stats['seasons'])
            
            with col2:
                home_score = st.slider("⚽ Голы хозяев", 0, 10, 2)
                away_score = st.slider("⚽ Голы гостей", 0, 10, 1)
                stadium = st.selectbox("🏟️ Стадион", stadiums)
            
            if st.button("🎯 Предсказать", type="primary"):
                prediction = predict_attendance(
                    home_team, away_team, stadium, season, home_score, away_score
                )
                
                if prediction:
                    st.success(f"### Прогнозируемая посещаемость: {prediction['predicted_attendance']:,.0f} зрителей")
                    
                    fig = go.Figure(go.Indicator(
                        mode="gauge+number",
                        value=prediction['predicted_attendance'],
                        title={'text': "Прогноз посещаемости"},
                        gauge={'axis': {'range': [0, 100000]},
                               'bar': {'color': "#3498DB"}}
                    ))
                    st.plotly_chart(fig, use_container_width=True)

st.markdown("---")
st.markdown("© 2026 | Соболев Р.В. | Б.ПИН.РИС - 22.06 | ТвГТУ")