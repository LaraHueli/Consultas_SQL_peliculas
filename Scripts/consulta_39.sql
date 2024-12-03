-- selecciona todos los actores y ordenalos por apellido en 
--orden ascendente

SELECT 	first_name AS "Nombre",
		last_name AS "Apellido"
FROM actor AS a 
ORDER BY "Apellido" ASC,"Nombre" asc;
