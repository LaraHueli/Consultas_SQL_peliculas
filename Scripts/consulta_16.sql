--Muestra los 10 clientes con mayor valor de ID

SELECT	
	customer_id AS "mayor_identificacion_cliente",
	first_name AS "nombre",
	last_name AS "apellido"
FROM customer AS c 
ORDER BY customer_id DESC 
LIMIT 10;

