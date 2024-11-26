--Obten pelicules cuyo idioma coincide con el idioma original.

SELECT title AS "Peliculas",
		language_id AS "Idioma",
		original_language_id AS "Idioma_original"
FROM film AS f;

SELECT title AS "Peliculas",
		language_id AS "Idioma",
		original_language_id AS "Idioma_original"
FROM film AS f
WHERE original_language_id = language_id;
-- Esto no devuelve datos porque no hay registros donde 
-- el idioma original sea igual al idioma registrado.