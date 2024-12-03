-- encuentra el ID del actor mas bajo y mas alto en la tabla actor

SELECT 	MIN(actor_id)AS "id-minimo",
		MAX (actor_id)AS "id_maximo"
FROM actor AS a;

