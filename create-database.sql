DROP DATABASE IF EXISTS dados_olimpiada;
CREATE DATABASE dados_olimpiada;
USE dados_olimpiada;

CREATE TABLE IF NOT EXISTS NOC (
    id INTEGER PRIMARY KEY, 
    name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Team (
    id INTEGER PRIMARY KEY, 
    name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Medal (
    id INTEGER PRIMARY KEY, 
    medal VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Sport (
    id INTEGER PRIMARY KEY, 
    name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Modality (
    id INTEGER PRIMARY KEY, 
    name  VARCHAR(100),
    id_sport INTEGER,
    FOREIGN KEY (id_sport) REFERENCES Sport(id)
);

CREATE TABLE IF NOT EXISTS Athlete (
    id INTEGER PRIMARY KEY, 
    name VARCHAR(150), 
    sex VARCHAR(20), 
    height DECIMAL, 
    weight DECIMAL 
);

CREATE TABLE IF NOT EXISTS City (
    id INTEGER PRIMARY KEY, 
    name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Season (
    id INTEGER PRIMARY KEY, 
    name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Games (
    id INTEGER PRIMARY KEY,
    year INTEGER, 
    id_season INTEGER, 
    id_city INTEGER,
    FOREIGN KEY (id_season) REFERENCES Season(id),
    FOREIGN KEY (id_city) REFERENCES City(id)
);

CREATE TABLE IF NOT EXISTS Event (
    id INTEGER PRIMARY KEY,
    id_modality INTEGER,
    id_games INTEGER,
    FOREIGN KEY (id_modality) REFERENCES Modality(id),
    FOREIGN KEY (id_games) REFERENCES Games(id)
);

CREATE TABLE IF NOT EXISTS Athlete_Event (
    id INTEGER PRIMARY KEY,
    id_event INTEGER,
    id_athlete INTEGER,
    id_medal INTEGER,
    age INTEGER,
    id_noc INTEGER,
    id_team INTEGER, 
    FOREIGN KEY (id_event) REFERENCES Event(id),
    FOREIGN KEY (id_athlete) REFERENCES Athlete(id),  
    FOREIGN KEY (id_medal) REFERENCES Medal(id),
    FOREIGN KEY (id_noc) REFERENCES NOC(id),  
    FOREIGN KEY (id_team) REFERENCES Team(id)
);