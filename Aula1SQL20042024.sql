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
- Nome da tabela descricao_promo_jumpflix.
 
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

describe descricao_promo_jumpflix;

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

ALTER TABLE jumpflix_especificacoes
MODIFY votos TEXT;
ALTER TABLE jumpflix_especificacoes MODIFY COLUMN pontuacao FLOAT;

select * from jumpflix_especificacoes;
CREATE TABLE cliente_promo jumpflix;


