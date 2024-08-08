-- Aula 17 
-- subselect
SELECT * FROM tabela_pokemon;


    
SELECT
		type1,
		AVG(TOTAL) as total
FROM tabela_pokemon
	WHERE type1 = 'Grass'
	GROUP BY type1;
    
 SELECT
		type1,
		AVG(TOTAL) as total
FROM tabela_pokemon
	GROUP BY type1;
    
    
SELECT
		name,
		type1,
        total,
		(
		select
			AVG(TOTAL) 
		FROM tabela_pokemon T2
				WHERE T2.type1 = T1.type1 
					) as media_total
		FROM tabela_pokemon T1;
			
            
            
SELECT 
    type1, AVG(TOTAL) AS total
FROM
    tabela_pokemon
GROUP BY type1;

SELECT * FROM tabela_pokemon;


SELECT
		type1,
        avg(attack)
FROM tabela_pokemon
group by type1;


	SELECT
		name,
		type1,
        attack
	FROM tabela_pokemon T1
        WHERE attack > (SELECT
							avg(attack)
						FROM tabela_pokemon T2
							WHERE T2.type1 = T1.type1); 
                            
                          
                            

	
   -- Exercício online
   
    /*Construa uma query que indentifica Pokemons com mesmo id e retorne somente os 
pokemons com mesmo id acima da media do total.*/

SELECT * FROM tabela_pokemon;


SELECT 		
        number,
        name,
        total
FROM  tabela_pokemon T1
WHERE number IN (SELECT 
					number
				FROM tabela_pokemon T1
						GROUP BY number
						HAVING COUNT(number) > 1
							AND total > (SELECT 
											AVG(total)
										FROM
											tabela_pokemon T2)
										);


    SELECT 		
			number,
			name,
			total
FROM  tabela_pokemon T1
where total > (
				SELECT 
                    AVG(total)
				FROM tabela_pokemon T2
					where T2.number = T1.number);
															
                                                                
 -- Correçao
 
 SELECT * FROM tabela_pokemon;
 
 
SELECT 		
		number,
        name,
		total
FROM  tabela_pokemon T1
	where total > (
					SELECT 
						AVG(total)
					FROM tabela_pokemon T2
						where T2.number = T1.number);
                            
 -- exemplo professor [19:44] Eryck de Noronha
select

	name,

    type1,

    attack,

   concat(floor(attack / (

	select

		avg(attack)

	from tabela_pokemon T2

		where T2.type1 = T1.type1

					) * 100), ' %') as porcentagem

from tabela_pokemon T1

	where attack > (

					select

						avg(attack)

					from tabela_pokemon T2

						where T2.type1 = T1.type1

					);                          
 /*Da tabela promocao_jumpflix selecione as colunas titulo e descrição, da tabela descricao_promo_jumpflix
traga a coluna valor_desconto sendo filtrado os valores acima da media de valor fixo e de porcentagem*/
                                                                
    SELECT * FROM promocao_jumpflix;                                                   
    SELECT * FROM descricao_promo_jumpflix;
    
SELECT 
    T1.titulo,
    T1.descricao,
    T2.valor_desconto
FROM promocao_jumpflix T1
	INNER JOIN descricao_promo_jumpflix T2 
		ON T1.id_promocao = T2.id_promocao
WHERE T2.valor_desconto > (SELECT 
                            AVG(valor_desconto)
                         FROM descricao_promo_jumpflix T3
                         WHERE 
                            tipo_desconto = 'valor_fixo' = tipo_desconto or 'porcentagem');
                            
SELECT 
    AVG(valor_desconto)
FROM
    descricao_promo_jumpflix
GROUP BY  valor_desconto;


SELECT 
	 T1.titulo,
     T1.descricao,
     T2.tipo_desconto,
     T2.valor_desconto
FROM promocao_jumpflix T1
	INNER JOIN descricao_promo_jumpflix T2 
		ON T1.id_promocao = T2.id_promocao
WHERE T2.valor_desconto > ( SELECT 
								AVG(valor_desconto)
						 FROM descricao_promo_jumpflix T3
							WHERE T3.tipo_desconto = T2.tipo_desconto);
                            
-- correção Professor

select * from descricao_promo_jumpflix;
select * from promocao_jumpflix;
 
/* SUB.CONSULTA.TESTE
SELECT 
	tipo_desconto,
	AVG(valor_desconto) -- '9.464286'
FROM
	descricao_promo_jumpflix
group by tipo_desconto; -- 'valor_fixo', '3.611111'
						-- 'porcentagem', '20.000000'
*/
 
SELECT
    t1.titulo,
    t1.descricao,
    t2.tipo_desconto,
    t2.valor_desconto
FROM
    promocao_jumpflix t1
INNER JOIN descricao_promo_jumpflix t2
	on t1.id_promocao = t2.id_promocao
WHERE t2.valor_desconto > (
						SELECT 
							AVG(valor_desconto) -- '9.464286'
						FROM
							descricao_promo_jumpflix t3
						where t3.tipo_desconto = t2.tipo_desconto -- 'valor_fixo', '3.611111'
																  -- 'porcentagem', '20.000000'
                                                );
                                                
                                                
/*Monte um query com as colunas genero, pontuacao da tabela jumpflix_especificacoes
e a coluna nome da tabela jumpflix_filmes. Faça o INNER JOIN entre elas sendo que a tabela  jumpflix_filmes deverá estar contida em uma subconsulta com 
duas colunas:  id_index e nome, com apenas as classificações indicativas de 15  anos*/

-- Realizar com subconsulta dentro do join após filtrar com where classificação indicativa de 15 anos..


-- Case individual de apresentação vai estar na pasta 22/05 Quarta feira, apresentar no dia 01/06 no sabado 30 minutos para apresentar 

SELECT * FROM jumpflix_especificacoes;
SELECT * FROM jumpflix_filmes;

SELECT 
    T1.genero, 
    T1.pontuacao, 
    T2.nome 
FROM jumpflix_especificacoes T1
	INNER JOIN (
				SELECT 
					T2.id_index, 
					T2.nome 
				FROM 
					jumpflix_filmes T2
				WHERE 
					classificacao_indicativa = 15
			) T2 ON T1.id_index = T2.id_index;		
            
            
   -- Teste         
SELECT 
    T1.genero, 
    T1.pontuacao, 
    T2.nome 
FROM jumpflix_especificacoes T1
	INNER JOIN jumpflix_filmes T2
	 ON 
		T1.id_index = T2.id_index in (
									SELECT 
										T2.id_index, 
										T2.nome 
									FROM jumpflix_filmes T2
										WHERE 
											classificacao_indicativa = 15);
									