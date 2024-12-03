-- encuentra los 5 clientes que mas dinero se hayan gastado con nosotros

SELECT 	concat(first_name,' ', last_name) AS "nombre_completo",
 		MAX(p.amount) AS "gasto_maximo"
FROM customer AS c 
 	INNER JOIN payment AS p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name, c.customer_id 
ORDER BY "gasto_maximo" DESC 
LIMIT 5;	
 	
 
 	

