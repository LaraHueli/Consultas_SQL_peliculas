-- Selecciona las 5 primeras peliculas de la tabla "film"

SELECT title AS "titulo"
FROM film AS f 
ORDER BY titulo
LIMIT 5;
