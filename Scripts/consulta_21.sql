--¿Cual es la media de duracion del alquiler de las peliculas?

SELECT 	AVG(return_date - rental_date) AS "promedio_dias"
FROM rental AS r;



