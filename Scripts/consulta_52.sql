-- crea una tabla temporal llamada "clientes_rentas_temporal" para 
-- almacenar el total de alquileres por cliente

CREATE TEMPORARY TABLE clientes_rentas_temporal AS
	SELECT 
   	 	CONCAT(c.first_name, ' ', c.last_name) AS "Nombre_Completo",
    	COUNT(r.rental_id) AS "Total_Alquileres"
	FROM 
    	customer AS c
	INNER JOIN 
    	rental AS r ON c.customer_id = r.customer_id
	GROUP BY 
    	c.first_name, c.last_name
	ORDER BY 
    	COUNT(r.rental_id) DESC;

SELECT * FROM clientes_rentas_temporal;

