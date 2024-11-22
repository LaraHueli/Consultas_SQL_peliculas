SELECT first_name AS "nombre",
		last_name AS "apellido"
FROM actor AS a;

SELECT first_name AS "nombre",
		last_name AS "apellido"
FROM actor AS a
WHERE last_name LIKE '%Allen%'; 
-- Selecciona donde apellido contiene "Allen" (sensible a mayúsculas)

SELECT first_name AS "nombre",
		last_name AS "apellido"
FROM actor AS a
WHERE last_name LIKE '%ALLEN%';
-- Selecciona donde apellido contiene "Allen" (sensible a mayúsculas)


SELECT first_name AS "nombre",
		last_name AS "apellido"
FROM actor AS a
WHERE last_name ILIKE '%Allen%';
-- Selecciona donde el apellido contiene "Allen" (no distingue mayúsculas/minúsculas)