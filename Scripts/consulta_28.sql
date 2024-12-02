-- muestra el ID de los actores que hayan participado en mas de 40 peliculas

SELECT 	a.actor_id AS "identificacdor_actor",
		COUNT(fa.film_id) AS "total_peliculas" -- Cuenta el número de películas por actor
FROM actor AS a 

	INNER JOIN film_actor AS fa  ON a.actor_id = fa.actor_id 

GROUP BY a.actor_id  -- Agrupa por actor para calcular el total de películas por actor

HAVING COUNT(fa.film_id) > 40 -- Filtra los actores q han participado en > 40 películas

ORDER BY "total_peliculas" DESC; 
	
	
