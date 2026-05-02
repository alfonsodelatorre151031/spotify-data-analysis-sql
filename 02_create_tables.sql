

USE ProyectoSpotify
--1. Tabla de Staging (Aterrizaje)
--Usamos NVARCHAR para que la importación sea fluida y no falle
--por formatos

CREATE TABLE stg_spotify_playlist (
   [key] NVARCHAR(50),
   [Song] NVARCHAR(255),
   [Artist] NVARCHAR(255),
   [Energy] NVARCHAR(50),
   [Added At] NVARCHAR(50),
   [Duration] NVARCHAR(50),
   [Popularity] NVARCHAR(50)
);

--2. Tabla Final (Producción)
-- Aquí ya usamos tipos de datos optimizados para análisis.
CREATE TABLE fact_spotify_songs (
    song_id INT IDENTITY(1,1) PRIMARY KEY,
    original_key INT,
    song_name NVARCHAR(255),
    artist_name NVARCHAR(255),
    energy_score INT,
    added_date DATE,
    duration_seconds INT,
    popularity_score INT
);
