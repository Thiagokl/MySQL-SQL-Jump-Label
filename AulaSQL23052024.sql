-- Aula 19  23/05/2024

DROP SCHEMA IF EXISTS subconsultas;
CREATE SCHEMA subconsultas;
USE subconsultas;
 
CREATE TABLE alunos (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    genero CHAR(1),
    idade INT,
    curso VARCHAR(50)
);
 
CREATE TABLE notas (
    id INT PRIMARY KEY,
    nota DECIMAL(4, 2)
);
 
 
INSERT INTO alunos (id, nome, genero, idade, curso) VALUES
(1, 'Ana', 'F', 12, 'SQL'),
(2, 'Beatriz', 'F', 13,'Python' ),
(3, 'Carlos', 'M', 11, 'Python'),
(4, 'Daniel', 'M', 10,'SQL' );
 
INSERT INTO notas (id, nota) VALUES
(1, 8.5),
(2, 7.0),
(3, 9.0),
(4, 6.5),
(5, 8.0),
(6, 7.5),
(7, 8.5),
(8, 7.0);


SELECT * FROM alunos;
SELECT * FROM notas;

/* Alimentos preço ssbixo da media por filtro

alimento, tipo, preço,
banana, frura, 2,00
maça, fruta 2,00
batata, legume, 2,00
cenoura, legume, 2,00
*/

/*Construa uma query com as colunas nome, genero, idade da tabela alunos onde os alunos tenham 
idade acima da media por genero.*/

SELECT * FROM alunos;

SELECT
		genero,
		AVG(idade) as idade
FROM alunos 
GROUP BY genero;



SELECT
    a.nome,
    a.genero,
    a.idade
FROM alunos a
WHERE a.idade > (
    SELECT AVG(idade)
    FROM alunos b
    WHERE b.genero = a.genero
);


-- correção

SELECT
	genero,
    AVG(idade)
FROM alunos
GROUP BY genero;
 
-- 'F', '12.5000'
-- 'M', '10.5000'
 
SELECT 
	 nome, 
     genero,
     idade
FROM alunos A
WHERE idade > (SELECT
					AVG(idade)
				FROM alunos A_SUB
				WHERE A.genero = A_SUB.genero);

/*Construa uma query com as colunas nome, curso, idade da tabela alunos onde os alunos tenham idade 
abaixo da media por curso.*/

SELECT * FROM alunos;
SELECT * FROM notas;

	SELECT
			curso,
			AVG(idade) as media_idade
	FROM alunos 
	GROUP BY curso;

	SELECT
			a.nome,
			a.curso,
			a.idade
	FROM alunos a
	WHERE a.idade <  (
					SELECT 
							AVG(idade) media_idade
					FROM alunos suba
						WHERE a.curso = suba.curso
	);


-- correção

SELECT 
	tb_alunos.nome, 
    tb_alunos.curso,
    tb_alunos.idade
FROM alunos AS tb_alunos
WHERE idade < (
			  SELECT 
				AVG(sub_alunos.idade)
			  FROM alunos AS sub_alunos
			  WHERE tb_alunos.curso = sub_alunos.curso
			  );




/*Construa uma query com as colunas nome, genero da tabela alunos e nota da tabela notas onde os 
alunos tenham nota acima da media por genero.*/


SELECT * FROM alunos;
SELECT * FROM notas;

SELECT
		A.nome,
		A.genero,
        AVG(N.nota) AS media_nota
FROM alunos A
	LEFT JOIN notas N
		ON A.id = N.id
GROUP BY nota;
 
 -- Correção
SELECT 
		AL.genero, 
		AVG(N.nota) AS media_notas
FROM alunos AL	
	LEFT JOIN notas N 
		ON AL.id = N.id
        GROUP BY AL.genero;

SELECT 
    AL.nome, 
    AL.genero, 
    N.nota
FROM alunos AL
	LEFT JOIN notas N 
		ON AL.id = N.id
WHERE N.nota > (SELECT 
					AVG(nota)
				 FROM alunos ALU
					LEFT JOIN notas N2 
						ON ALU.id = N2.id
				WHERE ALU.genero = AL.genero)
					ORDER BY AL.genero;
-- Correção com aluno

SELECT 
        genero, 
        AVG(nota) AS media_por_genero
    FROM alunos a
    INNER JOIN notas n
    ON a.id = n.id
    GROUP BY genero;
   -- F	7.750000
   -- M7.750000
SELECT 
    a.nome, 
    a.genero,
    n.nota
FROM
    alunos a
       left JOIN notas n 
        ON a.id = n.id
WHERE
    n.nota > (SELECT 
				AVG(nota) AS media_por_genero
			FROM alunos al
			left JOIN notas no
			ON al.id = no.id
			where al.genero = a.genero);



-- Com CTE

/*Construa uma query com as colunas nome, curso, idade da tabela alunos onde os alunos tenham idade 
abaixo da media por curso.*/

SELECT * FROM alunos;
SELECT * FROM notas;
-- erro
with media AS (
	SELECT
			curso,
			AVG(a.idade) as media_idade
	FROM alunos AS a
	GROUP BY curso
)
	SELECT
			a.nome,
			a.curso,
			a.idade
	FROM alunos a
		LEFT JOIN media M
			on a.id = M
	where a.idade > media_idade;


	SELECT
			curso,
			AVG(idade) as media_idade
	FROM alunos 
	GROUP BY curso;

	SELECT
			a.nome,
			a.curso,
			a.idade
	FROM alunos a
	WHERE a.idade <  (
					SELECT 
							AVG(idade) media_idade
					FROM alunos AL
						WHERE a.curso = AL.curso);



DROP SCHEMA IF EXISTS mudanca_tipo;
CREATE SCHEMA mudanca_tipo;
USE mudanca_tipo;
 
create table acompanhamento(
nome varchar(100), 
data varchar(100), 
tempo varchar(100), 
quantidade varchar(100)
);
 
insert into acompanhamento (nome, data, tempo, quantidade)
values
('trabalho 1', '03/05/2024', '01:10:33', '52'),
('trabalho 2', '03/05/2024', '02:10:33', '42'),
('trabalho 3', '03/05/2024', '03:10:33', '505'),
('trabalho 4', '03/05/2024', '04:10:33', '5'),
('trabalho 5', '03/05/2024', '05:10:33', '0,5'),
('trabalho 6', '03/05/2024', '06:10:33', '568'),
('trabalho 7', '03/05/2024', '07:10:33', '5'),
('trabalho 8', '03/05/2024', '08:10:33', '38'),
('trabalho 9', '03/05/2024', '09:10:33', '383'),
('trabalho 10', '03/05/2024', '01:10:33', '28'),
('trabalho 1', '04/05/2024', '01:10:33', '3453'),
('trabalho 2', '04/05/2024', '02:10:33', '38'),
('trabalho 3', '04/05/2024', '00:10:33', '35'),
('trabalho 4', '04/05/2024', '00:10:33', '385'),
('trabalho 5', '04/05/2024', '00:10:33', '38'),
('trabalho 6', '04/05/2024', '00:43:12', '0,665'),
('trabalho 7', '04/05/2024', '07:10:33', '85'),
('trabalho 8', '04/05/2024', '00:10:33', '83'),
('trabalho 9', '04/05/2024', '00:10:33', '286'),
('trabalho 10', '04/05/2024', '00:03:33', '986'),
('trabalho 1', '05/05/2024', '01:10:33', '687'),
('trabalho 2', '04/05/2024', '02:10:33', '8'),
('trabalho 3', '05/05/2024', '00:55:33', '3'),
('trabalho 4', '04/05/2024', '00:10:33', '8'),
('trabalho 5', '05/05/2024', '01:10:33', '67'),
('trabalho 6', '04/05/2024', '02:10:33', '57,5'),
('trabalho 7', '05/05/2024', '03:10:33', '38'),
('trabalho 8', '04/05/2024', '00:55:33', '75'),
('trabalho 9', '05/05/2024', '00:55:33', '75'),
('trabalho 10', '04/05/2024', '00:55:33', '55');

use mudanca_tipo;
describe acompanhamento;

CREATE OR REPLACE VIEW TESTE AS 
SELECT 
		NOME,
STR_TO_DATE(DATA, '%D/%M/%Y') AS DATA,
STR_TO_DATE(TEMPO, '%H, %I,%S') AS TEMPO,
CAST(QUANTIDADE AS FLOAT) AS QTD
FROM ACOMPANHAMENTO;

describe TESTE;



