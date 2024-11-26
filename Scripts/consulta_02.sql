-- Muestra los nombres de todas las peliculas
-- con una clasificacion po r edaddes de "R"

SELECT "title" AS "titulo",
		rating AS "rango_edad"
FROM "film" AS "pelicula"
WHERE "rating" = 'R';
