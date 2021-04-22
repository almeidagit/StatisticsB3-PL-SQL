
/*Retorna o Rank a partir do maior pre�o do Per�odo */
SELECT 
    to_char(DATA_HORA,'cc dd/mm/yyyy hh24:mi:ss'), MAXIMA,
	RANK() OVER (ORDER BY MAXIMA DESC) 
FROM 
	INDICE;

/*Retorna o Rank a partir do menor pre�o do Per�odo */
SELECT 
	to_char(DATA_HORA,'cc dd/mm/yyyy hh24:mi:ss'), MINIMA,
	RANK() OVER (ORDER BY MINIMA) 
FROM 
	INDICE;

