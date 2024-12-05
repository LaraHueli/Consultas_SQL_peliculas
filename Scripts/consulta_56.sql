-- Encuentra el nombre y el apellido de los actores que no han actuado en ningua 
--pelicula de la categoria "music"
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo",
    c.name AS "genero"
FROM actor AS a
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
INNER JOIN film AS f ON fa.film_id = f.film_id
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
WHERE a.actor_id NOT IN (
    SELECT DISTINCT fa.actor_id
    FROM film_actor AS fa
    INNER JOIN film AS f ON fa.film_id = f.film_id
    INNER JOIN film_category AS fc ON f.film_id = fc.film_id
    INNER JOIN category AS c ON fc.category_id = c.category_id
    WHERE c.name ILIKE '%Music%'
)
ORDER BY a.last_name ASC, a.first_name ASC;




