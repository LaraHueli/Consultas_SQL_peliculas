-- agrupa los actores por su nombre y cuenta cuantos actores tienen el mismo nombre 
--¿Cual es enombre mas repetido?

SELECT 	first_name AS "nombre",
		count (first_name) AS "total_nombres"
FROM actor AS a
GROUP BY first_name
ORDER BY "total_nombres" DESC, "nombre" ASC  ;