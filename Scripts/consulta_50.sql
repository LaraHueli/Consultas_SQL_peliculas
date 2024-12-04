-- calcula la duracion total de las peliculas en la categoria "action".

SELECT
		c.name AS "genero",
		SUM(f.length) AS "duracion_total"
FROM category AS c
INNER JOIN film_category AS fc ON c.category_id = fc.category_id 
INNER JOIN film AS f ON fc.film_id = f.film_id 
WHERE c.name LIKE '%Action%'
GROUP BY c.name
ORDER BY SUM(f.length); 