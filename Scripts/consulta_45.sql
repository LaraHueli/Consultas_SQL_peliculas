-- encuentra los actores que han participado en peliculas de lacategoria "action"

SELECT a.first_name AS "nombre",
       c.name AS "categoría"
FROM actor AS a
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
INNER JOIN film AS f ON fa.film_id = f.film_id
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
WHERE c.name LIKE '%Action%'
ORDER BY a.first_name;
