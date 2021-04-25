 /* Retorna as 10 maiores máximas de cada dia */ 
SELECT * FROM   
(SELECT TO_DATE(DATA_HORA,'dd/mm/yyyy hh24:mi:ss') i_data,
        TO_CHAR(DATA_HORA,'hh24:mi:ss') i_hora,
               MAXIMA,
               MINIMA,
               RANK() OVER (PARTITION BY TO_DATE(DATA_HORA,'dd/mm/yyyy') ORDER BY MAXIMA) AS maxima_do_dia
        FROM   INDICE)
WHERE  maxima_do_dia <= 10
ORDER BY i_data, maxima_do_dia DESC;

/* Exemplo com COUNT */ 
SELECT to_char(DATA_HORA,'dd/mm/yyyy hh24:mi:ss'), MAXIMA 
FROM INDICE IND1
WHERE(
SELECT COUNT(*)
FROM INDICE IND2
WHERE 
IND1.MAXIMA < IND2.MAXIMA)
<10
ORDER BY MAXIMA DESC;
  
/* Retorna, em ordem, todas as máximas por dia(PARTITION BY) */ 
SELECT TO_CHAR(DATA_HORA,'dd/mm/yyyy hh24:mi:ss'), MAXIMA,
DENSE_RANK() OVER (PARTITION BY TO_DATE(DATA_HORA,'dd/mm/yyyy') 
ORDER BY maxima DESC) AS ordemmaxima
FROM INDICE  ;


/* Retorna a contagem do total de dias do banco */ 
SELECT COUNT(DISTINCT TO_DATE(DATA_HORA,'dd/mm/yyyy')) FROM INDICE;
 
 
/* Retorna a contagem do total de dias do banco */ 
SELECT COUNT(*)
FROM(
SELECT DISTINCT TO_DATE(DATA_HORA,'dd/mm/yyyy') 
FROM   INDICE
);
    
/* Retorna as máximas de um período */ 
SELECT * FROM INDICE
WHERE maxima = (
SELECT MAX(MAXIMA) 
FROM INDICE  
WHERE  TO_CHAR(DATA_HORA,'hh24') 
BETWEEN '09' AND '10');
 
/* Retorna todos os dias do banco ordenados por CHAR */ 
SELECT
DISTINCT TO_CHAR(DATA_HORA,'dd/mm/yyyy')
FROM INDICE
ORDER BY TO_CHAR(DATA_HORA,'dd/mm/yyyy');
    
/* Retorna todos os dias do banco ordenados por DATE */ 
SELECT
DISTINCT TO_DATE(DATA_HORA,'dd/mm/yyyy')
FROM INDICE
ORDER BY TO_DATE(DATA_HORA,'dd/mm/yyyy');

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
TO_CHAR(DATA_HORA,'dd/mm/yyyy hh24:mi:ss'), MAXIMA,
RANK() OVER (ORDER BY MAXIMA DESC) 
FROM INDICE;

/*Retorna o Rank a partir do menor preço do Período */
SELECT 
TO_CHAR(DATA_HORA,'dd/mm/yyyy hh24:mi:ss'), MINIMA,
RANK() OVER (ORDER BY MINIMA) 
FROM INDICE;





