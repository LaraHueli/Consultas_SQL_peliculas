-- Encuentra el nombre y el apellido de los actores que han actuado en peliculas que
-- se alquilaron despues de que la pelicula "Spartacus Cheaper" se alquilara por 
--primera vez. ordena los resultados alfabeticamente por apellido

SELECT 	
		CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo",
		f.title AS "titulo",
		DATE(r.rental_date) AS "dia_alquiler"
FROM actor AS a 	
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id 
INNER JOIN film AS f ON fa.film_id = f.film_id 
INNER JOIN inventory AS i ON i.film_id = f.film_id 
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE r.rental_date > (
	SELECT	MIN(rental_date)
	FROM rental AS r
	INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
    INNER JOIN film AS f ON i.film_id = f.film_id
	WHERE f.title ILIKE '%Spartacus Cheaper%'
	)
ORDER BY a.last_name asc;
		