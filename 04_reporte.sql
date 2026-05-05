
--Reporte usando las funciones de agregacion

--"Cualquier columna que aparezca en tu SELECT y no esté dentro de una función de
--agregado (como COUNT), debe aparecer obligatoriamente en la cláusula GROUP BY

SELECT
    artist_name,
    COUNT(*) as total_canciones,
    AVG(energy_score) as energia_promedio,
    AVG(popularity_score) as popularidad_promedio
FROM dbo.fact_spotify_songs
GROUP BY artist_name
--ORDER BY energia_promedio DESC;
ORDER BY popularidad_promedio DESC;