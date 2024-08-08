-- Aula 13

USE teste_join;

SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

SELECT 
	*
FROM tabela_alunos T1
	LEFT join tabela_salas T2
		ON T1.ID_ALUNO = T2.ID_ALUNO;
        
SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

SELECT 
	*
FROM tabela_alunos T1
	inner join tabela_salas T2
		ON T1.ID_ALUNO = T2.ID_ALUNO;
        
        
-- 01) QUAIS DADOS DA tabela alunos NÃO TEM RELAÇÃO COM A tabela sala

SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

-- Resultado está trazendo aluna que não está na tabela 2, trazendo os nulos também
SELECT 
    *
FROM tabela_alunos T1
	LEFT JOIN  tabela_salas T2 
		ON T1.ID_ALUNO = T2.ID_ALUNO
WHERE T2.ID_ALUNO IS NULL;

-- 02) QUAIS DADOS DA TABELA SALA NÃO TEM RELAÇÃO COM A TABELA ALUNOS

/*A tabela que constar no FROM deixaremos com apelino T1, 
 o resultado nos trouxe os dados da tabela sala que não estavam presentes na tabela alunos*/
 
SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;
        
SELECT 
    *
FROM tabela_salas T1 
	LEFT JOIN tabela_alunos T2
		ON T1.ID_ALUNO = T2.ID_ALUNO
WHERE T2.ID_ALUNO IS NULL;


-- 03)
/*Gerar uma tabela com o nome dos alunos da tabela_alunos, andar e número da sala apenas para aqueles 
que estão cadastrados em salas tabela_salas.*/
 
SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

-- Correção

SELECT 
    T1.NOME,
    T2.ANDAR,
    T2.SALA
FROM tabela_alunos T1
	INNER JOIN  tabela_salas T2 
		ON T1.ID_ALUNO = T2.ID_ALUNO;
        
  -- Com Where 
  
 SELECT 
    T1.NOME,
    T2.ANDAR,
    T2.SALA
FROM tabela_alunos T1
	LEFT JOIN  tabela_salas T2 
		ON T1.ID_ALUNO = T2.ID_ALUNO
 WHERE 
		T2.ANDAR IS NOT NULL;
	
   -- feito com prof Erick ao vivo
  SELECT 
    T1.NOME,
    T2.ANDAR,
    T2.SALA
FROM tabela_alunos T1
	INNER JOIN  tabela_salas T2 
		ON T1.ID_ALUNO = T2.ID_ALUNO;

 
 
-- 04)
/*Faça um acompanhamento da quantidade de alunos cadastrados em salas tabela_salas, discriminados 
por sexo.*/

SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

SELECT 
		T1.SEXO,
		COUNT(*) AS quantidade_alunos
FROM tabela_alunos T1
	INNER JOIN tabela_salas T2 
    ON T1.ID_ALUNO = T2.ID_ALUNO
GROUP BY T1.SEXO;
    
-- 05)
/*Construir uma tabela com todos os alunos cadastrados na tabela de alunos, enriquecendo 
com as informação do andar da sala, caso esta esteja disponível para o aluno.*/
-- Informações da tabela alunos de sexo e idade não foram solicitadas trazer somente os dados necessários

SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

SELECT 
		T1.ID_ALUNO,
        T1.NOME,
        T2.ANDAR,
        T2.SALA
FROM tabela_alunos T1
LEFT JOIN tabela_salas T2
	ON T1.ID_ALUNO = T2.ID_ALUNO;

 
-- 06)
/* CONTINUAÇÃO DA 5  Construir uma tabela com todos os alunos cadastrados na tabela de alunos, enriquecendo 
 com as informação do andar da sala, caso esta esteja disponível para o aluno.*/
 
/* 06) Caso o aluno não esteja atribuído a um andar preencher o campo com CADASTRAR SALA.*/

SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

 -- teste
 SELECT IFNULL(NULL, 'CADASTRAR SALA') AS TESTE;
 SELECT ifnull(2, 'CADASTRAR SALA') as teste;
 
 SELECT 
		T1.ID_ALUNO,
        T1.NOME,
		IFNULL(T2.ANDAR, 'CADASTRAR ANDAR') AS ANDAR,
        IFNULL(T2.SALA, 'CADASTRAR SALA') AS SALA
FROM tabela_alunos T1
LEFT JOIN tabela_salas T2
    ON T1.ID_ALUNO = T2.ID_ALUNO;
    
SELECT 
		T1.*,
        iFNULL(T2.ANDAR, 'CADASTRAR ANDAR') AS ANDAR,
        IFNULL(T2.SALA, 'CADASTRAR SALA') AS SALA
FROM tabela_alunos T1
LEFT JOIN tabela_salas T2
    ON T1.ID_ALUNO = T2.ID_ALUNO;
    
     
      -- Exemplo Aluno com ajustes feitos Thiago

SELECT 
		T1.ID_ALUNO,
        T1.NOME,
	CASE 
        WHEN T2.ANDAR IS NULL THEN 'CADASTRAR ANDAR'
        ELSE T2.ANDAR
    END AS ANDAR,
    CASE 
        WHEN T2.SALA IS NULL THEN 'CADASTRAR SALA'
        ELSE T2.SALA
    END AS SALA
FROM tabela_alunos T1
	LEFT JOIN tabela_salas T2 
		ON T1.ID_ALUNO = T2.ID_ALUNO;
    
    
   -- 07)
/*Criar uma tabela que não necessariamente contenha o nome de todos os alunos, mas que inclua 
os dados de todos os andares e salas. */
 
SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

SELECT 
		IFNULL(T1.NOME, 'CADASTRAR ALUNO') AS NOME,
		T2.SALA,
		T2.ANDAR
FROM tabela_alunos T1
RIGHT JOIN Tabela_salas T2 
	ON T1.ID_ALUNO = T2.ID_ALUNO;
    
    -- 08)
/*Ajuste a query anterior para exibir apenas o nome e sala dos alunos com 16 anos ou mais. */
   
SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;
    
   SELECT 
		IFNULL(T1.NOME, 'CADASTRAR ALUNO') AS NOME,
		T2.SALA,
        T1.IDADE
FROM tabela_alunos T1
	RIGHT JOIN Tabela_salas T2 
		ON T1.ID_ALUNO = T2.ID_ALUNO
	WHERE T1.IDADE >= 16;