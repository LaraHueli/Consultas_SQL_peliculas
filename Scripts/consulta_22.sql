--crea una columna con el nombre y apellidos de todos los actores y actrices


SELECT 	concat(first_name, ' ' , last_name)  AS "nombre_completo"
		 
FROM actor AS a; 



-- se puede usar el operador || en lugar de CONCAT
SELECT 
    first_name || ' ' || last_name AS "nombre_completo"
FROM 
    actor;
