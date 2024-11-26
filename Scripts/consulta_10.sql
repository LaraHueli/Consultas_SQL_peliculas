-- Encuentra la mayor y menor duracion de una pelicula de nuestra bbdd

SELECT 
    MIN(length) AS "duracion_minima",
    MAX(length) AS "duracion_maxima"
FROM film;



