-- Encuentra la cantidad total de peliuclas alquiladas por categoria y muestra el nombre de la 
--categoria junto con el recuento de alquileres

SELECT 
		COUNT (r.rental_id) AS "Total_peliculas_alquiladas",
		c."name" AS "genero"
FROM rental AS r 
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id 
INNER JOIN film AS f ON f.film_id = i.film_id 
INNER JOIN film_category AS fc ON fc.film_id = f.film_id 
INNER JOIN category AS c ON c.category_id = fc.category_id 
GROUP BY c."name"
ORDER BY COUNT (r.rental_id)  asc;