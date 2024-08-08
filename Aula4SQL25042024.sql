select distinct * from promocao_jumpflix;

describe promocao_jumpflix;

select  distinct
         titulo      
from promocao_jumpflix;

select * from promocao_jumpflix;

SELECT DISTINCT
    titulo, descricao, data_inicio data_fim
FROM
    promocao_jumpflix;
    
    select * from jumpflix_filmes;
    
   SELECT 
    nome, data_lancamento
FROM
    jumpflix_filmes;
    
    select * from clientes_promo_jumpflix;
    
    select distinct
			pais
	from
    clientes_promo_jumpflix;
    
     select distinct
			pais,
			pais as 'pais_unico'
	from
    clientes_promo_jumpflix;
    
    select 2 * 3 as multiplicar;
    
    select nome,
           '' as campo_obri,
           'app' as canal
	from jumpflix_filmes;
    
    select nome,
           6 as campo_obri,
           'TV' as canal
	from jumpflix_filmes;
    
    -- Hora de exercitar
    
/* Exercício 1
Cálculo taxa de desconto
Na tabela descricao_promo_jumpflix os valores fixos na coluna valor_desconto
devem ser analisados para um desconto de 2%, pois correspondem às taxas a serem pagas pela publicidade.
Monte uma query para exibir a coluna valor_desconto, e a coluna desconto_2 
para representar o valor de 2% aplicado sobre o valor_desconto. */

SELECT valor_desconto
FROM descricao_promo_jumpflix;

 SELECT valor_desconto,
        valor_desconto * 0.02 AS desconto_2 -- multiplique valor_desconto por 2% converta em 0.02 crie nova coluna com Alies AS desconto_2
 FROM descricao_promo_jumpflix; -- chame a tabela na qual está a coluna que iremos calcular o desconto de 2% (0.02).
    
	/* Exercício 2
Correlação de faixa etária de idades
Na tabela jumpflix_filmes a classificação de faixa etária teve uma nova regra
e todos os produtos deverão diminuir um ano na classificação indicativa.
Crie uma nova coluna com os novos valores. Exiba na consulta final as colunas nome,
classificacao_indicativa e uma coluna de classificacao_indicativa_nova representando 
essa atualizacao de um ano a menos */
     
    select * from jumpflix_filmes;
    
    select  nome, 
            classificacao_indicativa,
            classificacao_indicativa - 1 as  classificacao_indicativa_nova -- diminuir um ano na classificação indicativa
    from jumpflix_filmes;
    
       
     SELECT nome,
			data_lancamento,
            tempo
FROM jumpflix_filmes
WHERE tempo = '60 min';
    
SELECT * FROM
promocao_jumpflix
where id_promocao = '2';    
    
select 
    * 
from jumpflix_especificacoes
where pontuacao > 8.5;



    