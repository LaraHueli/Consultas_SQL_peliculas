-- ¿Que peliculas se alquilan por encima del precio medio?

SELECT 	round(avg(amount),2)AS "precio_medio",
		f.title AS "titulo"
FROM payment AS p

	INNER JOIN rental AS r ON p.rental_id = r.rental_id 

	INNER JOIN inventory AS i ON i.inventory_id = r.inventory_id

	INNER JOIN film AS f ON f.film_id = i.film_id

GROUP BY f.title

HAVING  round(avg(amount),2) > (SELECT round(avg(amount),2)FROM payment)

ORDER BY "precio_medio" DESC; 