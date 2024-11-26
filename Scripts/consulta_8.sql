SELECT title AS "titulo", 
       rating AS "clasificacion",
       length AS "duracion"
FROM film AS f
WHERE rating = 'PG-13' OR length > 180;

