-- Encuentra las peliculas con una duracion superior al promedio



SELECT 	title AS "titulo",
		length AS "duracion",
		(SELECT round(avg(length),2) AS "duracion_media"
		FROM film AS f2 )
FROM film AS f
WHERE  length > (SELECT ROUND(AVG(length), 2) FROM film AS f);



