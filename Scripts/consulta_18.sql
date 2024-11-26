-- Selecciona todos los nombres de las peliculas unicos.

 --DISTINCT para eliminar duplicados y renombramos la columna de salida.
SELECT DISTINCT(title) AS "titulos_unicos"
FROM film AS f
ORDER BY title;


 -- Cuenta solo los valores únicos de "title" 
SELECT count(DISTINCT(title)) AS "titulos_unicos"
FROM film AS f;
