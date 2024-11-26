--Encuentra el titulo de las peliculas en la tabla "film" 
--que no sean ni "nc-17" ni "G" en cuanto a clasificacion

SELECT
	title AS "titulo",
	rating AS "clasificaion"
FROM film AS f 
WHERE rating NOT IN ('NC-17', 'G');
-- Filtramos para excluir "NC-17" y "G".
