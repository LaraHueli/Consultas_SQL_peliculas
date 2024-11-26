-- Encuentra el titulo de todas las peliculas que son "pg_13" o que tienen una duracion mayor
-- a 3 horas en la tabla film

SELECT title AS "titulo", 
       rating AS "clasificacion",
       length AS "duracion"
FROM film AS f
WHERE rating = 'PG-13' OR length > 180;

