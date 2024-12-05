-- Encuentra el titulo de las peliculas que han sido alquiladas por el 
--cliente con el nombre "Tammy Sanders" y que aun no se han devuelto
--Ordena los resultados alfabeticamente pr titulo de pelicula
 
SELECT
		f.title AS "titulo",
		CONCAT(c.first_name,' ', c.last_name) AS "nombre_completo"
FROM film AS f 
INNER JOIN inventory AS i ON i.film_id = f.film_id 
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id
INNER JOIN customer AS c ON c.customer_id = r.customer_id 
WHERE r.return_date IS NULL 
	AND concat(c.first_name,' ', c.last_name) ILIKE 'Tammy Sanders'
ORDER BY f.title ASC ; 
