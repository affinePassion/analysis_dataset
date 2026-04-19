from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional, Dict, Any
import pandas as pd
import numpy as np
import pickle
import os
from sklearn.ensemble import RandomForestRegressor
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

# Импорт PyCaret для AutoML
from pycaret.regression import *

app = FastAPI(
    title="UEFA Champions League API with AutoML",
    description="API для анализа данных с поддержкой AutoML",
    version="2.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Глобальные переменные
data = {}
manual_model = None
automl_model = None
automl_results = None
encoders = {}

# ========== Pydantic модели ==========

class TeamAttendance(BaseModel):
    team_name: str
    home_matches: int
    total_attendance: int
    avg_attendance: float

class TopScorer(BaseModel):
    first_name: Optional[str]
    last_name: Optional[str]
    full_name: str
    team: str
    nationality: str
    goals: int

class SeasonStats(BaseModel):
    season: str
    matches: int
    total_goals: int
    avg_goals: float
    avg_attendance: float

class StadiumStats(BaseModel):
    name: str
    city: str
    country: str
    capacity: int
    matches_count: int

class DatasetStats(BaseModel):
    stadiums: int
    teams: int
    players: int
    managers: int
    matches: int
    goals: int
    seasons: List[str]

class PredictionRequest(BaseModel):
    home_team: str
    away_team: str
    stadium: str
    season: str
    home_score: int
    away_score: int
    model_type: str = "manual"  # "manual" или "automl"

class PredictionResponse(BaseModel):
    predicted_attendance: float
    avg_attendance: float
    max_attendance: float
    min_attendance: float
    model_used: str

class MLMetrics(BaseModel):
    mae: float
    rmse: float
    r2: float
    train_size: int
    test_size: int

class AutoMLModelInfo(BaseModel):
    model_name: str
    mae: float
    rmse: float
    r2: float

class AutoMLResults(BaseModel):
    best_model: str
    best_model_mae: float
    best_model_rmse: float
    best_model_r2: float
    compared_models: List[AutoMLModelInfo]
    manual_model_metrics: MLMetrics

# ========== Загрузка данных ==========

@app.on_event("startup")
async def load_data():
    global data, manual_model, automl_model, automl_results, encoders
    
    try:
        data['stadiums'] = pd.read_csv('data/stadiums.csv', sep=';')
        data['teams'] = pd.read_csv('data/teams.csv', sep=';')
        data['players'] = pd.read_csv('data/players.csv', sep=';')
        data['managers'] = pd.read_csv('data/managers.csv', sep=';')
        data['matches'] = pd.read_csv('data/matches.csv', sep=';')
        data['goals'] = pd.read_csv('data/goals.csv', sep=';')
        
        print("✅ Данные загружены")
        
        # Обучение ручной модели
        train_manual_model()
        print("✅ Ручная модель обучена")
        
        # Загрузка AutoML модели
        automl_path = 'models/automl_model'
        results_path = 'models/automl_results.pkl'
        
        if os.path.exists(f'{automl_path}.pkl'):
            automl_model = load_model(automl_path)
            print("✅ AutoML модель загружена")
            
            # Загружаем сохраненные результаты, если есть
            if os.path.exists(results_path):
                with open(results_path, 'rb') as f:
                    automl_results = pickle.load(f)
                print("✅ Результаты AutoML загружены")
            else:
                print("⚠️ Результаты AutoML не найдены. Переобучите модель.")
        else:
            print("⚠️ AutoML модель не найдена. Запустите /automl/train")
        
    except Exception as e:
        print(f"❌ Ошибка: {e}")

def train_manual_model():
    global manual_model, encoders
    
    df = data['matches'].copy()
    df = df.dropna(subset=['ATTENDANCE'])
    df['TOTAL_GOALS'] = df['HOME_TEAM_SCORE'] + df['AWAY_TEAM_SCORE']
    df['GOAL_DIFFERENCE'] = abs(df['HOME_TEAM_SCORE'] - df['AWAY_TEAM_SCORE'])
    
    for col, name in [('HOME_TEAM', 'home'), ('AWAY_TEAM', 'away'), 
                      ('STADIUM', 'stadium'), ('SEASON', 'season')]:
        le = LabelEncoder()
        df[f'{col}_ENC'] = le.fit_transform(df[col])
        encoders[name] = le
    
    features = ['HOME_TEAM_ENC', 'AWAY_TEAM_ENC', 'STADIUM_ENC', 'SEASON_ENC',
                'HOME_TEAM_SCORE', 'AWAY_TEAM_SCORE', 'TOTAL_GOALS', 'GOAL_DIFFERENCE']
    
    X = df[features].fillna(0)
    y = df['ATTENDANCE'].fillna(0)
    
    manual_model = RandomForestRegressor(n_estimators=100, max_depth=10, random_state=42, n_jobs=-1)
    manual_model.fit(X, y)

def prepare_data_for_automl():
    """Подготовка данных для AutoML"""
    df = data['matches'].copy()
    df = df.dropna(subset=['ATTENDANCE'])
    df['TOTAL_GOALS'] = df['HOME_TEAM_SCORE'] + df['AWAY_TEAM_SCORE']
    df['GOAL_DIFFERENCE'] = abs(df['HOME_TEAM_SCORE'] - df['AWAY_TEAM_SCORE'])
    
    # Выбираем признаки для AutoML
    features = ['HOME_TEAM', 'AWAY_TEAM', 'STADIUM', 'SEASON',
                'HOME_TEAM_SCORE', 'AWAY_TEAM_SCORE', 'TOTAL_GOALS', 'GOAL_DIFFERENCE']
    
    df_ml = df[features + ['ATTENDANCE']].copy()
    df_ml = df_ml.dropna()
    
    return df_ml

# ========== Эндпоинты ==========

@app.get("/")
async def root():
    return {
        "message": "UEFA Champions League API with AutoML",
        "version": "2.0.0",
        "endpoints": [
            "/stats", "/teams/*", "/players/*", "/stadiums/*", "/seasons/*",
            "/ml/metrics", "/ml/predict",
            "/automl/train", "/automl/results", "/automl/metrics"
        ]
    }

@app.get("/stats", response_model=DatasetStats)
async def get_stats():
    if not data:
        raise HTTPException(status_code=500, detail="Данные не загружены")
    
    seasons = sorted(data['matches']['SEASON'].unique().tolist())
    return DatasetStats(
        stadiums=len(data['stadiums']),
        teams=len(data['teams']),
        players=len(data['players']),
        managers=len(data['managers']),
        matches=len(data['matches']),
        goals=len(data['goals']),
        seasons=seasons
    )

@app.get("/teams/top-attendance", response_model=List[TeamAttendance])
async def get_top_attendance(limit: int = Query(10, ge=1, le=50)):
    if not data:
        raise HTTPException(status_code=500, detail="Данные не загружены")
    
    home_attendance = data['matches'].groupby('HOME_TEAM').agg({
        'ATTENDANCE': ['sum', 'mean', 'count']
    }).round(0)
    home_attendance.columns = ['total_attendance', 'avg_attendance', 'home_matches']
    home_attendance = home_attendance.sort_values('total_attendance', ascending=False).head(limit)
    
    result = []
    for team, row in home_attendance.iterrows():
        result.append(TeamAttendance(
            team_name=team,
            home_matches=int(row['home_matches']),
            total_attendance=int(row['total_attendance']),
            avg_attendance=float(row['avg_attendance'])
        ))
    return result

@app.get("/players/top-scorers", response_model=List[TopScorer])
async def get_top_scorers(limit: int = Query(10, ge=1, le=50)):
    if not data:
        raise HTTPException(status_code=500, detail="Данные не загружены")
    
    goals_by_player = data['goals'].merge(
        data['players'][['PLAYER_ID', 'FIRST_NAME', 'LAST_NAME', 'TEAM', 'NATIONALITY']],
        left_on='PID', right_on='PLAYER_ID', how='left'
    )
    top_scorers = goals_by_player.groupby(
        ['FIRST_NAME', 'LAST_NAME', 'TEAM', 'NATIONALITY']
    ).size().reset_index(name='goals')
    top_scorers = top_scorers.sort_values('goals', ascending=False).head(limit)
    
    result = []
    for _, row in top_scorers.iterrows():
        full_name = f"{row['FIRST_NAME'] if pd.notna(row['FIRST_NAME']) else ''} {row['LAST_NAME'] if pd.notna(row['LAST_NAME']) else ''}".strip()
        result.append(TopScorer(
            first_name=row['FIRST_NAME'] if pd.notna(row['FIRST_NAME']) else None,
            last_name=row['LAST_NAME'] if pd.notna(row['LAST_NAME']) else None,
            full_name=full_name,
            team=row['TEAM'],
            nationality=row['NATIONALITY'],
            goals=int(row['goals'])
        ))
    return result

@app.get("/seasons/stats", response_model=List[SeasonStats])
async def get_season_stats():
    if not data:
        raise HTTPException(status_code=500, detail="Данные не загружены")
    
    season_stats = data['matches'].copy()
    season_stats['TOTAL_GOALS'] = season_stats['HOME_TEAM_SCORE'] + season_stats['AWAY_TEAM_SCORE']
    season_agg = season_stats.groupby('SEASON').agg({
        'MATCH_ID': 'count',
        'TOTAL_GOALS': ['sum', 'mean'],
        'ATTENDANCE': 'mean'
    }).round(2)
    season_agg.columns = ['matches', 'total_goals', 'avg_goals', 'avg_attendance']
    season_agg = season_agg.reset_index()
    
    result = []
    for _, row in season_agg.iterrows():
        result.append(SeasonStats(
            season=row['SEASON'],
            matches=int(row['matches']),
            total_goals=int(row['total_goals']),
            avg_goals=float(row['avg_goals']),
            avg_attendance=float(row['avg_attendance'])
        ))
    return result

@app.get("/stadiums/top-matches", response_model=List[StadiumStats])
async def get_top_stadiums(limit: int = Query(10, ge=1, le=50)):
    if not data:
        raise HTTPException(status_code=500, detail="Данные не загружены")
    
    stadium_matches = data['matches'].groupby('STADIUM').size().reset_index(name='matches_count')
    stadium_matches = stadium_matches.merge(
        data['stadiums'][['NAME', 'CITY', 'COUNTRY', 'CAPACITY']],
        left_on='STADIUM', right_on='NAME', how='left'
    )
    stadium_matches = stadium_matches.sort_values('matches_count', ascending=False).head(limit)
    
    result = []
    for _, row in stadium_matches.iterrows():
        result.append(StadiumStats(
            name=row['NAME'],
            city=row['CITY'],
            country=row['COUNTRY'],
            capacity=int(row['CAPACITY']) if pd.notna(row['CAPACITY']) else 0,
            matches_count=int(row['matches_count'])
        ))
    return result

@app.get("/ml/metrics", response_model=MLMetrics)
async def get_ml_metrics():
    if not data or manual_model is None:
        raise HTTPException(status_code=500, detail="Модель не обучена")
    
    df = data['matches'].copy()
    df = df.dropna(subset=['ATTENDANCE'])
    df['TOTAL_GOALS'] = df['HOME_TEAM_SCORE'] + df['AWAY_TEAM_SCORE']
    df['GOAL_DIFFERENCE'] = abs(df['HOME_TEAM_SCORE'] - df['AWAY_TEAM_SCORE'])
    
    for col, name in [('HOME_TEAM', 'home'), ('AWAY_TEAM', 'away'), 
                      ('STADIUM', 'stadium'), ('SEASON', 'season')]:
        df[f'{col}_ENC'] = encoders[name].transform(df[col])
    
    features = ['HOME_TEAM_ENC', 'AWAY_TEAM_ENC', 'STADIUM_ENC', 'SEASON_ENC',
                'HOME_TEAM_SCORE', 'AWAY_TEAM_SCORE', 'TOTAL_GOALS', 'GOAL_DIFFERENCE']
    
    X = df[features].fillna(0)
    y = df['ATTENDANCE'].fillna(0)
    
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    y_pred = manual_model.predict(X_test)
    
    return MLMetrics(
        mae=float(mean_absolute_error(y_test, y_pred)),
        rmse=float(np.sqrt(mean_squared_error(y_test, y_pred))),
        r2=float(r2_score(y_test, y_pred)),
        train_size=len(X_train),
        test_size=len(X_test)
    )

@app.post("/ml/predict", response_model=PredictionResponse)
async def predict_attendance(request: PredictionRequest):
    """Предсказание посещаемости матча"""
    if not data:
        raise HTTPException(status_code=500, detail="Данные не загружены")
    
    # Выбор модели
    if request.model_type == "automl" and automl_model is not None:
        model = automl_model
        model_name = "AutoML (PyCaret)"
        
        # Для AutoML подаем оригинальные признаки (без _ENC)
        total_goals = request.home_score + request.away_score
        goal_diff = abs(request.home_score - request.away_score)
        
        input_data = pd.DataFrame({
            'HOME_TEAM': [request.home_team],
            'AWAY_TEAM': [request.away_team],
            'STADIUM': [request.stadium],
            'SEASON': [request.season],
            'HOME_TEAM_SCORE': [request.home_score],
            'AWAY_TEAM_SCORE': [request.away_score],
            'TOTAL_GOALS': [total_goals],
            'GOAL_DIFFERENCE': [goal_diff]
        })
        
    else:
        model = manual_model
        model_name = "Ручная (RandomForest)"
        
        # Для ручной модели используем закодированные признаки
        total_goals = request.home_score + request.away_score
        goal_diff = abs(request.home_score - request.away_score)
        
        input_data = pd.DataFrame({
            'HOME_TEAM_ENC': [encoders['home'].transform([request.home_team])[0] 
                              if request.home_team in encoders['home'].classes_ else 0],
            'AWAY_TEAM_ENC': [encoders['away'].transform([request.away_team])[0] 
                              if request.away_team in encoders['away'].classes_ else 0],
            'STADIUM_ENC': [encoders['stadium'].transform([request.stadium])[0] 
                            if request.stadium in encoders['stadium'].classes_ else 0],
            'SEASON_ENC': [encoders['season'].transform([request.season])[0] 
                           if request.season in encoders['season'].classes_ else 0],
            'HOME_TEAM_SCORE': [request.home_score],
            'AWAY_TEAM_SCORE': [request.away_score],
            'TOTAL_GOALS': [total_goals],
            'GOAL_DIFFERENCE': [goal_diff]
        })
    
    if model is None:
        raise HTTPException(status_code=500, detail="Модель не обучена")
    
    try:
        prediction = model.predict(input_data)[0]
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Ошибка предсказания: {str(e)}")
    
    df = data['matches'].copy()
    df = df.dropna(subset=['ATTENDANCE'])
    
    return PredictionResponse(
        predicted_attendance=float(prediction),
        avg_attendance=float(df['ATTENDANCE'].mean()),
        max_attendance=float(df['ATTENDANCE'].max()),
        min_attendance=float(df['ATTENDANCE'].min()),
        model_used=model_name
    )

# ========== AutoML Эндпоинты ==========

@app.post("/automl/train")
async def train_automl():
    """Обучение модели с помощью AutoML (PyCaret)"""
    global automl_model, automl_results
    
    try:
        df_ml = prepare_data_for_automl()
        
        # Настройка PyCaret
        s = setup(
            data=df_ml,
            target='ATTENDANCE',
            session_id=42,
            train_size=0.8,
            verbose=False,
            html=False,
            log_experiment=False
        )
        
        # Сравнение моделей
        best_model = compare_models(
            sort='RMSE',
            n_select=1,
            verbose=False
        )
        
        # Сохраняем результаты сравнения
        automl_results = pull()
        
        # Финальное обучение лучшей модели
        automl_model = finalize_model(best_model)
        
        # Сохраняем модель
        os.makedirs('models', exist_ok=True)
        save_model(automl_model, 'models/automl_model')
        
        # Сохраняем результаты в pickle
        with open('models/automl_results.pkl', 'wb') as f:
            pickle.dump(automl_results, f)
        
        return {
            "status": "success",
            "message": "AutoML модель успешно обучена",
            "best_model": str(best_model).split('(')[0]
        }
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Ошибка обучения AutoML: {str(e)}")

@app.get("/automl/results", response_model=AutoMLResults)
async def get_automl_results():
    """Получение результатов AutoML"""
    global automl_results, automl_model
    
    if automl_results is None:
        # Пробуем загрузить из файла
        results_path = 'models/automl_results.pkl'
        if os.path.exists(results_path):
            with open(results_path, 'rb') as f:
                automl_results = pickle.load(f)
            print("✅ Результаты AutoML загружены из файла")
        else:
            raise HTTPException(
                status_code=404, 
                detail="Результаты AutoML не найдены. Запустите обучение модели."
            )
    
    if automl_model is None:
        raise HTTPException(status_code=404, detail="AutoML модель не обучена")
    
    # Получаем метрики ручной модели
    manual_metrics = await get_ml_metrics()
    
    # Обрабатываем результаты AutoML
    results_df = automl_results.copy()
    
    # Топ-5 моделей
    top_models = results_df.nsmallest(5, 'RMSE')
    
    compared_models = []
    best_model_metrics = None
    
    for _, row in top_models.iterrows():
        model_info = AutoMLModelInfo(
            model_name=row['Model'],
            mae=float(row['MAE']),
            rmse=float(row['RMSE']),
            r2=float(row['R2'])
        )
        compared_models.append(model_info)
        
        if best_model_metrics is None:
            best_model_metrics = model_info
    
    return AutoMLResults(
        best_model=best_model_metrics.model_name,
        best_model_mae=best_model_metrics.mae,
        best_model_rmse=best_model_metrics.rmse,
        best_model_r2=best_model_metrics.r2,
        compared_models=compared_models,
        manual_model_metrics=manual_metrics
    )

@app.get("/automl/metrics")
async def get_automl_metrics():
    """Сравнение метрик ручной и AutoML моделей"""
    global automl_results
    
    if automl_results is None:
        # Пробуем загрузить из файла
        results_path = 'models/automl_results.pkl'
        if os.path.exists(results_path):
            with open(results_path, 'rb') as f:
                automl_results = pickle.load(f)
        else:
            raise HTTPException(
                status_code=404, 
                detail="Результаты AutoML не найдены. Запустите обучение модели."
            )
    
    manual_metrics = await get_ml_metrics()
    
    # Лучшая модель AutoML
    best_row = automl_results.nsmallest(1, 'RMSE').iloc[0]
    
    comparison = {
        "manual_model": {
            "name": "RandomForest (ручная настройка)",
            "mae": manual_metrics.mae,
            "rmse": manual_metrics.rmse,
            "r2": manual_metrics.r2
        },
        "automl_model": {
            "name": f"{best_row['Model']} (AutoML)",
            "mae": float(best_row['MAE']),
            "rmse": float(best_row['RMSE']),
            "r2": float(best_row['R2'])
        },
        "improvement": {
            "mae_percent": round((manual_metrics.mae - float(best_row['MAE'])) / manual_metrics.mae * 100, 2) if manual_metrics.mae > 0 else 0,
            "rmse_percent": round((manual_metrics.rmse - float(best_row['RMSE'])) / manual_metrics.rmse * 100, 2) if manual_metrics.rmse > 0 else 0,
            "r2_percent": round((float(best_row['R2']) - manual_metrics.r2) / manual_metrics.r2 * 100, 2) if manual_metrics.r2 > 0 else 0
        }
    }
    
    return comparison

@app.get("/automl/metrics")
async def get_automl_metrics():
    """Сравнение метрик ручной и AutoML моделей"""
    if automl_results is None:
        raise HTTPException(status_code=404, detail="AutoML модель не обучена")
    
    manual_metrics = await get_ml_metrics()
    
    # Лучшая модель AutoML
    best_row = automl_results.nsmallest(1, 'RMSE').iloc[0]
    
    comparison = {
        "manual_model": {
            "name": "RandomForest (ручная настройка)",
            "mae": manual_metrics.mae,
            "rmse": manual_metrics.rmse,
            "r2": manual_metrics.r2
        },
        "automl_model": {
            "name": f"{best_row['Model']} (AutoML)",
            "mae": float(best_row['MAE']),
            "rmse": float(best_row['RMSE']),
            "r2": float(best_row['R2'])
        },
        "improvement": {
            "mae_percent": round((manual_metrics.mae - float(best_row['MAE'])) / manual_metrics.mae * 100, 2),
            "rmse_percent": round((manual_metrics.rmse - float(best_row['RMSE'])) / manual_metrics.rmse * 100, 2),
            "r2_percent": round((float(best_row['R2']) - manual_metrics.r2) / manual_metrics.r2 * 100, 2)
        }
    }
    
    return comparison

@app.get("/automl/available")
async def check_automl_available():
    """Проверка доступности AutoML модели"""
    return {
        "automl_trained": automl_model is not None,
        "manual_trained": manual_model is not None
    }

# ========== Запуск ==========
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)