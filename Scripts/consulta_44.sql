-- realiza un CROSS JOIN entre las tablas film y category ¿Aporta valoresta consulta?
--¿Porque?. Deja despues de la consulta la contestacion



SELECT *
FROM film AS f 
CROSS JOIN category AS c
  

-- El CROSS JOIN no es útil aquí porque genera combinaciones entre todas las películas y categorías, y 
--para eso ya tenemos la tabla film_category ya define qué categorías pertenecen a cada película. 
-- Por lo tanto, el INNER JOIN es más eficiente y lógico para este caso.






