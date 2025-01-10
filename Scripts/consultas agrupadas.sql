--CONSULTA 2. Muestra los nombres de todas las peliculas con una clasificacion po r edaddes de "R"
SELECT "title" AS "titulo",
		rating AS "rango_edad"
FROM "film" AS "pelicula"
WHERE "rating" = 'R';


--CONSULTA 3. Encuentra los nombres de los actores que tengan un "actor_Id" entre 30 y 40.
SELECT first_name AS "nombre",
		actor_id AS "Id_actor"
FROM actor AS a
WHERE actor_id BETWEEN 30 AND 40;


-- CONSULTA 4.Obten pelicules cuyo idioma coincide con el idioma original.
SELECT title AS "Peliculas",
		language_id AS "Idioma",
		original_language_id AS "Idioma_original"
FROM film AS f;

SELECT title AS "Peliculas",
		language_id AS "Idioma",
		original_language_id AS "Idioma_original"
FROM film AS f
WHERE original_language_id = language_id; -- Esto no devuelve datos porque no hay registros donde el idioma original sea igual al idioma registrado.


--CONSULTA 5. Ordena las peliculas por duracion de forma ascendente.
SELECT title AS "titulo",
		length AS "duracion"
FROM film AS f 
ORDER BY length ASC; -- Ordena por duración de forma ascendente

SELECT title AS "titulo",
		length AS "duracion"
FROM film AS f 
ORDER BY length; -- por defecto tb lo hace ascendente


--CONSULTA 6. Encuentra el nopmbnre y el apellido de los actores que tengan "allen" en su apellido.
SELECT first_name AS "nombre",
		last_name AS "apellido"
FROM actor AS a;

SELECT first_name AS "nombre",
		last_name AS "apellido"
FROM actor AS a
WHERE last_name LIKE '%Allen%'; -- Selecciona donde apellido contiene "Allen" (sensible a mayúsculas)

SELECT first_name AS "nombre",
		last_name AS "apellido"
FROM actor AS a
WHERE last_name LIKE '%ALLEN%'; -- Selecciona donde apellido contiene "Allen" (sensible a mayúsculas)

SELECT first_name AS "nombre",
		last_name AS "apellido"
FROM actor AS a
WHERE last_name ILIKE '%Allen%'; -- Selecciona donde el apellido contiene "Allen" (no distingue mayúsculas/minúsculas)


--CONSULTA 7.Encuentra la cantidad total de peliculas en cada clasificacion de la tabla film y muestra la calsificacion junto con el recuento
SELECT 
    rating AS clasificacion, 
    COUNT(*) AS cantidad_peliculas -- Contamos el número total de películas por clasificación y lo renombramos como "cantidad_peliculas"    
FROM film AS "pelicula" 
GROUP BY rating  --Agrupamos los resultados por la columna "rating" para calcular el conteo por clasificación
ORDER BY cantidad_peliculas DESC; -- Ordenamos los resultados en orden descendente según la cantidad de películas


--CONSULTA 8. Encuentra el titulo de todas las peliculas que son "pg_13" o que tienen una duracion mayor a 3 horas en la tabla film
SELECT title AS "titulo", 
       rating AS "clasificacion",
       length AS "duracion"
FROM film AS f
WHERE rating = 'PG-13' OR length > 180;


--CONSULTA 9.Encuentra la variabilidad de lo que costaria reemplazar las peliculas 
SELECT 
    round(variance(replacement_cost), 2) AS "varianza_coste_reemplazo"
FROM film AS f; -- round(variance(replacement_cost), 2). Correcto, me faltaba el "2" 


--CONSULTA 10. Encuentra la mayor y menor duracion de una pelicula de nuestra bbdd
SELECT 
    MIN(length) AS "duracion_minima",
    MAX(length) AS "duracion_maxima"
FROM film;


--CONSULTA 11. Encuentra lo que costo el antepenultimo alquiler ordenado por dia
SELECT 
    amount AS "coste",
    payment_date AS "dia_pago"
FROM payment AS p
ORDER BY payment_id DESC -- Ordeno descendente
LIMIT 1 -- pido solo 1 registro
OFFSET 1; -- ignora la primera fila del resultado
-- LIMIT 2 -- pido solo 2 registros. El error estaba en pedir 2 en lugar de 1


--CONSULTA 12. Encuentra el titulo de las peliculas en la tabla "film" que no sean ni "nc-17" ni "G" en cuanto a clasificacion
SELECT
	title AS "titulo",
	rating AS "clasificaion"
FROM film AS f 
WHERE rating NOT IN ('NC-17', 'G'); -- Filtramos para excluir "NC-17" y "G".


-- CONSULTA 13.Encuentra el promedio de duracion de las peliculas para cada clasificacion de la tabla film y muestra 
SELECT	round(avg(length), 2)AS "duracion_promedio", -- promedio y redondea a 2 decimales
		rating AS "clasificacion"
FROM film AS f
GROUP BY rating;


-- CONSULTA 14. Encuentra el titulo de todas las peliculas que tengan una duracion mayor a 180 minutos
SELECT	
	title AS "titulo",
	length AS "duracion"
FROM film AS f 
WHERE length > 180;


-- CONSULTA 15. ¿Cuanto dinero ha generado en total la empresa?
SELECT	sum(amount) AS "ganancia_total"
FROM payment AS p; 


-- CONSULTA 16. Muestra los 10 clientes con mayor valor de ID
SELECT	
	customer_id AS "mayor_identificacion_cliente",
	first_name AS "nombre",
	last_name AS "apellido"
FROM customer AS c 
ORDER BY customer_id DESC 
LIMIT 10;


-- COSNULTA 17. Encuentra los nombres de los actores y los títulos de las películas cuyo título contenga "Egg Igby" (sin importar mayúsculas o minúsculas).
SELECT 
    a.first_name AS "nombre",         
    a.last_name AS "apellido",       
    f.title AS "titulo"              
FROM actor AS a                       
INNER JOIN film_actor AS fa--para unir la tabla "actor" con "film_actor" a través de actor_id.
    ON a.actor_id = fa.actor_id--se une entre "actor" y "film_actor".
INNER JOIN film AS f                  
    ON fa.film_id = f.film_id         
WHERE f.title ILIKE '%Egg Igby%';-- Filtra los títulos de las películas que contienen "Egg Igby".


--CONSULTA 18.  Selecciona todos los nombres de las peliculas unicos.
SELECT DISTINCT(title) AS "titulos_unicos" --DISTINCT para eliminar duplicados y renombramos la columna de salida.
FROM film AS f
ORDER BY title;
 -- Cuenta solo los valores únicos de "title" 
SELECT count(DISTINCT(title)) AS "titulos_unicos"
FROM film AS f;


--CONSULTA 19.Encuentra el titulo de las peliculas que son comedias y tienen una duracion mayor a 180 minutos en la tabla film
SELECT 
	f.title AS "titulo",
	f.length AS "duracion",
	c.name AS "genero"
FROM film AS f 
INNER JOIN film_category AS fc 
	ON f.film_id = fc.film_id 
INNER JOIN category AS c 
	ON fc.category_id = c.category_id
WHERE name = 'Comedy' AND length > 180 ;
--otra opcio
SELECT 
	f.title AS "titulo",
	f.length AS "duracion",
	c.name AS "genero"
FROM film AS f, film_category AS fc, category AS c 
WHERE f.film_id = fc.film_id 
	AND fc.category_id = c.category_id 
	AND  name = 'Comedy' 
	AND length > 180 ;


--CONSULTA 20. Encuentra las categorias de peliculas que tienen un promedio de duracion superior a 110 min y muestra el nombre de la categoria junto con el promedio de duracion tablas film, category 
SELECT 	c."name" AS "categoria",
		ROUND(AVG(f.length),2) AS "duracion"
FROM film AS f 
INNER JOIN film_category AS fc 
ON f.film_id = fc.film_id 
INNER JOIN category AS c
ON c.category_id = fc.category_id 
GROUP BY "name" 
HAVING AVG(f.length) > 110;


-- COSNULTA 21.¿Cual es la media de duracion del alquiler de las peliculas?
SELECT 	AVG(return_date - rental_date) AS "promedio_dias"
FROM rental AS r;


--CONSULTA 22. Crea una columna con el nombre y apellidos de todos los actores y actrices
SELECT 	concat(first_name, ' ' , last_name)  AS "nombre_completo"
FROM actor AS a; 
--otra opcion
SELECT 
    first_name || ' ' || last_name AS "nombre_completo" -- se puede usar el operador || en lugar de CONCAT
FROM 
    actor;
   

-- CONSULTA 23. Numeros de alquiler por dia, ordenados por cantidad de alquiler de forma descendente
SELECT 
    DATE(rental_date) AS "dia_alquiler", -- Extrae solo la fecha (sin horas)
    COUNT(rental_date) AS "alquiler_total"  
FROM rental AS r 
GROUP BY 
    DATE(rental_date)                    
ORDER BY 
    alquiler_total DESC; 
   

-- CONSULTA 24.Encuentra las peliculas con una duracion superior al promedio
SELECT 	title AS "titulo",
		length AS "duracion",
		(SELECT round(avg(length),2) AS "duracion_media"
		FROM film AS f2 )
FROM film AS f
WHERE  length > (SELECT ROUND(AVG(length), 2) FROM film AS f); 


--COSNULTA 25. Averigua el numero de alquileres registrados por mes
SELECT 	EXTRACT (MONTH FROM rental_date) AS "mes_alquiler", -- Extrae el mes de la columna rental_date
		COUNT(*) AS total_alquileres -- Cuenta el número de alquileres		
FROM rental AS r
GROUP BY EXTRACT (MONTH FROM rental_date)
ORDER BY mes_alquiler;


--CONSULTA 26. Encuentra el promedio, la desviacion estandar y varianza del total pagado
SELECT	round (avg (amount),2) AS "promedio_importe",
		round (stddev(amount),2) AS "desviacion_importe",
		round (variance(amount),2) AS "varianza_importe"
FROM payment AS p;


--CONSULTA 27.¿Que peliculas se alquilan por encima del precio medio?
SELECT 	round(avg(amount),2)AS "precio_medio",
		f.title AS "titulo"
FROM payment AS p
	INNER JOIN rental AS r ON p.rental_id = r.rental_id 
	INNER JOIN inventory AS i ON i.inventory_id = r.inventory_id
	INNER JOIN film AS f ON f.film_id = i.film_id
GROUP BY f.title;


--CONSULTA 28. Muestra el ID de los actores que hayan participado en mas de 40 peliculas
SELECT 	a.actor_id AS "identificacdor_actor",
		COUNT(fa.film_id) AS "total_peliculas" -- Cuenta el número de películas por actor
FROM actor AS a 
	INNER JOIN film_actor AS fa  ON a.actor_id = fa.actor_id 
GROUP BY a.actor_id  -- Agrupa por actor para calcular el total de películas por actor
HAVING COUNT(fa.film_id) > 40 -- Filtra los actores q han participado en > 40 películas
ORDER BY "total_peliculas" DESC; 
	

--CONSULTA 29. Obten todas las peliculas y si, estan dsiponibles en el inventario, mostrar la cantidad disponible
SELECT 
    f.title AS "titulo_pelicula",
    COUNT(i.inventory_id) AS "cantidad_disponible"  --Cuenta los ítems del inventario disponibles
FROM inventory AS i
LEFT JOIN rental AS r 
    ON i.inventory_id = r.inventory_id AND r.return_date IS NULL -- Unir solo los alquileres sin devolver
INNER JOIN film AS f 
    ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY "cantidad_disponible" DESC;


--CONSULTA 30. Obtener los actores y el numero de peliculas en las que han actuado
SELECT 	a.actor_id AS ID_actor,
		CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo",
		COUNT(fa.film_id) AS "numero_peliculas"
FROM actor AS a 
INNER JOIN film_actor AS fa 
	ON a.actor_id = fa.actor_id
INNER JOIN film AS f 
	ON fa.film_id = f.film_id
GROUP BY  a.actor_id, a.first_name, a.last_name
ORDER BY COUNT(fa.film_id) DESC;


--CONSULTA 31. Obtener todas las peliculas  y mostrar los actores que han actuado en ellas, incluso si algunos actores no han actuadoen ninguna pelicula
SELECT 
    f.film_id AS ID_pelicula, -- Mostramos el ID de la pelicula.
    f.title AS "titulo", -- Mostramos el titulo de la pelicula.
    CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo" -- Mostramos el nombre completo del actor (si lo tiene).
FROM film AS f -- Empezamos con la tabla de peliculas.
LEFT JOIN film_actor AS fa ON f.film_id = fa.film_id -- Relacionamos las películas con los actores (aunque no todas tengan actores).
LEFT JOIN actor AS a ON fa.actor_id = a.actor_id -- Traemos el nombre del actor (si hay).
ORDER BY f.film_id; -- Ordenamos por el ID de la pelicula para que quede ordenado.
-- con un LEFT JOIN, un actor que no tenga películas aparecerá en el resultado 
--con el título como NULL. Esto permite ver que ese actor no tiene 
--participaciones en ninguna película. Con un INNER JOIN, ese actor sería 
--excluido del resultado, ya que no hay una relación en film_actor.


--CONSULTA 32. Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película
SELECT 	a.actor_id AS ID_actor,
		f.title AS "titulo",
		CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo"
FROM actor AS a 
LEFT JOIN film_actor AS fa 
	ON a.actor_id = fa.actor_id
LEFT JOIN film AS f 
	ON fa.film_id = f.film_id
GROUP BY  a.actor_id, a.first_name, a.last_name, f.title
ORDER BY a.actor_id  desc;
-- Con un LEFT JOIN, un actor que no tenga películas aparecerá en el resultado
-- con el título como NULL. Esto permite ver que ese actor no tiene
-- participaciones en ninguna película. 
-- Con un INNER JOIN, ese actor sería excluido del resultado porque no hay relación en film_actor.


--CONSULTA 33. Obtener todas las peliculas  que tenemos y todos los registros de alquiler
SELECT 	f.title AS "titulo",
		r.rental_id AS "Id_registro",
		(
		SELECT count (*)
		FROM rental AS r_sub
		INNER JOIN inventory AS i_sub ON r_sub.inventory_id = i_sub.inventory_id
		WHERE i_sub.film_id = f.film_id
		)
		AS "veces_alquilada"		
FROM film AS f 
LEFT JOIN inventory AS i 
	ON f.film_id = i.film_id 
LEFT JOIN rental AS r 	-- incluimos peliculas que nunca han sido alquiladas
	ON i.inventory_id = r.inventory_id
GROUP BY f.title, r.rental_id, f.film_id 
ORDER BY f.title asc; 


--CONSULTA 34.Encuentra los 5 clientes que mas dinero se hayan gastado con nosotros
SELECT 	concat(first_name,' ', last_name) AS "nombre_completo",
 		MAX(p.amount) AS "gasto_maximo"
FROM customer AS c 
 	INNER JOIN payment AS p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name, c.customer_id 
ORDER BY "gasto_maximo" DESC 
LIMIT 5;


--CONSULTA 35. Selecciona todos los actores cuyo primer nombre es "Jophnny"
SELECT first_name AS "nombre"
FROM actor AS a 
WHERE first_name ILIKE '%Johnny%';
-- Notas:
--% comodin: Representa cero o más caracteres en cualquier posición.
-- LIKE: Busca coincidencias sensibles a mayúsculas/minúsculas.
-- ILIKE: Busca coincidencias insensibles a mayúsculas/minúsculas 


--CONSULTA 36. Renombra la columna "first_name" como "nombre" y "last_name" como "apellido"
SELECT 	first_name AS "nombre",
		last_name AS "apellido"
FROM actor AS a;
SELECT 	first_name  "nombre", last_name  "apellido"
FROM actor a;


--CONSULTA 37. Encuentra el ID del actor mas bajo y mas alto en la tabla actor
SELECT 	MIN(actor_id)AS "id-minimo",
		MAX (actor_id)AS "id_maximo"
FROM actor AS a;


--CONSULTA 38. Cuantos actores hay en la tabla "actor"
SELECT 	count (actor_id)
FROM actor AS a;


-- CONSULTA 39. Sselecciona todos los actores y ordenalos por apellido en orden ascendente
SELECT 	first_name AS "Nombre",
		last_name AS "Apellido"
FROM actor AS a 
ORDER BY "Apellido" ASC; -- Ordenamos solo por el apellido de forma ascendente.
--Correcto, tenia 2 ordenes para "ordenar", basta con quitar la que no se pedia.


-- CONSULTA 40. Selecciona las 5 primeras peliculas de la tabla "film"
SELECT title AS "titulo"
FROM film AS f 
ORDER BY titulo
LIMIT 5;


 
--CONSULTA 41. Agrupa los actores por su nombre y cuenta cuantos actores tienen el mismo nombre ¿Cual es enombre mas repetido?
-- El nombre más repetido es "Julia" con un total de 4 apariciones.
SELECT 
    first_name AS "nombre", 
    COUNT(first_name) AS "total_nombres"
FROM actor AS a
GROUP BY first_name
ORDER BY "total_nombres" DESC, "nombre" ASC;
-- en esta opcion solo mostramos el nombre mas repetido con el limit
SELECT 
    first_name AS "nombre", 
    COUNT(first_name) AS "total_nombres"
FROM actor AS a
GROUP BY first_name
ORDER BY "total_nombres" DESC, "nombre" ASC
LIMIT 1; -- Solo mostramos el más repetido


--CONSULTA 42. Encuentra todos los alquileres y los nombres de los clientes que los realizaron
SELECT 
    c.customer_id AS "ID_cliente", -- El número que identifica al cliente.
    CONCAT(c.first_name, ' ', c.last_name) AS "nombre_completo", -- Juntamos el nombre y apellido en una sola columna.
    r.rental_id AS "ID_alquiler" -- Mostramos el número del alquiler hecho por el cliente.
FROM rental AS r -- Miramos la tabla de alquileres.
INNER JOIN customer AS c ON r.customer_id = c.customer_id -- Relacionamos los alquileres con los clientes que los hicieron.
ORDER BY c.customer_id ASC; -- Ordenamos por el ID del cliente de menor a mayor.



--CONSULTA 43. Muestra todos los clientes y sus alquileres si existen, incluyendo aquellos que no tienen alquileres
SELECT 
    c.customer_id AS "ID_cliente", 
    c.first_name AS "nombre_cliente", 
    r.rental_id AS "ID_alquiler"
FROM rental AS r
LEFT JOIN customer AS c
    ON r.customer_id = c.customer_id
ORDER BY c.customer_id ASC;
-- esta consulta es igual que la anterior, pero usamos un LEFT (en lugar de INNER) para agregar tb los usuarios que no tienen alquiler 


--CONSULTA 44. Realiza un CROSS JOIN entre las tablas film y category ¿Aporta valoresta consulta? ¿Porque?. Deja despues de la consulta la contestacion
SELECT *
FROM film AS f 
CROSS JOIN category AS c;
-- El CROSS JOIN no es útil aquí porque genera combinaciones entre todas las películas y categorías, y para eso ya tenemos la tabla film_category ya define qué categorías pertenecen a cada película. 
-- Por lo tanto, el INNER JOIN es más eficiente y lógico para este caso.


--CONSULTA 45. Encuentra los actores que han participado en peliculas de lacategoria "action"
SELECT a.first_name AS "nombre",
       c.name AS "categoría"
FROM actor AS a
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
INNER JOIN film AS f ON fa.film_id = f.film_id
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
WHERE c.name LIKE '%Action%'
ORDER BY a.first_name;


--CONSULTA 46.Encuentra todos los actores que no hayan participado en peliculas
SELECT 	a.actor_id AS "ID_actor",
		a.first_name AS "Nombre"
FROM actor AS a 
 LEFT JOIN film_actor AS fa ON a.actor_id = fa.actor_id 
 LEFT JOIN film AS f ON fa.film_id = f.film_id
WHERE fa.actor_id IS NULL;


--COSNULTA 47. Selecciona el nombre de los actores y la cantidad de peliculas en las que han participado
SELECT 
    a.first_name AS "Nombre",
    count(fa.film_id)  AS "numero_peliculas"
FROM 
    actor AS a
INNER JOIN 
    film_actor AS fa ON a.actor_id = fa.actor_id
GROUP BY a.first_name
ORDER BY count(fa.film_id) DESC;


--CONSULTA 48. Crea una vista llamada "actor_num_peliculas" que muestre los nombres de los actores y el numero de peliculas en las que han participado
CREATE VIEW actor_num_peliculas as
SELECT 
   	a.first_name AS "Nombre",
    COUNT(fa.film_id) AS "Numero_Peliculas"
FROM 
    actor AS a
INNER JOIN 
    film_actor AS fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.first_name
ORDER BY 
    COUNT(fa.film_id) DESC;
SELECT * FROM actor_num_peliculas;



--CONSULTA 49. Calcula el numero total de alquileres realizados por cada cliente
SELECT 
	c.customer_id AS "ID_cliente",
	concat(c.first_name,' ',c.last_name) AS "nombre_completo",
	COUNT(r.rental_id) AS "Total_Alquileres"
	FROM customer AS c 
INNER JOIN rental AS r ON c.customer_id = r.customer_id 
GROUP BY c.customer_id
ORDER BY COUNT(r.rental_id); 


--COSNUTLA 50. Calcula la duracion total de las peliculas en la categoria "action".
SELECT
		c.name AS "genero",
		SUM(f.length) AS "duracion_total"
FROM category AS c
INNER JOIN film_category AS fc ON c.category_id = fc.category_id 
INNER JOIN film AS f ON fc.film_id = f.film_id 
WHERE c.name LIKE '%Action%'
GROUP BY c.name
ORDER BY SUM(f.length); 


--CONSULTA 51. Crea una tabla temporal llamada "clientes_rentas_temporal" para almacenar el total de alquileres por cliente
CREATE TEMPORARY TABLE clientes_rentas_temporal AS
	SELECT 
   	 	CONCAT(c.first_name, ' ', c.last_name) AS "Nombre_Completo",
    	COUNT(r.rental_id) AS "Total_Alquileres"
	FROM 
    	customer AS c
	INNER JOIN 
    	rental AS r ON c.customer_id = r.customer_id
	GROUP BY 
    	c.first_name, c.last_name
	ORDER BY 
    	COUNT(r.rental_id) DESC;

SELECT * FROM clientes_rentas_temporal;


--CONSULTA 52.Crea una tabla temporal llamada "peliculas_alquiladas" que almacene las peliculas que han sido alquiladas al menos 10 veces
CREATE TEMPORARY TABLE peliculas_alquiladas AS
	SELECT 
			f.title AS "titulo",
			count(r.rental_id) AS "total_alquileres"
	FROM rental AS r 
	INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id 
	INNER JOIN film AS f ON f.film_id = i.film_id
	GROUP BY f.title 
	HAVING count(r.rental_id) >= 10
	ORDER BY count(r.rental_id) asc;

SELECT * FROM peliculas_alquiladas;


--CONSULTA 53. Encuentra el titulo de las peliculas que han sido alquiladas por el cliente con el nombre "Tammy Sanders" y que aun no se han devuelto 
--Ordena los resultados alfabeticamente pr titulo de pelicula
SELECT
		f.title AS "titulo",
		CONCAT(c.first_name,' ', c.last_name) AS "nombre_completo"
FROM film AS f 
INNER JOIN inventory AS i ON i.film_id = f.film_id 
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id
INNER JOIN customer AS c ON c.customer_id = r.customer_id 
WHERE r.return_date IS NULL 
	AND concat(c.first_name,' ', c.last_name) ILIKE 'Tammy Sanders'
ORDER BY f.title ASC ; 
 


--CONSULTA 54. Encuentra los nombre de los actores que han actuado en al menos una pelicula que pertenece a la categoria "Sci-Fi". Ordena los resultados alfabeticamente por apellido
SELECT
		CONCAT(a.first_name,' ', a.last_name) AS "nombre_completo",
		c."name" AS "genero"
FROM actor AS a 
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id 
INNER JOIN film AS f ON fa.film_id = f.film_id 
INNER JOIN film_category AS fc ON f.film_id = fc.film_id 
INNER JOIN category AS c ON fc.category_id = c.category_id
WHERE c."name" ILIKE '%Sci-Fi%'
GROUP BY c."name", a.last_name, a.first_name 
ORDER BY a.last_name ASC ;


--CONSULTA 55.Encuentra el nombre y el apellido de los actores que han actuado en peliculas que se alquilaron despues de que la pelicula "Spartacus Cheaper" se alquilara por primera vez. ordena los resultados alfabeticamente por apellido
SELECT 	
		CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo",
		f.title AS "titulo",
		DATE(r.rental_date) AS "dia_alquiler"
FROM actor AS a 	
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id 
INNER JOIN film AS f ON fa.film_id = f.film_id 
INNER JOIN inventory AS i ON i.film_id = f.film_id 
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE r.rental_date > (
	SELECT	MIN(rental_date)
	FROM rental AS r
	INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
    INNER JOIN film AS f ON i.film_id = f.film_id
	WHERE f.title ILIKE '%Spartacus Cheaper%'
	)
ORDER BY a.last_name asc;


--CONSULTA 56. Encuentra el nombre y el apellido de los actores que no han actuado en ningua pelicula de la categoria "music"
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS "nombre_completo",
    c.name AS "genero"
FROM actor AS a
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
INNER JOIN film AS f ON fa.film_id = f.film_id
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
WHERE a.actor_id NOT IN (
    SELECT DISTINCT fa.actor_id
    FROM film_actor AS fa
    INNER JOIN film AS f ON fa.film_id = f.film_id
    INNER JOIN film_category AS fc ON f.film_id = fc.film_id
    INNER JOIN category AS c ON fc.category_id = c.category_id
    WHERE c.name ILIKE '%Music%'
)
ORDER BY a.last_name ASC, a.first_name ASC;


--CONSULTA 57. Encuentra el titulo de todas las peliculas que fueron alquiladas por mas de 8 dias
SELECT 
    f.title AS "titulo",
    EXTRACT(DAY FROM (r.return_date - r.rental_date)) AS "dias_alquiler"
FROM film AS f
INNER JOIN inventory AS i ON i.film_id = f.film_id
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id
WHERE (r.return_date - r.rental_date) > INTERVAL '8 days';



--CONSULTA 58. Encuentra el titulo de todas las peliculas que son de la misma categoria que "Animation"
SELECT 
		f.title AS "titulo",
		c."name" AS "genero",
		c.category_id AS "ID_genero"
FROM film AS f 
INNER JOIN film_category AS fc ON f.film_id = fc.film_id 
INNER JOIN category AS c ON fc.category_id = c.category_id
WHERE c.category_id  = (
	SELECT category_id 
	FROM category AS c2 
	WHERE name = 'Animation'
	);


--CONSUTLA 59. Encuentra los nombres de las peliculas que tienen la misma duracion que la pelicula con el titulo Dancing Fever.
-- Ordena los resultados alfabeticamente por titulo de pelicula
SELECT 
    title AS "Titulo",
    length AS "Duracion"
FROM film AS f
WHERE length = (
    SELECT length
    FROM film
    WHERE title ILIKE '%Dancing Fever%'
)
ORDER BY title;



--CONSULTA 60. Encuentra los nombres de los cliente que han alquilado al menos 7 peliculas distintas. Ordena los resultados alfabeticamente por apellido.
SELECT 	concat(c.first_name, ' ', c.last_name) AS "Nombre_completo",
		count(r.rental_id) AS "Alquileres_cliente"
FROM customer AS c 
INNER JOIN rental AS r ON c.customer_id = r.customer_id
INNER JOIN inventory AS i ON i.inventory_id = r.inventory_id 
WHERE c.customer_id IN (
		SELECT c2.customer_id
		FROM customer AS c2
		INNER JOIN rental AS r2 ON c2.customer_id = r2.customer_id
		INNER JOIN inventory AS i2 ON i2.inventory_id = r2.inventory_id 
		WHERE i2.film_id >= 7
)
GROUP BY c.first_name, c.last_name 
ORDER BY c.last_name asc;
-- el error estaba en esta fila WHERE i2.film_id >= 7 que es  <=7 (porque al menos) 


--CONSULTA 61. Encuentra la cantidad total de peliuclas alquiladas por categoria y muestra el nombre de la categoria junto con el recuento de alquileres
SELECT 
		COUNT (r.rental_id) AS "Total_peliculas_alquiladas",
		c."name" AS "genero"
FROM rental AS r 
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id 
INNER JOIN film AS f ON f.film_id = i.film_id 
INNER JOIN film_category AS fc ON fc.film_id = f.film_id 
INNER JOIN category AS c ON c.category_id = fc.category_id 
GROUP BY c."name"
ORDER BY COUNT (r.rental_id)  asc; 


--CONSULTA 62. Encuentra el numero de peliculas por categoria estrenadas en 2006
SELECT 
		COUNT(f.title) AS "Numero_peliculas",
		c."name" AS "genero",
		f.release_year AS "Año_estreno"
FROM film AS f 
INNER JOIN film_category AS fc ON fc.film_id = f.film_id 
INNER JOIN category AS c ON c.category_id = fc.category_id
WHERE f.release_year = 2006
GROUP BY c."name", f.release_year ;


--CONSULTA 63.Obten todas las combinaciones posibles de trabajadores con las tiendas que tenemos
SELECT *
FROM store AS s 
CROSS JOIN staff AS s2;


--CONSULTA 64. Encuentra la cantidad total de peliculas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de peliculas alquiladas.
SELECT 	c.customer_id AS "Identificador_cliente",-- Id cliente
		concat(c.first_name, ' ', c.last_name) AS "Nombre_completo", -- nombre completo
		COUNT (r.rental_id) AS "Total_alquileres" -- cantidad de peliculas/cliente
FROM customer AS c 
INNER JOIN rental AS r ON r.customer_id = c.customer_id 
GROUP BY c.customer_id
ORDER BY c.first_name ASC, c.last_name ASC;




 




 	
 
 	












