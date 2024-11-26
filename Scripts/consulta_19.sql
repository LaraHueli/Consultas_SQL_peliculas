--Encuentra el titulo de las peliculas que son comedias y tienen una duracion mayor
--a 180 minutos en la tabla film

SELECT 
	f.title AS "titulo",
	f.length AS "duracion",
	c.name AS "genero"
FROM film AS f 
INNER JOIN film_category AS fc 
	ON f.film_id = fc.film_id 
INNER JOIN category AS c 
	ON fc.category_id = c.category_id
WHERE name = 'Comedy' AND length > 180 ;




SELECT 
	f.title AS "titulo",
	f.length AS "duracion",
	c.name AS "genero"
FROM film AS f, film_category AS fc, category AS c 
WHERE f.film_id = fc.film_id 
	AND fc.category_id = c.category_id 
	AND  name = 'Comedy' 
	AND length > 180 ;


