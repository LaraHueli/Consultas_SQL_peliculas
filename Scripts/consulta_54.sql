-- Encuentra los nombre de los actores que han actuado en al menos una pelicula que 
-- pertenece a la categoria "Sci-Fi". Ordena los resultados alfabeticamente por apellido
SELECT
		CONCAT(a.first_name,' ', a.last_name) AS "nombre_completo",
		c."name" AS "genero"
FROM actor AS a 
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id 
INNER JOIN film AS f ON fa.film_id = f.film_id 
INNER JOIN film_category AS fc ON f.film_id = fc.film_id 
INNER JOIN category AS c ON fc.category_id = c.category_id
WHERE c."name" ILIKE '%Sci-Fi%'
GROUP BY c."name", a.last_name, a.first_name 
ORDER BY a.last_name ASC ;

	
		
