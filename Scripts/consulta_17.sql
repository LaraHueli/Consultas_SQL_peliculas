-- Encuentra los nombres de los actores y los títulos de las películas
-- cuyo título contenga "Egg Igby" (sin importar mayúsculas o minúsculas).

SELECT 
    a.first_name AS "nombre",         
    a.last_name AS "apellido",       
    f.title AS "titulo"              
FROM actor AS a                       
INNER JOIN film_actor AS fa--para unir la tabla "actor" con "film_actor" a través de actor_id.
    ON a.actor_id = fa.actor_id--se une entre "actor" y "film_actor".
INNER JOIN film AS f                  
    ON fa.film_id = f.film_id         
WHERE f.title ILIKE '%Egg Igby%';-- Filtra los títulos de las películas que contienen "Egg Igby".
