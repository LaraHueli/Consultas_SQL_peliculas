--Encuentra lo que costo el antepenultimo alquiler 
--ordenado por dia

SELECT
	amount AS "coste",
	payment_date AS "dia_pago"
FROM payment AS p 
ORDER BY payment_id DESC -- Ordenno descendente
LIMIT 2 -- pido solo 2 registros
OFFSET 1;-- ignora la primera fila del resultado