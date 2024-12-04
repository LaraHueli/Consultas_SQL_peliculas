-- calcula el numero total de alquileres realizados por cada cliente

SELECT 
	c.customer_id AS "ID_cliente",
	concat(c.first_name,' ',c.last_name) AS "nombre_completo",
	COUNT(r.rental_id) AS "Total_Alquileres"
	FROM customer AS c 
INNER JOIN rental AS r ON c.customer_id = r.customer_id 
GROUP BY c.customer_id
ORDER BY COUNT(r.rental_id); 