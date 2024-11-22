SELECT title AS "titulo",
		length AS "duracion"
FROM film AS f 
ORDER BY length ASC;
-- Ordena por duración de forma ascendente

SELECT title AS "titulo",
		length AS "duracion"
FROM film AS f 
ORDER BY length;
-- por defecto tb lo hace ascendente