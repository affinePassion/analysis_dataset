"""
UEFA Champions League Streamlit Client with AutoML
"""

import streamlit as st
import requests
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots

API_URL = "http://localhost:8000"

st.set_page_config(
    page_title="UEFA Champions League Analytics",
    page_icon="⚽",
    layout="wide"
)

st.title("⚽ UEFA Champions League 2016-2022")
st.subheader("Аналитическая панель с AutoML")

# Боковая панель
st.sidebar.title("📋 Навигация")
page = st.sidebar.radio(
    "Выберите раздел:",
    ["📖 Описание", "📊 EDA анализ", "🤖 ML модель", "🚀 AutoML"]
)

st.sidebar.markdown("---")
st.sidebar.markdown("### 🔌 Статус API")

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
    response = requests.get(f"{API_URL}/stats")
    return response.json() if response.status_code == 200 else None

@st.cache_data
def get_top_attendance(limit=10):
    response = requests.get(f"{API_URL}/teams/top-attendance", params={"limit": limit})
    return response.json() if response.status_code == 200 else []

@st.cache_data
def get_top_scorers(limit=10):
    response = requests.get(f"{API_URL}/players/top-scorers", params={"limit": limit})
    return response.json() if response.status_code == 200 else []

@st.cache_data
def get_season_stats():
    response = requests.get(f"{API_URL}/seasons/stats")
    return response.json() if response.status_code == 200 else []

@st.cache_data
def get_top_stadiums(limit=10):
    response = requests.get(f"{API_URL}/stadiums/top-matches", params={"limit": limit})
    return response.json() if response.status_code == 200 else []

@st.cache_data
def get_ml_metrics():
    response = requests.get(f"{API_URL}/ml/metrics")
    return response.json() if response.status_code == 200 else None

@st.cache_data
def get_automl_results():
    response = requests.get(f"{API_URL}/automl/results")
    return response.json() if response.status_code == 200 else None

@st.cache_data
def get_automl_comparison():
    response = requests.get(f"{API_URL}/automl/metrics")
    return response.json() if response.status_code == 200 else None

def check_automl_available():
    response = requests.get(f"{API_URL}/automl/available")
    return response.json() if response.status_code == 200 else {"automl_trained": False}

def train_automl():
    with st.spinner("🔄 Обучение AutoML модели... Это может занять несколько минут..."):
        response = requests.post(f"{API_URL}/automl/train", timeout=300)
    return response.json() if response.status_code == 200 else None

def predict_attendance(home_team, away_team, stadium, season, home_score, away_score, model_type="manual"):
    data = {
        "home_team": home_team,
        "away_team": away_team,
        "stadium": stadium,
        "season": season,
        "home_score": home_score,
        "away_score": away_score,
        "model_type": model_type
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
            Аналитическая панель для исследования данных Лиги Чемпионов УЕФА 2016-2022.
            
            ### 🛠️ Архитектура
            - **Frontend:** Streamlit
            - **Backend:** FastAPI
            - **ML:** Scikit-learn + PyCaret (AutoML)
            """)
        with col2:
            st.markdown("### 📊 Статистика")
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
    
    tab1, tab2, tab3, tab4 = st.tabs(["🏆 Команды", "⚽ Бомбардиры", "📈 Сезоны", "🏟️ Стадионы"])
    
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
        st.markdown("### 🏟️ Топ-10 стадионов")
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
    st.markdown("## 🤖 Ручная ML модель (RandomForest)")
    
    tab1, tab2 = st.tabs(["📊 Метрики", "🔮 Предсказание"])
    
    with tab1:
        st.markdown("### 📊 Метрики ручной модели")
        metrics = get_ml_metrics()
        if metrics:
            col1, col2, col3 = st.columns(3)
            with col1:
                st.metric("📚 Обучающая", metrics['train_size'])
            with col2:
                st.metric("📝 Тестовая", metrics['test_size'])
            with col3:
                st.metric("🎯 R² Score", f"{metrics['r2']:.3f}")
            col1, col2 = st.columns(2)
            with col1:
                st.metric("📊 MAE", f"{metrics['mae']:,.0f}")
            with col2:
                st.metric("📈 RMSE", f"{metrics['rmse']:,.0f}")
    
    with tab2:
        st.markdown("### 🔮 Предсказание")
        stats = get_stats()
        if stats:
            col1, col2 = st.columns(2)
            with col1:
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
            
            if st.button("🎯 Предсказать (Ручная модель)", type="primary"):
                prediction = predict_attendance(
                    home_team, away_team, stadium, season, 
                    home_score, away_score, "manual"
                )
                if prediction:
                    st.success(f"### Прогноз: {prediction['predicted_attendance']:,.0f} зрителей")
                    st.info(f"Модель: {prediction.get('model_used', 'Ручная')}")

elif page == "🚀 AutoML":
    st.markdown("## 🚀 AutoML (PyCaret)")
    st.markdown("Автоматическое обучение и сравнение моделей машинного обучения")
    
    # Проверяем доступность AutoML
    available = check_automl_available()
    
    if not available.get('automl_trained', False):
        st.warning("⚠️ AutoML модель еще не обучена")
        
        if st.button("🚀 Обучить AutoML модель", type="primary"):
            result = train_automl()
            if result:
                st.success(f"✅ {result['message']}")
                st.info(f"Лучшая модель: {result['best_model']}")
                st.rerun()
            else:
                st.error("Ошибка обучения")
    else:
        st.success("✅ AutoML модель обучена и готова к использованию")
        
        tab1, tab2, tab3 = st.tabs(["📊 Сравнение моделей", "📈 Метрики", "🔮 Предсказание"])
        
        with tab1:
            st.markdown("### 📊 Результаты AutoML")
            st.markdown("Сравнение алгоритмов, протестированных PyCaret:")
            
            results = get_automl_results()
            if results:
                # Таблица моделей
                models_df = pd.DataFrame(results['compared_models'])
                models_df.columns = ['Алгоритм', 'MAE', 'RMSE', 'R²']
                models_df = models_df.round({'MAE': 0, 'RMSE': 0, 'R²': 3})
                
                # Выделяем лучшую модель
                def highlight_best(row):
                    if row['Алгоритм'] == results['best_model']:
                        return ['background-color: #90EE90'] * len(row)
                    return [''] * len(row)
                
                st.dataframe(models_df.style.apply(highlight_best, axis=1), hide_index=True)
                
                st.markdown("---")
                st.markdown(f"### 🏆 Лучшая модель: **{results['best_model']}**")
                
                col1, col2, col3 = st.columns(3)
                with col1:
                    st.metric("MAE", f"{results['best_model_mae']:,.0f}")
                with col2:
                    st.metric("RMSE", f"{results['best_model_rmse']:,.0f}")
                with col3:
                    st.metric("R²", f"{results['best_model_r2']:.3f}")
        
        with tab2:
            st.markdown("### 📈 Сравнение с ручной моделью")
            
            comparison = get_automl_comparison()
            if comparison:
                col1, col2 = st.columns(2)
                
                with col1:
                    st.markdown("#### 🔧 Ручная модель (RandomForest)")
                    manual = comparison['manual_model']
                    st.metric("MAE", f"{manual['mae']:,.0f}")
                    st.metric("RMSE", f"{manual['rmse']:,.0f}")
                    st.metric("R²", f"{manual['r2']:.3f}")
                
                with col2:
                    st.markdown("#### 🚀 AutoML модель")
                    automl = comparison['automl_model']
                    st.metric("MAE", f"{automl['mae']:,.0f}", 
                             delta=f"{-comparison['improvement']['mae_percent']:.1f}%")
                    st.metric("RMSE", f"{automl['rmse']:,.0f}",
                             delta=f"{-comparison['improvement']['rmse_percent']:.1f}%")
                    st.metric("R²", f"{automl['r2']:.3f}",
                             delta=f"{comparison['improvement']['r2_percent']:.1f}%")
                
                st.markdown("---")
                st.markdown("### 📊 Визуальное сравнение")
                
                # График сравнения
                models = ['Ручная модель', 'AutoML']
                mae_values = [manual['mae'], automl['mae']]
                rmse_values = [manual['rmse'], automl['rmse']]
                
                fig = go.Figure()
                fig.add_trace(go.Bar(name='MAE', x=models, y=mae_values, marker_color='#3498DB'))
                fig.add_trace(go.Bar(name='RMSE', x=models, y=rmse_values, marker_color='#E74C3C'))
                fig.update_layout(title='Сравнение ошибок моделей (меньше = лучше)')
                st.plotly_chart(fig, use_container_width=True)
        
        with tab3:
            st.markdown("### 🔮 Предсказание с AutoML")
            
            stats = get_stats()
            if stats:
                col1, col2 = st.columns(2)
                with col1:
                    top_attendance = get_top_attendance(50)
                    teams = sorted(list(set([t['team_name'] for t in top_attendance])))
                    stadiums_data = get_top_stadiums(50)
                    stadiums = sorted([s['name'] for s in stadiums_data])
                    
                    home_team = st.selectbox("🏠 Домашняя команда", teams, key="automl_home")
                    away_team = st.selectbox("✈️ Гостевая команда", teams, key="automl_away")
                    season = st.selectbox("📅 Сезон", stats['seasons'], key="automl_season")
                with col2:
                    home_score = st.slider("⚽ Голы хозяев", 0, 10, 2, key="automl_home_score")
                    away_score = st.slider("⚽ Голы гостей", 0, 10, 1, key="automl_away_score")
                    stadium = st.selectbox("🏟️ Стадион", stadiums, key="automl_stadium")
                
                model_choice = st.radio(
                    "Выберите модель для предсказания:",
                    ["Ручная (RandomForest)", "AutoML (лучшая модель)"],
                    horizontal=True
                )
                
                if st.button("🎯 Предсказать", type="primary", key="automl_predict"):
                    model_type = "automl" if "AutoML" in model_choice else "manual"
                    prediction = predict_attendance(
                        home_team, away_team, stadium, season,
                        home_score, away_score, model_type
                    )
                    if prediction:
                        st.success(f"### Прогноз: {prediction['predicted_attendance']:,.0f} зрителей")
                        st.info(f"Использована модель: {prediction.get('model_used', 'Неизвестно')}")

st.markdown("---")
st.markdown("© 2026 | Соболев Р.В. | Б.ПИН.РИС - 22.06 | ТвГТУ")