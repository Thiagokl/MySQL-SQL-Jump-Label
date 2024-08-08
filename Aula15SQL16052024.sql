-- Aula 15

-- HORA EXERCITAR	

	/*Escreva uma consulta SQL que retorne o país do cliente, a quantidade de promoções vendidas
e o valor_desconto dessas promoções. Se o valor do desconto para uma promoção específica estiver 
disponível na tabela descricao_promo_jumpflix, use esse valor. Caso contrário, use o valor da 
tabela clientes_promo_jumpflix.*/

SELECT * FROM clientes_promo_jumpflix;
SELECT * FROM descricao_promo_jumpflix;

-- Principal resultado igual professor COM  LEFT JOIN
-- Usei a função Coalesce para buscar o valor do desconto e caso não tenha busque o valor original renomeando a coluna VALOR
SELECT 
    T1.pais,
    T1.quantidade,
    COALESCE(T2.valor_desconto, T1.valor) AS VALOR
FROM clientes_promo_jumpflix T1
	LEFT JOIN descricao_promo_jumpflix T2 
		ON T1.codigo_promocional = T2.codigo_promocional;
        

-- Resolução teste 1 tudo que se repete nas duas tabelas
SELECT 
    T1.pais,
    T1.quantidade,
    COALESCE(T2.valor_desconto, T1.valor) AS VALOR
FROM clientes_promo_jumpflix T1
	INNER JOIN descricao_promo_jumpflix T2 
		ON T1.codigo_promocional = T2.codigo_promocional;


-- Resolução teste 2 nos trouxe tudo 'UNION ALL COM duplicados'

SELECT 
    T1.pais,
    T1.quantidade,
    COALESCE(T2.valor_desconto, T1.valor) AS VALOR
FROM clientes_promo_jumpflix T1
	LEFT JOIN descricao_promo_jumpflix T2 
		ON T1.codigo_promocional = T2.codigo_promocional
	UNION ALL
SELECT 
    T1.pais,
    T1.quantidade,
    COALESCE(T2.valor_desconto, T1.valor) AS VALOR
FROM clientes_promo_jumpflix T1
	RIGHT JOIN descricao_promo_jumpflix T2 
		ON T1.codigo_promocional = T2.codigo_promocional;
		
-- Resolução teste 3 nos trouxe tudo 'UNION SEM duplicados'

SELECT 
    T1.pais,
    T1.quantidade,
    COALESCE(T2.valor_desconto, T1.valor) AS VALOR
FROM clientes_promo_jumpflix T1
	LEFT JOIN descricao_promo_jumpflix T2 
		ON T1.codigo_promocional = T2.codigo_promocional
	UNION 
SELECT 
    T1.pais,
    T1.quantidade,
    COALESCE(T2.valor_desconto, T1.valor) AS VALOR
FROM clientes_promo_jumpflix T1
	RIGHT JOIN descricao_promo_jumpflix T2 
		ON T1.codigo_promocional = T2.codigo_promocional;
		 


/*A Jumpflix é uma popular plataforma de streaming de filmes e séries. 
Eles frequentemente oferecem promoções especiais para seus clientes em 
diferentes países. As informações sobre essas promoções são armazenadas em três tabelas: 
descricao_promo_jumpflix, promocao_jumpflix e clientes_promo_jumpflix.
Escreva uma consulta SQL que retorne o tipo de desconto, 
as condições da promoção, o título e a descrição da promoção, e o país do cliente.*/
-- tipo_desconto, condicoes descricao_promo_jumpflix, \titulo, descricao- promocao_jumpflix\, pais - clientes_promo_jumpflix

select * from descricao_promo_jumpflix;
select * from promocao_jumpflix ;
select * from clientes_promo_jumpflix;


select 
		T1.tipo_desconto,
        T1.condicoes,
		T2.titulo,
        T2.descricao,
		T3.pais
from descricao_promo_jumpflix T1
	LEFT JOIN promocao_jumpflix T2
		ON T1.id_promocao = T2.id_promocao
    LEFT JOIN clientes_promo_jumpflix T3
		ON T1.codigo_promocional = T3.codigo_promocional;
    
/* Para essa consulta você precisa analisar o TOTAL DE VOTOS que cada GÊNERO de filme recebeu por ANO e 
por CLASSIFICAÇÃO INDICATIVA, 
mas estamos interessados apenas nos filmes que têm uma PONTUAÇÃO MAIOR QUE 8 e que são dos GÊNEROS ‘Ação’, ‘Animação’ ou ‘Drama’.
Escreva uma consulta SQL que retorne o gênero do filme, a classificação indicativa, o ano de lançamento 
e o total de votos que cada combinação de gênero, classificação indicativa e ano recebeu. 
usando as tabelas jumpflix_filmes, jumpflix_especificacoes*/

SELECT * FROM jumpflix_filmes;
SELECT * FROM  jumpflix_especificacoes;

select 
	T2.genero,
    T1.classificacao_indicativa,
    YEAR(T1.data_lancamento) ano,
    SUM(REPLACE(T2.votos, ',', '')) total_votos
from jumpflix_filmes T1
	left join jumpflix_especificacoes T2
		on T1.id_index = T2.id_index
 where T2.pontuacao > 8
  and (T2.genero like '%Ação%'
	  OR T2.genero like '%Animação%'
	  OR T2.genero like '%Drama%')
 group by T2.genero, T1.classificacao_indicativa, YEAR(T1.data_lancamento);
 
SELECT 
		B.genero, 
		A.classificacao_indicativa, 
		YEAR(A.data_lancamento) AS ano_lancamento, -- Somente o ano
		SUM(REPLACE(B.votos, ',', '')) AS total_votos -- Somar as colunas de votos por gênero e tirar as virgulas para que fique números inteiros
FROM jumpflix_filmes A
        LEFT JOIN jumpflix_especificacoes B 
			ON A.id_index = B.id_index
WHERE B.pontuacao > 8
        AND (B.genero like "%Ação%" 
        OR B.genero like "%Animação%"
        OR B.genero like "%Drama%")
GROUP BY B.genero , A.classificacao_indicativa , YEAR(A.data_lancamento);

        
  -- Exemplo professor  
    select 
	je.genero,
    jf.classificacao_indicativa,
    YEAR(jf.data_lancamento) ano_lancamento,
    SUM(REPLACE(je.votos, ',', '')) total_votos
from jumpflix_filmes jf
	left join jumpflix_especificacoes je
		on jf.id_index = je.id_index
 where je.pontuacao > 8
  and (je.genero like '%Ação%'
	  OR je.genero like '%Animação%'
	  OR je.genero like '%Drama%')
 group by je.genero, jf.classificacao_indicativa, YEAR(jf.data_lancamento) ;
 

CREATE OR REPLACE VIEW teste AS
    SELECT 
        REPLACE(votos, ',', '') votos
    FROM
        jumpflix_especificacoes;
        
	describe teste;
    
    
    /* Seu objetivo é escrever uma consulta SQL que nos ajude a analisar as promoções
    oferecidas pela jumpflix.
    Queremos saber qual o codigo promocional, tipo de desconto, 
    o valor do desconto, o valor da promocao e a duracao da promocao em dias.
    Escreva uma consulta SQL que retone o codigo promocional, o tipo de desconto, 
    o valor do desconto, o valor da promocao e a duracao da promocao em dias. 
    usar as tabelas promocao_jumpflix e descricao_promo_jumpflix*/

SELECT * FROM promocao_jumpflix;
SELECT * FROM descricao_promo_jumpflix;


     
SELECT 
    T1.codigo_promocional,
    T1.tipo_desconto,
    T1.valor_desconto AS valor_promocao,
    (DATEDIFF(T2.data_fim, T2.data_inicio)) AS promocao_em_dias
FROM descricao_promo_jumpflix T1
        LEFT JOIN promocao_jumpflix T2 
			ON T1.id_promocao = T2.id_promocao
WHERE valor_desconto 
	AND(DATEDIFF(T2.data_fim, T2.data_inicio))
    ORDER BY promocao_em_dias;
    
    
 -- Exemplo com as colunas valor desconto e valor promoção   
 
SELECT 
    T1.codigo_promocional,
    T1.tipo_desconto,
    T1.valor_desconto,
    T1.valor_desconto AS valor_promocao,
    DATEDIFF(T2.data_fim, T2.data_inicio) AS promocao_em_dias
FROM descricao_promo_jumpflix T1
        LEFT JOIN promocao_jumpflix T2 
		ON T1.id_promocao = T2.id_promocao
ORDER BY promocao_em_dias;