-- Encuentra la variabilidad de lo que costaria reemplazar las peliculas 

SELECT 
    round(variance(replacement_cost)) AS "varianza_coste_reemplazo"
FROM film AS f;


