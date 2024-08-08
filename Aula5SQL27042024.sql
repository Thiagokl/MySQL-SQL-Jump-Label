
-- Aula 5 

 SELECT Distinct titulo
 FROM promocao_jumpflix;
 
SELECT * FROM promocao_jumpflix
 where titulo = 'oferta de aniversario';
 
 Select * from clientes_promo_jumpflix;
 
 Select * from clientes_promo_jumpflix
 where codigo_promocional = 'VERAO2023'
     or pais= '' 'Brasil';
     
Select * from clientes_promo_jumpflix
 where codigo_promocional = 'VERAO2023'
     and pais= '' 'Brasil';
     
SELECT * FROM jumpflix_filmes;

Select distinct tempo
from jumpflix_filmes;

Select * FROM jumpflix_filmes
where classificacao_indicativa = 15
and tempo = '4,393 min';

Select * FROM jumpflix_filmes
where classificacao_indicativa = 15
or tempo = '4,393 min';

Select * FROM jumpflix_filmes
where nome = 'Lucifer';

 -- VALORES DISTINTO DE CLASSIFICAÇÃO INDICATIVA
 
 SELECT DISTINCT classificacao_indicativa from jumpflix_filmes;
 
 Select * FROM jumpflix_filmes
 where classificacao_indicativa IN (10,12,35);
 
 Select * FROM jumpflix_filmes
 where classificacao_indicativa or (35);
 
SELECT 
*
FROM promocao_jumpflix
where descricao LIKE '%primavera!';

SELECT 
*
FROM promocao_jumpflix
where descricao LIKE '%primavera%';


SELECT 
*
FROM jpromocao_jumpflix
where titulo LIKE '%The%'; -- regularizar


SELECT 
*
FROM promocao_jumpflix
where titulo LIKE '_f%';

SELECT 
*
FROM promocao_jumpflix
where titulo like '__O%'
      and titulo like '%natal%';
   
   
   
SELECT nome,
       classificacao_indicativa
from jumpflix_filmes
WHERE nome LIKE '___r%' AS 'letra_filmes'; -- corrigir meu código

SELECT nome,
       classificacao_indicativa,
       'terceira letra r' AS letra_filme,
        tempo
from jumpflix_filmes
WHERE nome LIKE '_r%';      
	
SELECT nome,
       classificacao_indicativa,
       'terceira letra r' AS letra_filme,
        tempo
from jumpflix_filmes
WHERE nome LIKE '_arc%';      

-- Usando Between

select * from promocao_jumpflix;

SELECT * from promocao_jumpflix   
WHERE data_inicio between '2024-03-01' and '2024-06-01';
-- and descricao like '%desconto%';

SELECT * from promocao_jumpflix   
WHERE data_inicio between 4 and 10;

select * from jumpflix_filmes;

-- idade indicativa entre 10 e 15

SELECT * from jumpflix_filmes
WHERE classificacao_indicativa between 10 and 15;

-- Valores de negação

SELECT * from jumpflix_filmes
WHERE classificacao_indicativa <> 18;

SELECT * from jumpflix_filmes
WHERE classificacao_indicativa not in (18);

SELECT * from jumpflix_filmes
WHERE classificacao_indicativa != 18;

SELECT 
    *
FROM
    jumpflix_filmes
WHERE
    classificacao_indicativa <= 15
        AND tempo <> '60 min'; 

SELECT * FROM descricao_promo_jumpflix;

-- 0 representa false // 1 representa true

SELECT 
   *
FROM descricao_promo_jumpflix
WHERE ativo = true
ORDER BY tipo_desconto, valor_desconto desc;

describe descricao_promo_jumpflix;

SELECT titulo,
	   data_fim
FROM promocao_jumpflix
ORDER BY data_fim desc;

