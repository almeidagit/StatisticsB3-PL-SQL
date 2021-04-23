/* Retorna MAIOR valor de um range */
SELECT to_char(DATA_HORA,'dd/mm/yyyy hh24:mi:ss'),MAXIMA,MINIMA 
FROM INDICE  
WHERE  TO_CHAR(DATA_HORA,'hh24') 
BETWEEN '09' AND '10';

/* Retorna MAIOR valor de um Período */
SELECT MAX(MAXIMA) 
FROM INDICE  
WHERE  TO_CHAR(DATA_HORA,'hh24') 
BETWEEN '09' AND '10';

/*Retorna o Rank a partir do maior preço do Período */
SELECT 
    to_date(DATA_HORA,'dd/mm/yyyy hh24:mi:ss'), MAXIMA,
	RANK() OVER (ORDER BY MAXIMA DESC) 
FROM INDICE;

/*Retorna o Rank a partir do menor preço do Período */
SELECT 
	to_char(DATA_HORA,'dd/mm/yyyy hh24:mi:ss'), MINIMA,
	RANK() OVER (ORDER BY MINIMA) 
FROM INDICE;





