-- numeros de alquiler por dia, ordenados por cantidad de alquiler 
--de forma descendente


SELECT 
    DATE(rental_date) AS "dia_alquiler", -- Extrae solo la fecha (sin horas)
    COUNT(rental_date) AS "alquiler_total"  
FROM rental AS r 
GROUP BY 
    DATE(rental_date)                    
ORDER BY 
    alquiler_total DESC;         
