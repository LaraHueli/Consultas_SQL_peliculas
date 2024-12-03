-- Muestra todos los clientes y sus alquileres si existen,  
--incluyendo aquellos que no tienen alquileres

SELECT 
    c.customer_id AS "ID_cliente", 
    c.first_name AS "nombre_cliente", 
    r.rental_id AS "ID_alquiler"
FROM rental AS r
LEFT JOIN customer AS c
    ON r.customer_id = c.customer_id
ORDER BY c.customer_id ASC;

-- esta consulta es igual que la anterior, pero usamos un LEFT (en lugar de INNER) para
-- agregar tb los usuarios que no tienen alquiler