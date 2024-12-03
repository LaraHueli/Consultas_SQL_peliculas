-- Obtener todas las peliculas  que tenemos y todos los registros de alquiler

SELECT 	f.title AS "titulo",
		r.rental_id AS "Id_registro",
		(
		SELECT count (*)
		FROM rental AS r_sub
		INNER JOIN inventory AS i_sub ON r_sub.inventory_id = i_sub.inventory_id
		WHERE i_sub.film_id = f.film_id
		)
		AS "veces_alquilada"		
FROM film AS f 
LEFT JOIN inventory AS i 
	ON f.film_id = i.film_id 
LEFT JOIN rental AS r 	-- incluimos peliculas que nunca han sido alquiladas
	ON i.inventory_id = r.inventory_id
GROUP BY f.title, r.rental_id, f.film_id 
ORDER BY f.title asc; 
  

 

