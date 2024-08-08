-- Define o conjunto de caracteres da conexão para UTF-8
SET NAMES utf8mb4;
-- Inserir dados em uma tabela sem verificar duplicatas.
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- Ignorar temporariamente as restrições de chave estrangeira.
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- rejeite instruções que podem ser ambíguas ou inseguras, 
-- garantindo assim maior integridade e consistência dos dados.
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
 

DROP SCHEMA IF exists streaming_jumpflix; 
create SCHEMA streaming_jumpflix;

USE streaming_jumpflix;

-- Crie uma tabela chamada jumpflix_filmes para registrar informações sobre os filmes. 
-- Cada filme terá um identificador único (id_index), título (nome), classificação 
-- indicativa (classificacao_indicativa), duração (tempo), e data de lançamento 
-- (data_lancamento).

CREATE TABLE jumpflix_filmes(
	id_index INT auto_increment primary KEY,
	nome varchar(255) NOT NULL,
	classificacao_indicativa INT NOT NULL, 
	tempo varchar(20) NOT NULL, 
	data_lancamento DATE NOT NULL
) auto_increment=1;

-- Nome da tabela promocao_jumpflix : 
-- id_promocao: Chave primária para identificar exclusivamente cada promoção.
-- titulo: Título da promoção, deve ser obrigatorio.
-- descricao: Breve descrição da promoção, campo opicional.
-- data_inicio: Data de início da promoção, deve ser obrigatorio.
-- data_fim: Data de término da promoção, deve ser obrigatorio.

CREATE TABLE promocao_jumpflix(
	id_promocao INT NOT NULL primary KEY,
    titulo varchar(255) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL
);