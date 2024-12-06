

SELECT 	f.title AS "titulo", 
		f.rating AS "clasificacion"
FROM film AS f
WHERE f.rating = 'R'
ORDER BY f.title ;