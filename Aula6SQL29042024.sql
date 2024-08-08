-- Aula 6 SQL 

DESCRIBE jumpflix_filmes;

SELECT 
    *
FROM jumpflix_filmes
WHERE data_lancamento BETWEEN '2003-11-02' AND '2013-07-11'
ORDER BY nome;

-- Funções de agregação

SELECT 
    SUM(quantidade) AS qtd_soma, 
    AVG(quantidade) AS media
FROM
    clientes_promo_jumpflix;

SELECT 
  COUNT(pontuacao) AS total
FROM jumpflix_especificacoes
  WHERE pontuacao = 8;

SELECT 
  COUNT(*) AS total
FROM jumpflix_especificacoes
  WHERE pontuacao = 8;
  
  select * from clientes_promo_jumpflix;
  
SELECT 
    SUM(quantidade) 
FROM clientes_promo_jumpflix 
 Where codigo_promocional LIKE '%2024%';
   
-- ele conta 8 paises distintos por causa do espaço vazio
SELECT DISTINCT
    Count(pais),
    COUNT(distinct pais)
FROM clientes_promo_jumpflix;

-- ele conta o espaço para eliminar WHERE pais <> ' ';

SELECT DISTINCT
   COUNT(distinct pais)
FROM clientes_promo_jumpflix
WHERE pais <> ' ';

SELECT * FROM jumpflix_especificacoes;

SELECT 
    AVG(votos) AS media,
    SUM(votos) AS qtd_soma
FROM
   jumpflix_especificacoes
   Where genero LIKE '%ACAO%';
   
describe jumpflix_especificacoes;

-- Teste
SELECT 
    AVG(REPLACE(votos, ',', '')) AS media,
    SUM(REPLACE(votos, ',', '')) AS soma
FROM
    jumpflix_especificacoes
WHERE
    genero LIKE '%ACAO%';
   
   -- Alterar casas decimais LIKE para que não puxe ação nomeio das frases.

SELECT 
    AVG(CAST(REPLACE(votos, ',', '') AS DECIMAL)) AS media,
    SUM(CAST(REPLACE(votos, ',', '') AS DECIMAL)) AS soma
FROM
    jumpflix_especificacoes
WHERE
    genero LIKE '%ACAO%';
    
   -- TESTE 
   
 SELECT 
    *
FROM
    jumpflix_especificacoes
WHERE
    LOCATE('Ação', genero) > 0;
   
 
 SELECT * FROM promocao_jumpflix;
 
SELECT titulo,
       descricao,
       MONTH(data_fim) AS mes,
       YEAR(data_fim) AS ano
FROM promocao_jumpflix
ORDER BY ano, mes;


