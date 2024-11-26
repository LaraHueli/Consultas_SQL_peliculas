--Encuentra el promedio de duracion de las peliculas
-- para cada clasificacion de la tabla film y muestra

SELECT	round(avg(length), 2)AS "duracion_promedio", -- promedio y redondea a 2 decimales
		rating AS "clasificacion"
FROM film AS f
GROUP BY rating;
 

