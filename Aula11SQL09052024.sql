-- Aula 11

-- correção Subconsultas 

SELECT 
    pais, SUM(quantidade)
FROM
    clientes_promo_jumpflix
GROUP BY pais
HAVING SUM(quantidade) < (SELECT 
							AVG(quantidade)
						  FROM clientes_promo_jumpflix);

 -- Mais exemplos de Subconsultas 
 
 SELECT 
    pais, 
    SUM(quantidade)
FROM
    clientes_promo_jumpflix
GROUP BY pais
HAVING SUM(quantidade) < (SELECT 
							SUM(valor_desconto) * 1000
						  FROM descricao_promo_jumpflix);  
    
   -- Exercício Aula 11 
 /*Selecione o tempo e a média da classificação indicativa da tabela jumpflix_filmes, 
 agrupados pelo tempo. Em seguida, filtre os resultados para incluir apenas os grupos
 em que a média da classificação indicativa é menor que a média geral da classificação indicativa em 1 ponto.*/   
 
 SELECT * FROM jumpflix_filmes;
 
SELECT 
    tempo, 
    AVG(classificacao_indicativa) AS media_classificacao
FROM
    jumpflix_filmes
GROUP BY tempo
HAVING AVG(classificacao_indicativa) < (SELECT 
											AVG(classificacao_indicativa) - 1
										FROM jumpflix_filmes);	
   
   
SELECT 
    tempo, 
    ROUND(AVG(classificacao_indicativa),2) AS media_classificacao
FROM
    jumpflix_filmes
GROUP BY tempo
HAVING AVG(classificacao_indicativa) < (SELECT 
											AVG(classificacao_indicativa) - 1
										FROM jumpflix_filmes);
                                        
-- Exercício Aula 11

SELECT * FROM descricao_promo_jumpflix;
SELECT * FROM clientes_promo_jumpflix;

-- Query corrigida

/* Escreva uma consulta SQL, que retorna o código promocional e o total de valor por promoção 
com o nome 'total_promocao' para todas as promoções em que o valor total seja igual ou superior à média
dos valores de desconto das promoções ativas e não ativas que sejam de 2024 e o tipo de desconto igual ao valor fixo
Utilize as tabelas clientes_promo_jumpflix e descricao_promo_jumpflix */

	SELECT * fROM clientes_promo_jumpflix;
    SELECT * fROM descricao_promo_jumpflix;
    
SELECT 
      codigo_promocional,
      SUM(valor) AS total_promocao
fROM clientes_promo_jumpflix 
	   GROUP BY codigo_promocional
       HAVING SUM(valor) >= (SELECT 
								AVG(valor_desconto) 
							FROM descricao_promo_jumpflix
								WHERE codigo_promocional like '%2024%'
									and tipo_desconto = 'valor_fixo');		
    
-- Dados full quer dizer todas 

-- Usando Limit       
  
SELECT 
     *
FROM
    jumpflix_especificacoes
LIMIT 10;

-- Verificando a coluna com 88 registros eu quero fazer uma média da pontuação
SELECT 
    count(*)
FROM
    jumpflix_especificacoes;
    
SELECT 
    avg(pontuacao)
FROM jumpflix_especificacoes
	where pontuacao > 7;
	
SELECT 
    pontuacao,
    count(*)
FROM jumpflix_especificacoes
	group by pontuacao
    order by pontuacao;
    
    
select 
		genero,
        pontuacao
from (select 
     *
from jumpflix_especificacoes
	   where pontuacao > 7) as a ;


-- Subconsulta FROM
/*Pensando na otimização da query, faça uma consulta na tabela 'jumpflix_filmes'. 
A consulta deverá ser feita nesta tabela reduzida, tendo todas as colunas, porém filtrando apenas 
os filmes com duração de uma hora. Nesta tabela reduzida, faça a consulta do nome e da data de lançamento e crie uma coluna chamada 'menor_maior_idade', 
onde serão tratadas as idades. Caso tenha menos de 18 anos, será considerado menor de idade; caso contrário, será considerado maior de idade.*/
select * from jumpflix_filmes;


SELECT 
   *
FROM jumpflix_filmes
    where tempo = '60 min';
    

 SELECT 
    nome,
    data_lancamento,
    CASE
        WHEN classificacao_indicativa < 18 THEN 'menor de idade'
        ELSE 'maior de idade'
    END AS menor_maior_idade
FROM
    (SELECT 
        *
    FROM jumpflix_filmes
    WHERE tempo = '60 min') AS tabela_reduzida;
        
  -- exemplo aluno
  
SELECT 
    *
FROM (SELECT 
    nome,
    data_lancamento,
    tempo,
    CASE
        WHEN classificacao_indicativa < 18 THEN 'menor de idade'
        ELSE 'maior de idade'
    END AS menor_maior_idade
FROM
    jumpflix_filmes) as tabela_reduzida
where tempo = '60 min';