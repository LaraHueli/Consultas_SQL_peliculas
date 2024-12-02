-- obtener todas las peliculas  y mostrar los actores que han actuado en ellas, 
--incluso si algunos actores no han actuadoen ninguna pelicula

SELECT 	a.actor_id AS ID_actor,
		f.title AS "titulo",
		CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo"
FROM actor AS a 
LEFT JOIN film_actor AS fa 
	ON a.actor_id = fa.actor_id
LEFT JOIN film AS f 
	ON fa.film_id = f.film_id
GROUP BY  a.actor_id, a.first_name, a.last_name, f.title
ORDER BY a.actor_id  desc;

-- con un LEFT JOIN, un actor que no tenga películas aparecerá en el resultado 
--con el título como NULL. Esto permite ver que ese actor no tiene 
--participaciones en ninguna película. Con un INNER JOIN, ese actor sería 
--excluido del resultado, ya que no hay una relación en film_actor.