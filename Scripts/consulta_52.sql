-- crea una tabla temporal llamada "peliculas_alquiladas" que 
--almacene las peliculas que han sido alquiladas al menos 10 veces


CREATE TEMPORARY TABLE peliculas_alquiladas AS
	SELECT 
			f.title AS "titulo",
			count(r.rental_id) AS "total_alquileres"
	FROM rental AS r 
	INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id 
	INNER JOIN film AS f ON f.film_id = i.film_id
	GROUP BY f.title 
	HAVING count(r.rental_id) >= 10
	ORDER BY count(r.rental_id) asc;

SELECT * FROM peliculas_alquiladas;


