-- Selecciona todos los actores cuyo primer nombre es "Jophnny"

SELECT first_name AS "nombre"
FROM actor AS a 
WHERE first_name ILIKE '%Johnny%';
-- Notas:
--% comodin: Representa cero o más caracteres en cualquier posición.
-- LIKE: Busca coincidencias sensibles a mayúsculas/minúsculas.
-- ILIKE: Busca coincidencias insensibles a mayúsculas/minúsculas 

