"""
UEFA Champions League API Server
FastAPI сервер для предоставления данных Лиги Чемпионов УЕФА
"""

from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional, Dict, Any
import pandas as pd
import numpy as np
from datetime import datetime
import pickle
import os
from sklearn.ensemble import RandomForestRegressor
from sklearn.preprocessing import LabelEncoder

# Создание приложения FastAPI
app = FastAPI(
    title="UEFA Champions League API",
    description="API для анализа данных Лиги Чемпионов УЕФА 2016-2022",
    version="1.0.0"
)

# Настройка CORS (чтобы Streamlit мог обращаться к API)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # В продакшене заменить на конкретный домен
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Глобальные переменные для данных
data = {}
model = None
encoders = {}

# ========== Pydantic модели для ответов ==========

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

class PlayerProfile(BaseModel):
    player_id: str
    first_name: str
    last_name: str
    team: str
    nationality: str
    position: str
    height: Optional[int]
    weight: Optional[int]
    total_goals: int
    matches_played: int

class StadiumStats(BaseModel):
    name: str
    city: str
    country: str
    capacity: int
    matches_count: int

class SeasonStats(BaseModel):
    season: str
    matches: int
    total_goals: int
    avg_goals: float
    avg_attendance: float

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

class PredictionResponse(BaseModel):
    predicted_attendance: float
    avg_attendance: float
    max_attendance: float
    min_attendance: float

class MLMetrics(BaseModel):
    mae: float
    rmse: float
    r2: float
    train_size: int
    test_size: int

# ========== Загрузка данных при старте ==========

@app.on_event("startup")
async def load_data():
    """Загрузка данных при запуске сервера"""
    global data, model, encoders
    
    try:
        data['stadiums'] = pd.read_csv('data/stadiums.csv', sep=';')
        data['teams'] = pd.read_csv('data/teams.csv', sep=';')
        data['players'] = pd.read_csv('data/players.csv', sep=';')
        data['managers'] = pd.read_csv('data/managers.csv', sep=';')
        data['matches'] = pd.read_csv('data/matches.csv', sep=';')
        data['goals'] = pd.read_csv('data/goals.csv', sep=';')
        
        print("✅ Данные успешно загружены")
        
        # Обучение модели при старте
        train_model()
        print("✅ Модель обучена и готова")
        
    except Exception as e:
        print(f"❌ Ошибка загрузки данных: {e}")

def train_model():
    """Обучение модели машинного обучения"""
    global model, encoders
    
    df = data['matches'].copy()
    df = df.dropna(subset=['ATTENDANCE'])
    
    df['TOTAL_GOALS'] = df['HOME_TEAM_SCORE'] + df['AWAY_TEAM_SCORE']
    df['GOAL_DIFFERENCE'] = abs(df['HOME_TEAM_SCORE'] - df['AWAY_TEAM_SCORE'])
    
    # Кодирование
    for col, name in [('HOME_TEAM', 'home'), ('AWAY_TEAM', 'away'), 
                      ('STADIUM', 'stadium'), ('SEASON', 'season')]:
        le = LabelEncoder()
        df[f'{col}_ENC'] = le.fit_transform(df[col])
        encoders[name] = le
    
    features = ['HOME_TEAM_ENC', 'AWAY_TEAM_ENC', 'STADIUM_ENC', 'SEASON_ENC',
                'HOME_TEAM_SCORE', 'AWAY_TEAM_SCORE', 'TOTAL_GOALS', 'GOAL_DIFFERENCE']
    
    X = df[features].fillna(0)
    y = df['ATTENDANCE'].fillna(0)
    
    model = RandomForestRegressor(n_estimators=100, max_depth=10, random_state=42, n_jobs=-1)
    model.fit(X, y)

# ========== Эндпоинты API ==========

@app.get("/")
async def root():
    """Корневой эндпоинт"""
    return {
        "message": "UEFA Champions League API",
        "version": "1.0.0",
        "endpoints": [
            "/stats - Статистика датасета",
            "/teams/top-attendance - Топ команд по посещаемости",
            "/players/top-scorers - Топ бомбардиров",
            "/players/{player_name} - Информация об игроке",
            "/stadiums/top-matches - Топ стадионов по матчам",
            "/seasons/stats - Статистика по сезонам",
            "/ml/metrics - Метрики модели",
            "/ml/predict - Предсказание посещаемости"
        ]
    }

@app.get("/stats", response_model=DatasetStats)
async def get_stats():
    """Получение общей статистики датасета"""
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
    """Топ команд по посещаемости домашних матчей"""
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
    """Топ бомбардиров турнира"""
    if not data:
        raise HTTPException(status_code=500, detail="Данные не загружены")
    
    goals_by_player = data['goals'].merge(
        data['players'][['PLAYER_ID', 'FIRST_NAME', 'LAST_NAME', 'TEAM', 'NATIONALITY']],
        left_on='PID',
        right_on='PLAYER_ID',
        how='left'
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

@app.get("/players/{player_name}", response_model=PlayerProfile)
async def get_player_profile(player_name: str):
    """Получение профиля игрока по имени"""
    if not data:
        raise HTTPException(status_code=500, detail="Данные не загружены")
    
    # Поиск игрока (можно искать по части имени)
    player_match = data['players'][
        data['players'].apply(
            lambda x: player_name.lower() in f"{str(x['FIRST_NAME'])} {str(x['LAST_NAME'])}".lower(), 
            axis=1
        )
    ]
    
    if player_match.empty:
        raise HTTPException(status_code=404, detail=f"Игрок '{player_name}' не найден")
    
    player = player_match.iloc[0]
    player_id = player['PLAYER_ID']
    
    # Подсчет голов
    player_goals = data['goals'][data['goals']['PID'] == player_id]
    total_goals = len(player_goals)
    matches_played = len(player_goals['MATCH_ID'].unique())
    
    return PlayerProfile(
        player_id=player_id,
        first_name=player['FIRST_NAME'] if pd.notna(player['FIRST_NAME']) else "",
        last_name=player['LAST_NAME'] if pd.notna(player['LAST_NAME']) else "",
        team=player['TEAM'],
        nationality=player['NATIONALITY'],
        position=player['POSITION'],
        height=int(player['HEIGHT']) if pd.notna(player['HEIGHT']) else None,
        weight=int(player['WEIGHT']) if pd.notna(player['WEIGHT']) else None,
        total_goals=total_goals,
        matches_played=matches_played
    )

@app.get("/stadiums/top-matches", response_model=List[StadiumStats])
async def get_top_stadiums(limit: int = Query(10, ge=1, le=50)):
    """Топ стадионов по количеству матчей"""
    if not data:
        raise HTTPException(status_code=500, detail="Данные не загружены")
    
    stadium_matches = data['matches'].groupby('STADIUM').size().reset_index(name='matches_count')
    stadium_matches = stadium_matches.merge(
        data['stadiums'][['NAME', 'CITY', 'COUNTRY', 'CAPACITY']],
        left_on='STADIUM',
        right_on='NAME',
        how='left'
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

@app.get("/seasons/stats", response_model=List[SeasonStats])
async def get_season_stats():
    """Статистика по сезонам"""
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

@app.get("/ml/metrics", response_model=MLMetrics)
async def get_ml_metrics():
    """Получение метрик ML модели"""
    if not data or model is None:
        raise HTTPException(status_code=500, detail="Модель не обучена")
    
    from sklearn.model_selection import train_test_split
    from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
    
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
    y_pred = model.predict(X_test)
    
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
    if not data or model is None:
        raise HTTPException(status_code=500, detail="Модель не обучена")
    
    total_goals = request.home_score + request.away_score
    goal_diff = abs(request.home_score - request.away_score)
    
    # Кодирование входных данных
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
    
    prediction = model.predict(input_data)[0]
    
    df = data['matches'].copy()
    df = df.dropna(subset=['ATTENDANCE'])
    
    return PredictionResponse(
        predicted_attendance=float(prediction),
        avg_attendance=float(df['ATTENDANCE'].mean()),
        max_attendance=float(df['ATTENDANCE'].max()),
        min_attendance=float(df['ATTENDANCE'].min())
    )

@app.get("/matches/top-scoring")
async def get_top_scoring_matches(limit: int = Query(10, ge=1, le=50)):
    """Самые результативные матчи"""
    if not data:
        raise HTTPException(status_code=500, detail="Данные не загружены")
    
    matches = data['matches'].copy()
    matches['TOTAL_GOALS'] = matches['HOME_TEAM_SCORE'] + matches['AWAY_TEAM_SCORE']
    top_matches = matches.nlargest(limit, 'TOTAL_GOALS')[
        ['MATCH_ID', 'SEASON', 'HOME_TEAM', 'AWAY_TEAM', 
         'HOME_TEAM_SCORE', 'AWAY_TEAM_SCORE', 'TOTAL_GOALS']
    ]
    
    return top_matches.to_dict(orient='records')

# ========== Запуск сервера ==========
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)