--Obtener todas las peliculas que tenemos y todos los registros de alquiler

SELECT 
		f.title AS "titulo",
		r.rental_id AS "Id_alquiler"
FROM film AS f 
INNER JOIN inventory AS i ON f.film_id = i.film_id 
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id 
 
