--Encuentra el titulo de todas las peliculas que fueron alquiladas por mas de 8 dias


SELECT 
    f.title AS "titulo",
    EXTRACT(DAY FROM (r.return_date - r.rental_date)) AS "dias_alquiler"
FROM film AS f
INNER JOIN inventory AS i ON i.film_id = f.film_id
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id
WHERE (r.return_date - r.rental_date) > INTERVAL '8 days';
