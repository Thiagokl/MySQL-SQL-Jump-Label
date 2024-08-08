-- Aula 10

-- Exemplo aluno tabela_pokemon

SELECT 
	name,
    total,
		CASE 
			WHEN total < 380 THEN 'Força baixa'
			WHEN total >= 380 AND total < 581 THEN 'Força média'
			WHEN total >= 581 AND total < 750 THEN 'Força Forte'
			ELSE 'Muito Forte'
	END AS forca
FROM 
    tabela_pokemon
    ORDER BY total desc;
    
   -- Exemplo Aluno utilizando Subconsultas com criação de tabela teste
   
/* SELECT * 
   FROM jump_school_alunos
		ORDER BY 
			CASE 
				WHEN ativo = 1 THEN data_matricula
				ELSE nome
			END;
    
   Está criando uma nova tabela chamada teste a partir dos dados da tabela jump_school_alunos. A tabela teste será ordenada de
   acordo com a seguinte condição: se o aluno estiver ativo (ativo = 1), a ordenação foi feita pela data de matrícula (data_matricula), 
   caso contrário, a ordenação será feita pelo nome do aluno.
   
   CREATE TABLE teste AS SELECT * 
                         FROM jump_school_alunos
								ORDER BY 
							CASE 
								WHEN ativo = 1 THEN data_matricula
								ELSE nome
							END; 
                                */
   
  -- Exemplo    
    
    CREATE TABLE pokemon_forca AS
		SELECT 
		name as nome_todo,
		total,
			CASE 
				WHEN total < 380 THEN 'Força baixa'
				WHEN total >= 380 AND total < 581 THEN 'Força média'
				WHEN total >= 581 AND total < 750 THEN 'Força Forte'
				ELSE 'Muito Forte'
		END AS forca
	FROM 
		tabela_pokemon
		ORDER BY total desc;
        
    SELECT * FROM pokemon_forca;
    
    -- Criando Tabela
    
    SELECT * FROM jumpflix_especificacoes;
    
  -- Utilizando a tabela jumpflix_especificacoes:
-- Crie uma nova tabela chamada media_aventura. 
-- Essa tabela deverá conter a média dos votos dos gêneros que contem Aventura  sendo a média maior que 30000 

USE streaming_jumpflix;

SELECT * FROM jumpflix_especificacoes;

SELECT * FROM media_aventura;

   DROP TABLE media_aventura;
 
  CREATE TABLE media_aventura AS -- Primeiramente, criamos a tabela "media_aventura" com a estrutura necessária
	SELECT  -- criamos uma subconsulta
          genero,                                       -- Selecionamos as colunas "genero"
          AVG(replace(votos, ',', '')) AS media_votos   --  Selecionamos a coluna votos calculamos AVG 'media' REPLACE removendo as vírgulas dos valores de votos
	FROM
    jumpflix_especificacoes
		WHERE                                         -- filtrando com 'where'  genero e 'like' os registros que possuem o gênero "Aventura"
			genero LIKE '%Aventura%'
		GROUP BY genero                               -- Agrupamos os resultados pela coluna genero
	HAVING AVG(replace(votos, ',', '')) > '30000';    -- cláusula HAVING filtrando resultados, exibindo somente a média de votos maior que 30.000
													  -- necessário aplicar após a agregação dos dados, permitindo filtrar o resultado final da consulta
                                                      
    -- TESTE SEM WHERE PORÉM RESULTADO FINAL MUDA NÃO SENDO EFICIENTE PARA O SOLICITADO
    
  CREATE TABLE media_aventura AS 
		 SELECT genero, 
				AVG(REPLACE(votos, ',', '')) AS media_votos 
  FROM jumpflix_especificacoes
	GROUP BY genero
		HAVING genero LIKE '%Aventura'
    AND AVG(REPLACE(votos, ',', '')) > 30000;
    
    
    
    -- EXERC
    -- Select nome, classificacao indicativa, data_lancamento e o tempo precisa ter a data lançamento mais recente 
    
    SELECT * FROM jumpflix_filmes;
    
SELECT 
    nome, 
    classificacao_indicativa, 
    tempo,
    data_lancamento
FROM
    jumpflix_filmes
WHERE
    data_lancamento = (SELECT 
                        MAX(data_lancamento)
					  FROM jumpflix_filmes);
-- teste

SELECT 
    nome, classificacao_indicativa, 
    tempo,
    data_lancamento AS maior_data
FROM
    jumpflix_filmes
WHERE
    data_lancamento = (SELECT 
						MAX(data_lancamento) 
					  FROM jumpflix_filmes);

-- Sem subconsulta

SELECT 
    nome, 
    classificacao_indicativa, 
    tempo,
    data_lancamento
FROM
    jumpflix_filmes
    ORDER BY
			data_lancamento DESC
	LIMIT 5;
    
    -- Correção simples
	
SELECT 
      MAX(data_lancamento) maior_data
        FROM
            jumpflix_filmes;
            
  -- inserindo a data manualmente após verificar qual seria a maior data
  
SELECT 
    nome,
    classificacao_indicativa, 
    tempo
FROM jumpflix_filmes
WHERE data_lancamento = '2019-05-10';

-- Correção 

SELECT 
    nome,
    classificacao_indicativa, 
    tempo,
    data_lancamento
FROM
    jumpflix_filmes
WHERE
    data_lancamento = '2019-05-10';
    
 -- Exemplo aluno
 /*usando datediff com a data de hoje, o filme mais perto da data de hoje */
 
SELECT 
    nome, 
    classificacao_indicativa, 
    tempo
FROM
    jumpflix_filmes
ORDER BY ABS(DATEDIFF(CURRENT_DATE(), data_lancamento))
LIMIT 1;

-- Trabalhando com Subconsultas Não relacional
/*Escreva uma consulta SQL que calcule o total da quantidade de produtos vendidos por
 país para os clientes do serviço de streaming 'Jumpflix', agrupando os resultados por
 país. Em seguida, filtre os resultados para exibir apenas os países cujo total de quantidade
 de produtos vendidos seja inferior à média global da quantidade de produtos vendidos por cliente no serviço 'Jumpflix'.*/
 

SELECT 
    pais, SUM(quantidade) AS total_produtos_vendidos
FROM
    cliente_promo_jumpflix
GROUP BY pais
HAVING total_produtos_vendidos;


-- correção Subconsultas 

SELECT 
    pais, SUM(quantidade)
FROM
    clientes_promo_jumpflix
GROUP BY pais
HAVING SUM(quantidade) < (SELECT 
        AVG(quantidade)
    FROM
        clientes_promo_jumpflix);

 -- Mais exemplos de Subconsultas 
 
 SELECT 
    pais, 
    SUM(quantidade)
FROM
    clientes_promo_jumpflix
GROUP BY pais
HAVING SUM(quantidade) < (SELECT 
        SUM(valor_desconto) * 1000
    FROM
        descricao_promo_jumpflix);       