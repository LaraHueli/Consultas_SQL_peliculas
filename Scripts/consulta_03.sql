-- Encuentra los nombres de los actores que tengan un "actor_Id" entre 30 y 40.

SELECT first_name AS "nombre",
		actor_id AS "Id_actor"
FROM actor AS a
WHERE actor_id BETWEEN 30 AND 40;