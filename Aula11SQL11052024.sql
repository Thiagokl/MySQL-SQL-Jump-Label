-- Aula 12

-- CRIAÇÃO DE VIEW ELA NÃO É CRIADA NO BANCO DE DADOS NÃO SUBSCREVE A VIEW, USAR CREATE OR REPLACE VIEW

CREATE VIEW TABELA_TESTE AS
	SELECT *,
			CASE
				WHEN classificacao_indicativa < 18 THEN 'MENOR_IDADE'
			ELSE 'MAIOR_IDADE'
		END TESTE
	FROM jumpflix_filmes;
			
SELECT 
  * 
FROM tabela_teste
	WHERE TESTE = 'MENOR';
    
    
    CREATE OR REPLACE VIEW TABELA_TESTE AS
	SELECT *,
			CASE
				WHEN classificacao_indicativa < 18 THEN 'MENOR_IDADE'
			ELSE 'MAIOR_IDADE'
		END TESTE
	FROM jumpflix_filmes;
			
SELECT 
  * 
FROM tabela_teste
	WHERE TESTE = 'MENOR_IDADE';
 
 
 
CREATE OR REPLACE VIEW datas_promocoes AS
		SELECT 
               *,
                DAY(data_inicio) AS DIA,
                MONTH(data_inicio) AS MES,
                YEAR(data_inicio) AS ANO
		FROM promocao_jumpflix;
        
    SELECT * FROM promocao_jumpflix;
        
        
	-- Crie uma view promocoes com a coluna titulo e cria uma coluna tipo_promocao verificando a coluna titulo. 
    -- Se tiver a palavra Promoção então na nova coluna virá Promoção e caso na coluna titulo tenha a palavra Oferta 
    -- então na nova coluna virá Oferta. Caso contrário escreva Definir.
    
CREATE OR REPLACE VIEW promocoes AS
    SELECT 
        titulo,
        CASE
            WHEN titulo LIKE '%Promoção%' THEN 'Promoção'
            WHEN titulo LIKE '%Oferta%' THEN 'Oferta'
            ELSE 'Definir'
        END AS tipo_promocao
    FROM
        promocao_jumpflix;

SELECT * FROM promocoes;

-- Unir tabelas Union União e comparaçã union não puxa os duplicados e outer union

/*coloque em uma única consulta os códigos promocionais
 das tabelas cliente_promo_jumpflix e descricao_promo_jumpflix */
 
 SELECT 
    codigo_promocional
FROM
    clientes_promo_jumpflix 
UNION ALL SELECT codigo_promocional descricao_promo_jumpflix;

/*Crie duas tabelas temporárias utilizando a tabela clientes_promo_jumpflix. 
A primeira deverá ter todas as colunas, limitadas a 5 linhas 'limit', sendo ordenadas em ordem decrescente a coluna quantidade, 
com o nome clientes_promo_top5. A segunda tabela terá a mesma estrutura; entretanto, será ordenada em ordem crescente, 
também limitada a cinco registros, com o nome clientes_promo_menos5. Com as duas tabelas temporárias criadas, faça o UNION ALL.*/

CREATE VIEW clientes_promo_top5 AS
			(SELECT * 
            FROM clientes_promo_jumpflix
				ORDER BY quantidade DESC
					LIMIT 5);

CREATE VIEW clientes_promo_menos5 AS
		(SELECT * 
        FROM clientes_promo_jumpflix
			ORDER BY quantidade ASC
				LIMIT 5);
                
SELECT 
    *
FROM
    clientes_promo_top5 
UNION ALL SELECT 
    *
FROM
    clientes_promo_menos5;


select * from clientes_promo_top5;
select * from  clientes_promo_menos5;

CREATE OR REPLACE VIEW clientes_promo_top5 AS
			SELECT * 
            FROM clientes_promo_jumpflix
				ORDER BY quantidade DESC
					LIMIT 5;
                    
CREATE OR REPLACE VIEW clientes_promo_menos5 AS
		SELECT * 
        FROM clientes_promo_jumpflix
			ORDER BY quantidade ASC
				LIMIT 5;

	SELECT 
    *
FROM
    clientes_promo_top5 
UNION ALL SELECT 
    *
FROM
    clientes_promo_menos5;


SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS teste_join;
CREATE SCHEMA teste_join;
USE teste_join;

CREATE TABLE TABELA_ALUNOS (
    ID_ALUNO INT PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    SEXO ENUM('M','F'),
    IDADE INT NOT NULL
);

INSERT INTO TABELA_ALUNOS(ID_ALUNO, NOME, SEXO, IDADE) 
VALUES 
(1, 'João da Silva', 'M', 14),
(2, 'Paulo Antônio', 'M', 13),
(3, 'Maria dos Santos', 'F', 16),
(4, 'Fernanda Madeira', 'F', 13),
(5, 'Paula Aguiar', 'F', 17);


CREATE TABLE TABELA_SALAS(
    ID_SALA CHAR(5) PRIMARY KEY,
    ID_ALUNO INT,
    ANDAR VARCHAR(255),
    SALA CHAR(10)
);

INSERT INTO TABELA_SALAS(ID_SALA, ID_ALUNO, ANDAR, SALA) 
VALUES 
('A1', 2, '1º PRIMEIRO ANDAR', 1001),
('A2', 3, '2º SEGUNDO ANDAR', 2001),
('A3', 1, '1º PRIMEIRO ANDAR', 1002),
('B1', 7, '3º TERCEIRO ANDAR', 3002),
('B2', NULL, '1º SEGUNDO ANDAR', 2002),
('B3', 5, '3º TERCEIRO ANDAR', 3001);

SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

-- 1 resultado todos os alunos de todas as salas,
-- Inner joinn irá trazer somente o que possui nas duas tabelas o met nos dois, intercessão - juntos, relação...
-- A tabela do from e a tabela da esquerda 'LEFT' não é ordem de criação e sim a ordem que ela é chamada no exemplo será a tab alunos
-- FROM permanece o JOIN enriquece
-- RIGTH direita o contrario do LEFT,

SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

select 
		T1.ID_ALUNO,
        T1.NOME,
        T2.SALA
from tabela_alunos T1
	inner join tabela_salas T2
		ON T1.ID_ALUNO=T2.ID_ALUNO;
    
 -- No geral usa mais o LEFT todas as informações da tabela principal e na segunda tabela pode filtrar para verificar o que está faltando   
select 
		T1.ID_ALUNO,
        T1.NOME,
        T2.SALA
from tabela_alunos T1
	left join tabela_salas T2
		ON T1.ID_ALUNO=T2.ID_ALUNO;
    
SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

select 
		T1.ID_ALUNO,
        T1.NOME,
        T2.SALA
from tabela_salas T2
	left join tabela_alunos T1
		ON T1.ID_ALUNO=T2.ID_ALUNO;
    
-- pouco usado pois no LEFT podemos alterar o que está no FROM e no JOIN    
select 
		T1.ID_ALUNO,
        T1.NOME,
        T2.SALA
from tabela_salas T2
	right join tabela_alunos T1
		ON T1.ID_ALUNO=T2.ID_ALUNO;
        
     -- Full join juntar tudo independente de ter dados ou não, usa LEFT UNION RIGHT para fazer o UNION

select 
		T1.ID_ALUNO,
        T1.NOME,
        T2.SALA
from tabela_salas T2
	left join tabela_alunos T1
		ON T1.ID_ALUNO=T2.ID_ALUNO
Union 
select 
		T1.ID_ALUNO,
        T1.NOME,
        T2.SALA
from tabela_salas T2
	right join tabela_alunos T1
		ON T1.ID_ALUNO=T2.ID_ALUNO
	ORDER BY ID_ALUNO;