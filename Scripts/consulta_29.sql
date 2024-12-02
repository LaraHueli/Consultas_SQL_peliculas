-- obten todas las peliculas y si, estan dsiponibles en el inventario, 
--mostrar la cantidad disponible

SELECT 
    f.title AS "titulo_pelicula",
    COUNT(i.inventory_id) AS "cantidad_disponible"  --Cuenta los ítems del inventario disponibles
FROM inventory AS i
LEFT JOIN rental AS r 
    ON i.inventory_id = r.inventory_id AND r.return_date IS NULL -- Unir solo los alquileres sin devolver
INNER JOIN film AS f 
    ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY "cantidad_disponible" DESC;

	
