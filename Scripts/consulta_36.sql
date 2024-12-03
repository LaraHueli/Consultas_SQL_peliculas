-- renombre la columna "first_name" como "nombre" 
--y "last_name" como "apellido"


SELECT 	first_name AS "nombre",
		last_name AS "apellido"
FROM actor AS a;

SELECT 	first_name  "nombre", last_name  "apellido"
FROM actor a;