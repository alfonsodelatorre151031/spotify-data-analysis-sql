
-- EXEC sp_rename 'dbo.dspotify_resumen','stg_spotify_playlist'; RENOMBRAMOS LAS TABLAS

-- vaciamos tabla 
--La instrucción TRUNCATE TABLE es un comando de SQL que se utiliza para vaciar por completo
--una tabla, eliminando todas las filas de forma masiva y eficiente.

--En tu proyecto de Spotify, lo usamos justo antes de la transformación para asegurar
--que la tabla de "producción" esté limpia antes de recibir los nuevos datos.

TRUNCATE TABLE fact_spotify_songs

INSERT INTO fact_spotify_songs(
    original_key,   
    song_name,
    artist_name,
    energy_score,
    added_date,
    duration_seconds,
    popularity_score
    )
SELECT
[key],
[Song],
[Artist],
[Energy],
CONVERT(DATE,[Added_At],103),
CAST( LEFT([Duration],CHARINDEX(':',[Duration])-1) AS INT )*60+
CAST( SUBSTRING([Duration],CHARINDEX(':',[Duration])+1,2)   AS INT),
[Popularity]

FROM dbo.stg_spotify_playlist;
 

SELECT * FROM fact_spotify_songs;


---SUBSTRING(cadena, inicio, longitud)



