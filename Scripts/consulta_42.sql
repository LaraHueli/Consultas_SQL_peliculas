-- encuentra todos los alquileres y los nombres de los clientes que los realizaron

SELECT 	c.customer_id AS "ID_cliente", 
		c.first_name AS "nombre_cliente",
		r.rental_id AS "ID_alquiler"
FROM rental AS r 
 INNER JOIN customer AS c 
 ON r.customer_id = c.customer_id
ORDER BY c.customer_id ASC; 