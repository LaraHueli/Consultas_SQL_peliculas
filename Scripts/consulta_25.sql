-- averigua el numero de alquileres registrados por mes

SELECT 	EXTRACT (MONTH FROM rental_date) AS "mes_alquiler", -- Extrae el mes de la columna rental_date
		COUNT(*) AS total_alquileres -- Cuenta el número de alquileres		
FROM rental AS r
GROUP BY EXTRACT (MONTH FROM rental_date)
ORDER BY mes_alquiler;







