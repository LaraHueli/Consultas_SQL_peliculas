--Encuentra las categorias de peliculas que tienen un promedio de duracion 
--superior a 110 miin y muestra el nombre de la categoria junto con el promedio 
--de duracion

--tablas film, category 

SELECT 	c."name" AS "categoria",
		ROUND(AVG(f.length),2) AS "duracion"
FROM film AS f 

INNER JOIN film_category AS fc 
ON f.film_id = fc.film_id 

INNER JOIN category AS c
ON c.category_id = fc.category_id 

GROUP BY "name" 

HAVING AVG(f.length) > 110;