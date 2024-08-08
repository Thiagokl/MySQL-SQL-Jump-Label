-- Aula 18

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
     
 
 
 -- Correção
   
   SELECT 
    T1.genero, 
    T1.pontuacao, 
    T2.nome 
FROM jumpflix_especificacoes T1
	INNER JOIN (  SELECT 
					T2.id_index,
                    T2.nome
				FROM
						jumpflix_filmes T2
					WHERE
						classificacao_indicativa = 15) T2
							ON T1.id_index = T2.id_index;
        
        
   
  SELECT 
    T2.id_index, T2.nome
FROM
    jumpflix_filmes T2
WHERE
    classificacao_indicativa = 15;
   
-- Correção

select 
	T1.genero,
	T1.pontuacao,
    T2.nome
from jumpflix_especificacoes T1
	inner join (select
					id_index,
					nome
				from jumpflix_filmes
				where classificacao_indicativa = 15) T2
		on T1.id_index = T2.id_index;



-- Criando CTE 

/* Ela dependete da anterior para ir para próxima - Recursivo uma função ou algoritmo que se chama a si mesmo
 repetidamente,até que uma condição de parada seja alcançada sso permite que um problema seja dividido em partes 
 menores e resolvido de forma mais simples e eficiente.*/
 
 
-- vantagens das CTEs definir a subconsulta com reuso do código depende da anterior para fazer a próxima

/* Exemplo CTE*/

select * from jumpflix_filmes;
select * from jumpflix_especificacoes;

WITH FILMES_ESPECI AS (    
	select 
			FILM.nome,
            year(FILM.data_lancamento) AS ano,
            ESP.genero,
            ESP.pontuacao
	from jumpflix_filmes FILM
		LEFT JOIN jumpflix_especificacoes ESP
			ON ESP.id_index = FILM.id_index
)
SELECT          
    *
FROM FILMES_ESPECI
	WHERE ano > 2015;


/*Utilizando a cláusula WITH para criar duas tabelas temporárias: "FILMES_ESPECI" e "TESTE".
 No primeiro bloco WITH, "FILMES_ESPECI" é criada a partir de uma junção entre as tabelas "jumpflix_filmes" e "jumpflix_especificacoes", 
 selecionando o nome do filme, o ano de lançamento, o gênero e a pontuação. No segundo bloco WITH, a tabela "TESTE" é criada filtrando apenas 
 os registros da tabela "FILMES_ESPECI" em que o ano é maior que 2015.

Após a criação das tabelas temporárias, a consulta final é feita selecionando apenas o campo "nome" da tabela "TESTE". Ou seja, serão apresentados
 apenas os nomes dos filmes que foram lançados após o ano de 2015 e que possuem informações sobre gênero e pontuação. O uso do WITH permite organizar
 a consulta em etapas e reutilizar os resultados obtidos em cada etapa, facilitando o entendimento e a manutenção do código.*/


select * from jumpflix_filmes;
select * from jumpflix_especificacoes;

WITH FILMES_ESPECI AS (       --  No 1º bloco WITH, "FILMES_ESPECI" é criada a partir de uma junção entre as tabelas "jumpflix_filmes" e "jumpflix_especificacoes"
	select 
			FILM.nome,
            year(FILM.data_lancamento) AS ano,
            ESP.genero,
            ESP.pontuacao
	from jumpflix_filmes FILM
		LEFT JOIN jumpflix_especificacoes ESP
			ON ESP.id_index = FILM.id_index
), 
	TESTE AS (         -- No 2° bloco WITH, a tabela "TESTE" é criada filtrando apenas os registros da tabela "FILMES_ESPECI" em que o ano é maior que 2015.
    SELECT 
    *
FROM FILMES_ESPECI
	WHERE ano > 2015
    )
    SELECT
		*
	from TESTE;

/* CRIE UMA CTE DA QUERY ABAIXO, E SELECIONE PONTUAÇÃO MENOR QUE 8*/

select 
		T1.genero,
		T1.pontuacao,
		T2.nome
from jumpflix_especificacoes T1
	inner join (select
					T2.id_index,
                    T2.nome
				from jumpflix_filmes T2
				where classificacao_indicativa = 15) T2
		on T1.id_index = T2.id_index;
  
  
WITH EXEMPLO AS (
	select 
			T1.genero,
			T1.pontuacao,
			T2.nome
from jumpflix_especificacoes T1
	inner join (select
					T2.id_index,
                    T2.nome
				from jumpflix_filmes T2
				where classificacao_indicativa = 15) T2
		on T1.id_index = T2.id_index
),
TESTE AS (
SELECT 
    *
FROM EXEMPLO
WHERE pontuacao < 8
		ORDER BY pontuacao
) 
	SELECT 
		nome
	from teste;
    
-- SubConsulta dentro da CTE

SELECT  * FROM jump_school_alunos;
SELECT  * FROM jump_school_notas;
   
/*Construa  a media de nota por genero dos alunos utilizando o SCHEMA jump_school*/

SELECT  * FROM jump_school_alunos;
SELECT  * FROM jump_school_notas;

SELECT
		t1.genero,
		AVG(nota) AS media_nota
FROM jump_school_alunos t1
INNER JOIN jump_school_notas t2
    ON t1.id = t2.aluno_id
GROUP BY t1.genero;

/*Construa uma query com curso_id e nota da tabela jump_school_notas e as colunas nome e genero da jump_school_alunos,
utilize a query do exercício anterior adaptado uma subconsulta para selecionar os alunos com notas acima da 
média por gênero.  */

SELECT  * FROM jump_school_alunos;
SELECT  * FROM jump_school_notas;


SELECT
		NT.curso_id,
        NT.nota,
		AL.nome,
        AL.genero
FROM jump_school_notas NT
	LEFT JOIN jump_school_alunos AL
		ON AL.id = NT.aluno_id
        WHERE nota > (
						 SELECT                          
								AVG(nota) AS media_nota
						 FROM jump_school_alunos t1
						 INNER JOIN jump_school_notas t2
							ON t1.id = t2.aluno_id
						 WHERE T1.genero = AL.genero)  -- não necessário chamar a coluna genero novamnete e a ligação do filtro é com a consulta externa
						 GROUP BY AL.genero;
select 
	NT.curso_id,
    NT.nota,
    AL.nome,
    AL.genero
from jump_school_notas NT
left join jump_school_alunos AL
	on AL.id = NT.aluno_id
	where NT.nota > (
				  SELECT            -- T1.genero compara o genero de dentro com o genero de fora 
					AVG(nota) AS media_nota
				FROM jump_school_alunos t1
				  INNER JOIN jump_school_notas t2
					ON t1.id = t2.aluno_id
				   where t1.genero = AL.genero
				);


/*Coloque a query anterior em uma CTE e enriqueça com informação de nome de curso (coluna nome) 
da tabela jump_school_cursos*/

-- Exercício para apresentação na aula 23/05/2024


SELECT  * FROM jump_school_alunos;
SELECT  * FROM jump_school_notas;
SELECT  * FROM jump_school_cursos;

-- CTE
 -- USO DA CTE USO DA COLUNAS SOLICITADAS COM TRATAMENTO DOS NULLOS E VAZIOS COM A FUNÇÃO COALESCE
 -- CALCULANDO EM SUBCONSULTA A NOTA MAIOR QUE A MEDIA DOS ALUNOS POR GENERO.
 -- NA ULTIMA CONSULTA TROUXE TUDO DE ALUNO COM A COLUNA NOME DO CURSO DE ENRIQUECENDO OS DADOS DO FROM ALUNOS

use jump_school;
WITH aluno_nota AS ( 
	select 
		NT.curso_id,
		NT.nota,
		COALESCE(AL.nome, 'CADASTRAR CURSO') AS nome_curso,
		AL.genero
	from jump_school_notas NT
		left join jump_school_alunos AL
			on AL.id = NT.aluno_id
	where NT.nota > (
					  SELECT            -- T1.genero compara o genero de dentro com o genero de fora 
						AVG(nota) AS media_nota
					FROM jump_school_alunos T1
					 LEFT JOIN jump_school_notas T2
						ON T1.id = T2.id
					   where AL.genero = T1.genero
					   )
)
SELECT 
		aluno_nota.*,
        T4.nome AS nome_curso
FROM aluno_nota 
	LEFT JOIN jump_school_cursos T4  
		ON aluno_nota.curso_id = T4.id;
        
        

        
use jump_school;
 
with CTE_escola as (
		select 
			T4.curso_id as id_curso,
			T4.nota,
			T3.nome as aluno,
			T3.genero 
		from jump_school_alunos T3 
			left join jump_school_notas T4
			on T3.id = T4.aluno_id
			where   		T4.nota >	(	SELECT 
											AVG(T2.nota) as media_nota
										FROM
											jump_school_alunos T1 
											INNER JOIN jump_school_notas AS T2 
												ON T1.id = T2.aluno_id
											where T1.genero = T3.genero)
)
SELECT 
    CTE_escola.*,
    TC.nome as Curso
FROM CTE_escola 
    LEFT JOIN jump_school_cursos TC 
    ON CTE_escola.id_curso = TC.id;

