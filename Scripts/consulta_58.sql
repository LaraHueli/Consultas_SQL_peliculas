--Encuentra el titulo de todas las peliculas que son de la misma categoria que "Animation"

SELECT 
		f.title AS "titulo",
		c."name" AS "genero",
		c.category_id AS "ID_genero"
FROM film AS f 
INNER JOIN film_category AS fc ON f.film_id = fc.film_id 
INNER JOIN category AS c ON fc.category_id = c.category_id
WHERE c.category_id  = (
	SELECT category_id 
	FROM category AS c2 
	WHERE name = 'Animation'
	);

