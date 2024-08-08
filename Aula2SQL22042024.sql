-- Define o conjunto de caracteres da conexão para UTF-8
SET NAMES utf8mb4;
-- Inserir dados em uma tabela sem verificar duplicatas.
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- Ignorar temporariamente as restrições de chave estrangeira.
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- rejeite instruções que podem ser ambíguas ou inseguras, 
-- garantindo assim maior integridade e consistência dos dados.
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS streaming_jumpflix; 
create schema streaming_jumpflix;

USE streaming_jumpflix; 

CREATE TABLE jumpflix_filmes(
	id_index INT auto_increment PRIMARY KEY,
    nome varchar(255) NOT NULL,
    classificacao_indicativa INT NOT NULL,
    tempo VARCHAR(20) NOT NULL,
    data_lançamento DATE NOT NULL
) auto_increment=1;

-- Nome da tabela promocao_jumpflix:
-- id_promocao: Chave primária para identificar exclusivamente cada promoção.
-- titulo: Título da promoção, deve ser obrigatorio.
-- descricao: Breve descrição da promoção, campo opicional.
-- data_inicio: Data de início da promoção, deve ser obrigatorio.
-- data_fim: Data de término da promoção, deve ser obrigatorio.

CREATE TABLE promocao_jumpflix(
	id_promocao int not null primary key,
    titulo varchar(255) NOT NULL,
    descricao text, 
    data_inicio date not null,
    data_fim date not null
);

-- Nome da tabela descricao_promo_jumpflix.
 -- codigo_promocional: Código promocional para aplicar a oferta.
-- id_promocao: Chave primária para identificar exclusivamente cada promoção.
-- tipo_desconto: Tipo de desconto oferecido (porcentagem, valor fixo).
-- valor_desconto: O valor do desconto ou a porcentagem de desconto.
-- condicoes: Condições específicas da promoção (ex: válido para novos assinantes apenas).
-- ativo: Indicador se a promoção está ativa ou não.

CREATE TABLE descricao_promo_jumpflix(
	id_promocao int not null,
    codigo_promocional varchar(20)  PRIMARY KEY NOT NULL,
    tipo_desconto enum('porcentagem','valor fixo'),
    valor_desconto decimal(10,2),
    condicoes boolean not null
    );
     
-- tabela de especificação da Jumpflix:
-- jumpflix_especificacoes: nome da tabel
-- Id_index: tipo inteiro chave primaria alto incremento
-- genero:campo de texto com os gêneros dos filmes
-- pontuacao: nota dos filmes no formato decimal
-- votos: campo no formato texto que representa a quantidade de votos de cada filme

drop table jumpflix_especificacoes;
CREATE TABLE jumpflix_especificacoes(
	Id_index INT auto_increment PRIMARY KEY,
    genero varchar(255) Not null,
    pontuacao float,
    votos text
);

ALTER TABLE jumpflix_especificacoes -- teste alteracoes tabela  
MODIFY votos TEXT; -- teste modificacoes em coluna
ALTER TABLE jumpflix_especificacoes MODIFY COLUMN pontuacao FLOAT; -- teste modificacoes em coluna

select * from jumpflix_especificacoes;

USE streaming_jumpflix; 


-- Vamos exercitar com a tabela chamada clientes_promo_jumpflix ela tera relacao com a tabela descricao_promo_jumpflix abaixo sera requisitado FK e PK
-- Tabela de descrição de promocoes: Nome tabela: descricao_promo_jumpflix 
-- id_promocao: Chave Estrangeira de relacao com a tabela clientes_promo_jumpflix, campo obrigatório
-- codigo_promocional: Sendo do tipo texto com no maximo 20 caracteres, campo obrigatório
-- tipo_desconto: use ENUM(campo1, campo2) como tipo do campo para aceitar somente os valor ‘porcentagem’,’valor fixo’.
-- valor_desconto: decimal com ate 10 casas numéricas e duas casas decimais
-- Condições: coloque um campo do tipo texto do tamanho indeterminado
-- Ativo: coloque o tipo boleano, sendo obrigatório

 -- drop table clientes_promo_jumpflix;
CREATE TABLE clientes_promo_jumpflix( 
id_promocao INT NOT NULL,
codigo_promocional varchar(20) NOT NULL, 
tipo_desconto enum('porcentagem','valor fixo') NOT NULL, 
valor_desconto decimal(10,2) NOT NULL, 
condicoes text, 
ativo boolean not null
);
describe descricao_promo_jumpflix;




    
ALTER TABLE clientes_promo_jumpflix
 ADD CONSTRAINT fk_descricao_promo_jumpflix 
 FOREIGN KEY (codigo_promocional) -- CHAVE ESTRANGEIRA COM VALORES MULTIPLOS REPETIDOS FK
 REFERENCES descricao_promo_jumpflix(codigo_promocional);
 
 DESCRIBE clientes_promo_jumpflix;
 /* nome tabele clientes_promo_jumpflix
 id_cli_promo : Chave primaria com valores inseridos manualmente,tipo texto com até 4 caracteres
 codigo_promocional: texto com 20 caracteres
 pais: texto com 50 caracteres
 valor: valor decimal com 10 casas inteiras e duas decimais
 quantidade: do tipo inteiro */
 
USE streaming_jumpflix; 

 CREATE TABLE clientes_promo_jumpflix( 
id_cli_promo char(4) PRIMARY KEY,
codigo_promocional varchar(20), 
pais varchar(50), 
valor decimal(10,2), 
quantidade int
); 
-- drop table if exists clientes_promo_jumpflix;
select * from clientes_promo_jumpflix;

describe jumpflix_filmes;

alter table jumpflix_filmes
add mes int not null;

alter table jumpflix_filmes
drop column mes;

describe jumpflix_especificacoes;
alter table jumpflix_especificacoes
add ano_lancamentoes date;

alter table jumpflix_especificacoes
drop column votos;

describe promocao_jumpflix;
select * from promocao_jumpflix;
insert into
promocao_jumpflix(id_promocao, titulo, descricao, data_inicio, data_fim)
values(1,
       'Promocao de Verão',
       'Desconto especial para novos assinantes no verao',
       '2024-06-01','2024-08-31');
		
 
