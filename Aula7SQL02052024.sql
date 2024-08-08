SELECT
     sum(valor) AS soma_valor
FROM
    clientes_promo_jumpflix;
    
  SELECT pais,
    SUM(valor) AS soma_valor
FROM
    clientes_promo_jumpflix
group by pais;

-- Agregação, Agrupando Dados funcções de agregação 

SELECT 
     tipo_desconto,
      Round(avg(valor_desconto), 2) AS Media_Desconto 
From descricao_promo_jumpflix
group by tipo_desconto;


SELECT 
    tipo_desconto,
    ROUND(AVG(valor_desconto), 2) AS Media_Desconto
FROM
    descricao_promo_jumpflix
GROUP BY tipo_desconto
ORDER BY Media_desconto DESC;


SELECT * FROM jumpflix_especificacoes;

-- Exercício


SELECT 
    genero, 
    COUNT(genero) AS quantidade
FROM
    jumpflix_especificacoes
    GROUP BY genero
    order by count(genero) desc;
    
    
SELECT DISTINCT
    genero, COUNT(genero) AS qnt
FROM
    jumpflix_especificacoes
WHERE
    genero <> ''
GROUP BY genero
ORDER BY COUNT(genero) DESC;

    
SELECT DISTINCT
    genero, COUNT(genero) AS qnt
FROM
    jumpflix_especificacoes
WHERE
    genero <> null
GROUP BY genero
ORDER BY COUNT(genero) DESC;


SELECT * FROM descricao_promo_jumpflix;

 SELECT 
    ativo,
    tipo_desconto,
    ROUND(AVG(valor_desconto), 2) AS Media_Desconto,
    ROUND(SUM(valor_desconto), 2) AS Soma_Desconto
FROM
    descricao_promo_jumpflix
GROUP BY ativo, tipo_desconto
ORDER BY tipo_desconto;      

/* Usar having tendo pais maior que 9 a coluna total_valor só existe no mysql para executar antes de ser criada é somente um apelido.
 se você tem uma consulta que agrupa os valores de vendas por cliente e quer filtrar apenas os clientes cujo valor total de vendas é 
 maior que 9, você pode usar a cláusula HAVING*/
 
SELECT * FROM clientes_promo_jumpflix;

SELECT 
    pais, 
    SUM(valor) AS total_valor
FROM
    clientes_promo_jumpflix
GROUP BY pais
HAVING total_valor > 9;

SELECT * FROM clientes_promo_jumpflix;

SELECT
     codigo_promocional,
     round(avg (valor*quantidade),0) AS media_total
FROM clientes_promo_jumpflix
    GROUP BY codigo_promocional
    having round(avg (valor*quantidade),0) < 13500;

SELECT * FROM jumpflix_filmes;

SELECT 
    tempo,
    classificacao_indicativa,
	count(classificacao_indicativa) AS quantidade
FROM jumpflix_filmes
GROUP BY tempo, classificacao_indicativa
HAVING count(*) > 1;

-- problemas na aula 5 palavra Ação no texto.
SELECT DISTINCT 
       genero
FROM jumpflix_especificacoes
   WHERE LOCATE('Ação', genero)>0;

SELECT DISTINCT 
       genero
FROM jumpflix_especificacoes
   WHERE genero COLLATE utf8mb4_0900_as_cs like '%Ação%';

SELECT *
FROM jumpflix_especificacoes
WHERE FIND_IN_SET('Ação', REPLACE(genero, ', ', ',')) > 0;



SELECT DISTINCT 
       genero
FROM jumpflix_especificacoes
   WHERE concat(', ', genero, ', ')>0;
   
   -- Teste
select concat(',','Ação, Aventura, Comédia',',');

