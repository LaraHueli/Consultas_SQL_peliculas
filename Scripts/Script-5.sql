-- Clausulas: SELECT, FROM, WHERE, LIKE, LIMIT, OFFSET


SELECT 	c."FirstName" AS "Nombre_cliente",
		c."LastName" AS "apellido",
		c."Country" AS "pais",
		c."State" 
FROM "Customer" AS c
WHERE c."State" ILIKE 'q%'; 