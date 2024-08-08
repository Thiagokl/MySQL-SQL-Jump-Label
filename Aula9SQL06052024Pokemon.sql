-- Exercício 15

-- https://www.kaggle.com/datasets/jaidalmotra/pokemon-dicas/data

 -- Drop schema if exists dados_pokemon;
--  create schema dados_pokemon;
 -- use dados_pokemon;

-- Banco criado na importação sendo ajustado
Drop table tabela_pokemon;

CREATE TABLE tabela_pokemon (
    number INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    type1 VARCHAR(50) NOT NULL,
    type2 VARCHAR(50) NOT NULL,
    total INT,
    hp INT,
    attack INT,
    defense INT,
    sp_attack INT,
    sp_defense INT,
    speed INT,
    generation INT,
    legendary VARCHAR(5) NOT NULL
);


-- Exercício 16:

-- A Tabela Pokémon possui dados duplicados desnecessários?
-- Existem inconsistências nos dados, como nomes fora do lugar ou sem coerência com o nome da coluna, espaços nulos ou vazios, etc?
-- Identificou algo para corrigir? Qual solução encontrou?
-- Com os dados presentes na tabela Pokémon, demonstre um levantamento com uma análise nos dados.

SELECT * FROM tabela_pokemon;

select 
       number,
       row_number() over (partition by number order by total) as nivel_evolucao,
       name, 
       total
   from tabela_pokemon;


--  criação dat tabela foi realizada na importação para otimizar o Banco iremos alterar os tipos na colunas abaixo:

	ALTER TABLE tabela_pokemon
		MODIFY COLUMN  number INT NOT NULL,
       	MODIFY COLUMN name VARCHAR(255) NOT NULL,
		MODIFY COLUMN type1 VARCHAR(50) NOT NULL,
		MODIFY COLUMN type2 VARCHAR(50) NOT NULL,
		MODIFY COLUMN legendary VARCHAR(5) NOT NULL;

describe tabela_pokemon;

-- A Tabela Pokémon possui dados duplicados desnecessários?
-- não tem dados desnecessários

SELECT * FROM tabela_pokemon;

-- Essa query está retornando 498 espaços vazios porque está contando quantas vezes a coluna type2 da tabela_pokemon possui valores vazios 
-- Ao utilizar o DISTINCT nessa query, você está garantindo que não haverá repetições dos valores encontrados no campo type2 quando estiver vazio
SELECT DISTINCT 
    count(type2) AS Espaco_vazio
FROM
    tabela_pokemon
Where type2 = '';

-- Verificando espaços vazios sem distinct

SELECT 
		COUNT(*) AS espaco_vazio
FROM tabela_pokemon
		WHERE type2 = '';
 
SELECT 
    *
FROM
    tabela_pokemon
ORDER BY number;


SELECT 
    name, COUNT(*) AS Total
FROM
    tabela_pokemon
GROUP BY name
HAVING COUNT(*) > 1;

-- Erick

SELECT 
        number,
		COUNT(*) 
FROM
		tabela_pokemon
	group by number
    order by count(*) desc;
  

-- Existem inconsistências nos dados, como nomes fora do lugar ou sem coerência com o nome da coluna, espaços nulos ou vazios, etc?
-- Sim, existem e serão regularizadas na query. Com a utilização dos filtros WHERE, OR e IS NULL adicionando condições = ''  
SELECT * FROM tabela_pokemon;


  /* Identificou algo para corrigir? Qual solução encontrou?
Solução conforme query abaixo */

describe tabela_pokemon;

	SELECT 
		*
	FROM
		tabela_pokemon
	WHERE
		name = '' OR name IS NULL 
			OR type1 = ''
			OR type1 IS NULL
			OR type2 = ''
			OR type2 IS NULL;
            
			  
-- Com os dados presentes na tabela Pokémon, demonstre um levantamento com uma análise nos dados.
    
	SELECT 
		*
	FROM
		tabela_pokemon;

-- Quantos pokemons temos, 1072.

	SELECT 
		COUNT(*) AS Total_Pokemons
	FROM
		tabela_pokemon;

    
-- Estamos contando a quantidade de tipos de pokemon.

	SELECT type1,
		   type2,
		   COUNT(*) as Tipos_Pokemon 
	FROM 
		tabela_pokemon
		 GROUP BY type1, type2;
		 
-- Medias dos atributos dos Pokemons - Calcular a média usando dados individuais.

 SELECT 
    AVG(hp) AS Média_Vida,
    AVG(attack) AS Média_Ataque,
    AVG(defense) AS Média_Defesa,
    AVG(sp_attack) AS Média_Ataque_Especial,
    AVG(sp_defense) AS Média_Defesa_Especial,
    AVG(speed) AS Média_Velocidade,
    Avg (total) As Maior_Poder
FROM
    tabela_pokemon;
  


--  10 Pokemons com os maiores totais de poderes 

	SELECT 
	*
	FROM 
		tabela_pokemon 
	ORDER BY 
		total DESC, 
		hp DESC, 
		attack DESC, 
		defense DESC, 
		sp_attack DESC, 
		sp_defense DESC, 
		speed DESC 
	LIMIT 
		10;
		
	  
-- Pokemon com maior poder pela média

    SELECT name AS nome,
		 ROUND((AVG(hp))) AS Média_Vida,
		 ROUND((AVG(attack))) AS Média_Ataque,
		 ROUND((AVG(defense))) AS Média_Defesa,
		 ROUND((AVG(sp_attack))) AS Média_Ataque_Especial,
		 ROUND((AVG(sp_defense))) AS Média_Defesa_Especial,
		 ROUND((AVG(speed))) AS Média_Velocidade, 
         ROUND((Avg (total))) AS Melhores_Pokemons
	FROM tabela_pokemon
		 WHERE total > 600
		 GROUP BY name
		 ORDER BY total desc;
         
         
 -- Exemplo Aluno
 
 SELECT 
    legendary,
    COUNT(*) AS total,
    ROUND(AVG(hp), 2) AS media_hp,
    ROUND(MIN(hp), 2) AS min_hp,
    ROUND(MAX(hp), 2) AS max_hp,
    ROUND(STDDEV(hp), 2) AS std_dev_hp,
    ROUND(AVG(attack), 2) AS media_attack,
    ROUND(MIN(attack), 2) AS min_attack,
    ROUND(MAX(attack), 2) AS max_attack,
    ROUND(STDDEV(attack), 2) AS std_dev_attack,
    ROUND(AVG(defense), 2) AS media_defense,
    ROUND(MIN(defense), 2) AS min_defense,
    ROUND(MAX(defense), 2) AS max_defense,
    ROUND(STDDEV(defense), 2) AS std_dev_defense,
    ROUND(AVG(speed), 2) AS media_speed,
    ROUND(MIN(speed), 2) AS min_speed,
    ROUND(MAX(speed), 2) AS max_speed,
    ROUND(STDDEV(speed), 2) AS std_dev_speed
FROM
    tabela_pokemon
GROUP BY legendary;

-- Exemplo Aluno

SELECT 
	name,
    total,
		CASE 
			WHEN total < 380 THEN 'Força baixa'
			WHEN total < 581 THEN 'Força média'
			WHEN total < 750 THEN 'Força Forte'
			ELSE 'Muito Forte'
	END AS forca
FROM 
    tabela_pokemon;
         
-- Atualizando os dados vazios para nulos
update tabela_pokemon
set type2 = case when type2 = '' then null else type2 END;


-- uso CASE WHEN, THEN
SELECT * FROM tabela_pokemon;

SELECT 
     type2,
     CASE
		WHEN type2 = '' THEN 'Não tem'
        ELSE type2
	 END AS type2_novo
FROM 
    tabela_pokemon;
    
    
    
SELECT 
    number,
    name,
    CASE
        WHEN type1 = 'graass' THEN 'grass'
        WHEN type1 = 'blastolse' THEN 'water'
        ELSE type1
    END AS type1,
    type2
FROM
    tabela_pokemon;
    
    
    
-- Exercício

-- Tratar a coluna type1:
-- Fire = Fogo
-- Water = Água

SELECT * FROM tabela_pokemon;

SELECT 
    type1,
    CASE
        WHEN type1 = 'Fire' THEN 'Fogo'
        WHEN type1 = 'Water' THEN 'Água'
        ELSE type1 -- retornando os demais tipos da coluna 
    END AS type1_novo
FROM
    tabela_pokemon;