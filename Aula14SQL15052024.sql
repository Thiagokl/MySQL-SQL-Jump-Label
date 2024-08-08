-- Aula 14

-- referente ao comando full join uniao left com right no  mysql não tem o full 


  /* 09)Gerar uma tabela com o nome, idade e sala, contendo todos os registros, para possibilitar a 
   análise de alunos sem sala ou sala sem alunos na mesma tabela.*/

SELECT 
		T1.NOME,
        T1.IDADE,
        T2.SALA
 FROM tabela_alunos T1
	LEFT JOIN tabela_salas T2
		ON T1.ID_ALUNO = T2.ID_ALUNO
	UNION ALL
SELECT 	T1.NOME,
        T1.IDADE,
        T2.SALA
 FROM tabela_alunos T1
	RIGHT JOIN tabela_salas T2
		ON T1.ID_ALUNO = T2.ID_ALUNO;

SELECT 
		T1.NOME,
        T1.IDADE,
        T2.SALA
 FROM tabela_alunos T1
	LEFT JOIN tabela_salas T2
		ON T1.ID_ALUNO = T2.ID_ALUNO
	UNION 
SELECT 	T1.NOME,
        T1.IDADE,
        T2.SALA
 FROM tabela_alunos T1
	RIGHT JOIN tabela_salas T2
		ON T1.ID_ALUNO = T2.ID_ALUNO;
        
        
/*Nos campos com dados dos alunos, onde estiver escrito NULL, foi solicitado que o campo permaneça vazio. 
Na coluna SALA, onde estiver NULL,  deve-se inserir ‘CADASTRAR SALA’.*/
SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

    
SELECT 
    IFNULL(t1.ID_ALUNO, '') AS ID_ALUNO,
    IFNULL(t1.NOME, '') AS Nome_Aluno,
    IFNULL(t1.IDADE, '') AS Idade,
    IFNULL(t2.SALA, 'CADASTRAR SALA') AS Sala
FROM TABELA_ALUNOS t1
	LEFT JOIN TABELA_SALAS t2 
		ON t1.ID_ALUNO = t2.ID_ALUNO
 
	UNION
 
SELECT
    IFNULL(t1.ID_ALUNO, '') AS ID,
    IFNULL(t1.NOME, '') AS Nome,
    IFNULL(t1.IDADE, '') AS Idade,
    IFNULL(t2.SALA, 'CADASTRAR SALA') AS Sala
FROM TABELA_ALUNOS t1
	RIGHT JOIN TABELA_SALAS t2
		ON t1.ID_ALUNO = t2.ID_ALUNO;


	
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
    
/* Para essa consulta você precisa analisar o total de votos que cada gênero de filme recebeu por ano e 
por classificação indicativa, 
mas estamos interessados apenas nos filmes que têm uma pontuação maior que 8 e que são dos gêneros 
‘Ação’, ‘Animação’ ou ‘Drama’.
Escreva uma consulta SQL que retorne o gênero do filme, a classificação indicativa, o ano de lançamento 
e o total de votos que cada combinação de gênero, classificação indicativa e ano recebeu. 
usando as tabelas jumpflix_filmes, jumpflix_especificacoes*/

SELECT * FROM jumpflix_filmes;
SELECT * FROM  jumpflix_especificacoes;


SELECT 
		COUNT(*) AS total_votos,
		B.genero,
		A.classificacao_indicativa,
		YEAR(A.data_lancamento) AS ano_lancamento
FROM jumpflix_filmes A
        INNER JOIN jumpflix_especificacoes B 
			ON A.id_index = B.id_index
WHERE B.genero IN ('Ação' , 'Animação', 'Drama')
        AND B.pontuacao > 8
GROUP BY B.genero , A.classificacao_indicativa , YEAR(A.data_lancamento);

-- outro exemplo com LEFT
SELECT 
		COUNT(*) AS total_votos,
		B.genero,
		A.classificacao_indicativa,
		YEAR(A.data_lancamento) AS ano_lancamento
FROM jumpflix_filmes A
        LEFT JOIN jumpflix_especificacoes B 
			ON A.id_index = B.id_index
WHERE B.genero IN ('Ação' , 'Animação', 'Drama')
        AND B.pontuacao > 8
GROUP BY B.genero , A.classificacao_indicativa , YEAR(A.data_lancamento);


select 
	T1.genero,
    T2.classificacao_indicativa,
    year(T2.data_lancamento) as ano,
    sum(replace(T1.votos,',',''))as votos
from jumpflix_especificacoes T1
	left join jumpflix_filmes T2
		on T1.id_index = T2.id_index
	where T1.pontuacao > 8
		and (genero like "%Ação%" 
        or genero like "%Drama%" 
        or '%Animação%')
	group by genero, 
		classificacao_indicativa,
		year(T2.data_lancamento)
    order by genero;
    
    
    
    select 
	T1.genero,
    T2.classificacao_indicativa,
    year(T2.data_lancamento) as ano,
    sum(replace(T1.votos,',',''))as votos
from jumpflix_especificacoes T1
	left join jumpflix_filmes T2
		on T1.id_index = T2.id_index
	where T1.pontuacao > 8
		and (genero like "%Ação%" 
        or genero like "%Drama%" 
        or '%Animação%')
	group by genero, 
		classificacao_indicativa,
		year(T2.data_lancamento)
    order by genero;