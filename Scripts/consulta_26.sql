-- encuantra el promedio, la desviacion estandar y varianza del total pagado

SELECT	round (avg (amount),2) AS "promedio_importe",
		round (stddev(amount),2) AS "desviacion_importe",
		round (variance(amount),2) AS "varianza_importe"
FROM payment AS p;



