-- obtener los actores y el numero de peliculas en las que han actuado

SELECT 	a.actor_id AS ID_actor,
		CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo",
		COUNT(fa.film_id) AS "numero_peliculas"
FROM actor AS a 
INNER JOIN film_actor AS fa 
	ON a.actor_id = fa.actor_id
INNER JOIN film AS f 
	ON fa.film_id = f.film_id
GROUP BY  a.actor_id, a.first_name, a.last_name
ORDER BY COUNT(fa.film_id) DESC;

	