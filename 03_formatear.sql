
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
    artist_name 
    )
SELECT
[key],
[Song],
[Artist]
FROM dbo.stg_spotify_playlist;
--[Energy],
--CONVERT(DATE,[Added_At],103),

SELECT * FROM fact_spotify_songs;




);


