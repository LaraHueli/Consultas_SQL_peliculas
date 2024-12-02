-- Obtener todas las peliculas  que tenemos y todos los registros de alquiler

SELECT 	f.title AS "titulo",
		r.rental_id AS "Id_registro"
FROM film AS f 
INNER JOIN inventory AS i 
	ON f.film_id = i.film_id 
LEFT JOIN rental AS r 	-- incluimos peliculas que nunca han sido alquiladas
	ON i.inventory_id = r.inventory_id
ORDER BY f.title ASC ; 

-- sub consulta veces alquilada
SELECT count (r.rental_id)AS "veces_alquilada"
FROM rental AS r 
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id 
WHERE i.film_id = f.film_id ;



  