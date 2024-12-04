-- Selecciona el nombre de los actores y la cantidad de peliculas 
-- en las que han participado

SELECT 
    a.first_name AS "Nombre",
    count(fa.film_id)  AS "numero_peliculas"
FROM 
    actor AS a
INNER JOIN 
    film_actor AS fa ON a.actor_id = fa.actor_id
GROUP BY a.first_name
ORDER BY count(fa.film_id) DESC;




