-- Encuentra los nombres de los cliente que han alquilado al menos 7 peliculas distintas. 
--Ordena los resultados alfabeticamente por apellido.

SELECT 	concat(c.first_name, ' ', c.last_name) AS "Nombre_completo",
		count(r.rental_id) AS "Alquileres_cliente"
FROM customer AS c 
INNER JOIN rental AS r ON c.customer_id = r.customer_id
INNER JOIN inventory AS i ON i.inventory_id = r.inventory_id 
WHERE c.customer_id IN (
		SELECT c2.customer_id
		FROM customer AS c2
		INNER JOIN rental AS r2 ON c2.customer_id = r2.customer_id
		INNER JOIN inventory AS i2 ON i2.inventory_id = r2.inventory_id 
		WHERE i2.film_id <= 7
)
GROUP BY c.first_name, c.last_name 
ORDER BY c.last_name asc;



