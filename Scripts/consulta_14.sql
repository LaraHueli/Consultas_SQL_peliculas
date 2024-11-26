-- Encuentra el titulo de todas las peliculas que tengan una 
--duracion mayor a 180 minutos

SELECT	
	title AS "titulo",
	length AS "duracion"
FROM film AS f 
WHERE length > 180;



