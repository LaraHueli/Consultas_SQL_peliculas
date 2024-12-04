-- Encuentra todos los actores que no hayan participado en peliculas

SELECT 	a.actor_id AS "ID_actor",
		a.first_name AS "Nombre"
FROM actor AS a 
 LEFT JOIN film_actor AS fa ON a.actor_id = fa.actor_id 
 LEFT JOIN film AS f ON fa.film_id = f.film_id
WHERE fa.actor_id IS NULL;
 
