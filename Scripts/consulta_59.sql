-- Encuentra los nombres de las peliculas que tienen la misma duracion que la pelicula con el titulo Dancing Fever.
-- Ordena los resultados alfabeticamente por titulo de pelicula

SELECT 
    title AS "Titulo",
    length AS "Duracion"
FROM film AS f
WHERE length = (
    SELECT length
    FROM film
    WHERE title ILIKE '%Dancing Fever%'
)
ORDER BY title;




