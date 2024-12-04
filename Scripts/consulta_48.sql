-- crea una vista llamada "actor_num_peliculas" que muestre los nombres
-- de los actores y el numero de peliculas en las que han participado
 
CREATE VIEW actor_num_peliculas as
SELECT 
   	a.first_name AS "Nombre",
    COUNT(fa.film_id) AS "Numero_Peliculas"
FROM 
    actor AS a
INNER JOIN 
    film_actor AS fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.first_name
ORDER BY 
    COUNT(fa.film_id) DESC;

SELECT * FROM actor_num_peliculas;
