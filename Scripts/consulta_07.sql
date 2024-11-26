-- Encuentra la cantidad total de peliculas en cada clasificacion de la tabla film y 
-- muestra la calsificacion junto con el recuento

SELECT 
    rating AS clasificacion, 
    COUNT(*) AS cantidad_peliculas
-- Contamos el número total de películas por clasificación 
-- y lo renombramos como "cantidad_peliculas"    
    
FROM film AS "pelicula" 
GROUP BY rating  
-- Agrupamos los resultados por la columna "rating"
-- para calcular el conteo por clasificación
ORDER BY cantidad_peliculas DESC;
-- Ordenamos los resultados en orden descendente según 
--la cantidad de películas

