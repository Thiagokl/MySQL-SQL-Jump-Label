/*>>>>>>>>>>>Aula 16<<<<<<<<<<<<<*/

######
-- 13
#####
SELECT
    endereco,
    TRIM(SUBSTRING_INDEX(endereco, ',', 1)) AS nome_da_rua,
    TRIM(SUBSTRING_INDEX(endereco, ',', -1)) AS numero
FROM
    sua_tabela;


SELECT 
    *
FROM jump_school_alunos
	WHERE ativo = 1 
	AND data_matricula >= '2023-01-01'
    ORDER BY data_matricula; 
	

SELECT 
    nome,
    date_format(data_nascimento, '%d-%m-%Y') data_nascimento,
    genero,
    trim(substring_index(endereco,',',1)) endereco,
    trim(substring_index(endereco,',',-1)) numero
FROM jump_school_alunos
	WHERE ativo = 1 
	AND data_matricula >= '2023-01-01'
    ORDER BY data_matricula; 


/*
Lista de Especificadores de Formato
%Y: Ano com quatro dígitos (e.g., 2024)
%y: Ano com dois dígitos (e.g., 24)
%M: Nome completo do mês (e.g., January)
%m: Mês com dois dígitos (e.g., 01, 02, ..., 12)
%d: Dia do mês com dois dígitos (e.g., 01, 02, ..., 31)
%D: Dia do mês com sufixo em inglês (e.g., 1st, 2nd, 3rd, ...)
%H: Hora em formato de 24 horas (e.g., 00, 01, ..., 23)
%h: Hora em formato de 12 horas (e.g., 01, 02, ..., 12)
%i: Minutos com dois dígitos (e.g., 00, 01, ..., 59)
%s: Segundos com dois dígitos (e.g., 00, 01, ..., 59)
%w: Dia da semana (0 = Domingo, 1 = Segunda, ..., 6 = Sábado)
%W: Nome completo do dia da semana (e.g., Sunday, Monday)
%p: AM ou PM */


######
-- 14
#####

SELECT 
	UPPER(nome) as nome,
    TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM jump_school_alunos
	WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) BETWEEN 21 AND 40
    ORDER BY nome;
	
select TIMESTAMPDIFF(YEAR, '1986-09-03', CURDATE()) as idade;

select FLOOR(DATEDIFF(CURDATE(), '1986-09-03') / 365) as idade;	
	
	
	
######
-- 15
#####	

SELECT 
	nome,
    carga_horaria,
    valor
FROM jump_school_cursos
	WHERE carga_horaria > 50 AND valor < 500;

SELECT FLOOR(80 / 60);
SELECT MOD(80 , 60);
	
SELECT 
	nome,
    CONCAT(LPAD(FLOOR(carga_horaria / 60), 2, '0'), ':', LPAD(MOD(carga_horaria, 60), 2, '0'), ' h') AS carga_horaria,
    CONCAT('R$ ', valor) VALOR
FROM jump_school_cursos
	WHERE carga_horaria > 50 AND valor < 500;	
	

######
-- 16
#####	
SELECT 
	nome, 
    data_inicio,
    valor
FROM jump_school_cursos
	WHERE YEAR(data_inicio) = 2023 
	AND valor BETWEEN 100 AND 200;
	
######
-- 17
#####	

SELECT
	nota,
    CASE
		WHEN nota > 7.5 THEN 'aprovado'
        ELSE 'reprovado'
	END AS acompanhamento
FROM jump_school_notas
	ORDER BY nota;

SELECT 
	COUNT(nota) AS notas_aprovadas
FROM jump_school_notas
		WHERE nota > 7.5;


SELECT 
	'aprovado' as acompanhamento,
    COUNT(*) as quantidade_aprovados
FROM
    jump_school_notas
WHERE
  nota > 7.5;
        


######
-- 18
#####

SELECT
	YEAR(data_contratacao) AS ano_contratacao,
    COUNT(*) AS quant_prof_contratos
FROM jump_school_professores
	GROUP BY YEAR (data_contratacao)
    ORDER BY ano_contratacao;

---------------------------------------------------------------
SELECT
	count(*) AS professores,
	DATE_FORMAT(data_contratacao, '%Y') AS contrat_por_ano
FROM jump_school_professores
	GROUP BY DATE_FORMAT(data_contratacao, '%Y')
    ORDER BY DATE_FORMAT(data_contratacao, '%Y');


######
-- 19
#####

SELECT 
	curso_id,
    nota,
    data_avaliacao
FROM jump_school_notas
	WHERE nota > 7.0 
	AND curso_id = 1
    ORDER BY data_avaliacao DESC;


######
-- 20
#####

SELECT 
	CASE curso_id
		WHEN 2 THEN 'HTML, CSV e JAVA'
        WHEN 3 THEN 'SQL'
        WHEN 9 THEN 'Big Data'
        ELSE NULL
	END AS curso,
    nota,
    data_avaliacao
FROM jump_school_notas
ORDER BY curso DESC;


SELECT 
    ELT(FIELD(curso_id, 2, 3, 9), 'HTML, CSV e JAVA', 'SQL', 'Big Data') AS curso,
    nota,
    data_avaliacao
FROM jump_school_notas
ORDER BY curso DESC;