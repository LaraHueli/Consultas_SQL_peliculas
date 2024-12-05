-- Encuentra el numero de peliculas por categoria estrenadas en 2006

SELECT 
		COUNT(f.title) AS "Numero_peliculas",
		c."name" AS "genero",
		f.release_year AS "Año_estreno"
FROM film AS f 
INNER JOIN film_category AS fc ON fc.film_id = f.film_id 
INNER JOIN category AS c ON c.category_id = fc.category_id
WHERE f.release_year = 2006
GROUP BY c."name", f.release_year ;


