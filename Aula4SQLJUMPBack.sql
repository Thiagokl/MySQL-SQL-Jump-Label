-- Iniciando uso de SELECT

select * from promocao_jumpflix;

select distinct * from promocao_jumpflix;

describe promocao_jumpflix;

select  distinct
         titulo      
from promocao_jumpflix;

select titulo      
from promocao_jumpflix;

SELECT 
    titulo,
    data_inicio
FROM promocao_jumpflix;
    
SELECT DISTINCT
    tipo_desconto
FROM descricao_promo_jumpflix;

/* HORA DE EXCERCITAR 
 Identificando lançamento​
 Na tabela jumpflix_filmes faça uma consulta com o nome 
 dos filmes ou séries e coluna de data de lançamento para 
 ser de fácil identificação o ano de lançamento do produto*/
-- Exercício 1 - Trazer as colunas nome, data_lancamento

SELECT * FROM jumpflix_filmes;

SELECT 
    nome, 
	data_lancamento
FROM
    jumpflix_filmes;

/*Na tabela clientes_promo_jumpflix verifique quais
 países distintos estão presentes na tabela.*/
 -- Exercício 2, trazer os paises sem a repetição
 
 SELECT * FROM clientes_promo_jumpflix;
    
 SELECT DISTINCT pais
 FROM clientes_promo_jumpflix;
 
 -- Exemplo de consulttas com DISTINCT 
SELECT DISTINCT
    titulo, descricao, data_inicio, data_fim
FROM
    promocao_jumpflix;
 
 -- Exemplo de como usar o DISTINCT E ALIAS OU AS Apelido
      
SELECT DISTINCT	pais,
			pais as 'pais_unico'
FROM clientes_promo_jumpflix;
    
/*Uma coluna pode ser calculada a partir de uma outra existente.​
 Utilizamos a palavra chave “AS” também para renomear uma coluna calculada*/
 /* EXEMPLO, selecionando a coluna valor_desconto da tabela descricao_promo_jumpflix,
 calculando desconto de 10%  da coluna valor_desconto e renomeando a coluna calculada usando a cláusula AS*/
 
SELECT valor_desconto,
       valor_desconto * 0.10 AS desconto_10
FROM descricao_promo_jumpflix;
     
    -- Exemplo em aula
    SELECT 2 * 3 AS multiplicar;
    
/*Uma coluna pode ser criada na consulta final com as seguintes possibilidades:​
Criar uma coluna com campos vazios, utilizar a tabela jumpflix_filmes
Criara uma coluna toda preenchida com o mesmo valor​
Criar uma coluna a partir de um resultado de condições impostas a uma coluna já existente.*/
-- Exemplos
    SELECT nome,
           '' AS campo_obri,
           'app' AS canal
	FROM jumpflix_filmes;
    
    SELECT nome,
           '' AS filmes,
           'filmes' AS tipo
	FROM jumpflix_filmes;
    
    SELECT nome,
           6 AS campo_obri,
           'TV' AS canal
	FROM jumpflix_filmes;
    
    -- Hora de exercitar
    
/* Exercício 1
Cálculo taxa de desconto
Na tabela descricao_promo_jumpflix os valores fixos na coluna valor_desconto
devem ser analisados para um desconto de 2%, pois correspondem às taxas a serem pagas pela publicidade.
Monte uma query para exibir a coluna valor_desconto, e a coluna desconto_2 
para representar o valor de 2% aplicado sobre o valor_desconto. */

 SELECT valor_desconto,
        valor_desconto * 0.02 AS desconto_2 -- multiplique valor_desconto por 2% (0.02) crie nova coluna com Cláusula AS desconto_2
 FROM descricao_promo_jumpflix; -- chame a tabela na qual está a coluna que iremos calcular o desconto de 2% (0.02).
    
	/* Exercício 2
Correlação de faixa etária de idades
Na tabela jumpflix_filmes a classificação de faixa etária teve uma nova regra
e todos os produtos deverão diminuir um ano na classificação indicativa.
Crie uma nova coluna com os novos valores. Exiba na consulta final as colunas nome,
classificacao_indicativa e uma coluna de classificacao_indicativa_nova representando 
essa atualizacao de um ano a menos */
     
SELECT * FROM jumpflix_filmes;
    
SELECT  nome, 
        classificacao_indicativa,
        classificacao_indicativa - 1 as  classificacao_indicativa_nova -- diminuir um ano na classificação indicativa
FROM jumpflix_filmes;
    
/*Podemos utilizar a cláusula WHERE para especificar uma ou mais condições para satisfazer nossos critérios de seleção.​
As condições podem ser expressões relacionais, lógica ou a junção de ambas.  Também podemos utilizar outras consultas como condição para realizar filtros.​
Utilizaremos os operadores relacionais, lógicos ou matemáticos na montagem da condição.​
Exemplo: Filtrar somente os tipos de desconto que sejam valor fixo.*/    

SELECT * FROM descricao_promo_jumpflix;

SELECT valor_desconto,
       valor_desconto * 0.02 AS desconto_2 -- No exemplo inserimos o valor do desconto 2% criamos umo coluna desconto_2
FROM descricao_promo_jumpflix
WHERE tipo_desconto = 'valor_fixo'; --  filtrando apenas as linhas onde o tipo_desconto é 'valor_fixo' na coluna nova desconto_2
  
SELECT * FROM jumpflix_filmes;

-- tabela jumpflix_filmes vamos selecionar 3 colunas usando a claúsula where p filtrar filmes com 60 min 

SELECT nome, 
       data_lancamento,
	   tempo
FROM jumpflix_filmes
WHERE tempo = '60 min';

-- Da tabela promocao_jumpflix a coluna id_promocao selecionamos a linha ID=2    

SELECT * FROM
promocao_jumpflix
WHERE id_promocao = '2';    
   
/* Filtrando pontuação​
Mostrar os dados da tabela jumpflix_especificacoes que tenham pontuação maior que 8.5 */
   
SELECT * FROM jumpflix_especificacoes;

-- Com * mostramos toda tabela com a resposta > 8.5

SELECT
    *       
FROM jumpflix_especificacoes
WHERE pontuacao > 8.5;

-- mostramos somente a coluna pontuação da tabela jumpflix_especificacoes

SELECT pontuacao 
FROM jumpflix_especificacoes
WHERE pontuacao > 8.5;  




SELECT * FROM promocao_jumpflix
 where titulo = 'oferta de aniversario';
 
 SELECT Distinct titulo
 FROM promocao_jumpflix;

 

