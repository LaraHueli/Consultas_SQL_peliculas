--Encuentra la cantidad total de peliculas alquiladas por cada cliente y muestra el ID 
--del cliente, su nombre y apellido junto con la cantidad de peliculas alquiladas.

SELECT 	c.customer_id AS "Identificador_cliente",
		concat(c.first_name, ' ', c.last_name) AS "Nombre_completo",
		COUNT (r.rental_id) AS "Total_alquileres"
FROM customer AS c 
INNER JOIN rental AS r ON r.customer_id = c.customer_id 
GROUP BY c.customer_id
ORDER BY c.first_name ASC, c.last_name ASC;