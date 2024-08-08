
DROP SCHEMA IF EXISTS streaming_jumpflix;
CREATE SCHEMA streaming_jumpflix;
USE streaming_jumpflix;


-- CRIANDO A TABELA jumpflix_filmes
CREATE TABLE jumpflix_filmes (
    id_index INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    classificacao_indicativa INT NOT NULL,
    tempo VARCHAR(20) NOT NULL,
    data_lancamento DATE NOT NULL
) AUTO_INCREMENT=1;



#INSERINDO DADOS jumpflix_filmes
INSERT INTO jumpflix_filmes (nome, classificacao_indicativa, tempo, data_lancamento) VALUES
('Stranger Things', 15, '60 min', '2016-07-15'),
('13 Reasons Why', 18, '60 min', '2017-03-31'),
('Orange Is the New Black', 18, '59 min', '2013-07-11'),
('Black Mirror', 18, '60 min', '2011-12-04'),
('Money Heist', 15, '60 min', '2017-05-02'),
('Lucifer', 15, '4,393 min', '2016-01-25'),
('Narcos', 15, '50 min', '2015-08-28'),
('Daredevil', 15, '60 min', '2015-04-10'),
('Sense8', 15, '60 min', '2015-06-05'),
('Jessica Jones', 15, '56 min', '2015-11-20'),
('House of Cards', 18, '50 min', '2013-02-01'),
('The End of the F***ing World', 15, '25 min', '2017-10-24'),
('Dark', 15, '60 min', '2017-12-01'),
('Sex Education', 18, '60 min', '2019-01-11'),
('Elite', 15, '60 min', '2018-10-05'),
('You', 15, '45 min', '2018-09-09'),
('Chilling Adventures of Sabrina', 15, '60 min', '2018-10-26'),
('The OA', 15, '60 min', '2016-12-16'),
('The Punisher', 18, '60 min', '2017-11-17'),
('The Umbrella Academy', 15, '60 min', '2019-02-15'),
('Iron Fist', 18, '55 min', '2017-03-17'),
('Luke Cage', 15, '55 min', '2016-09-30'),
('Atypical', 12, '30 min', '2017-08-11'),
('Big Mouth', 18, '30 min', '2017-09-29'),
('The Rain', 15, '45 min', '2018-05-04'),
('The Defenders', 15, '50 min', '2017-08-18'),
('The Crown', 15, '60 min', '2016-11-04'),
('A Series of Unfortunate Events', 10, '1,164 min', '2017-01-13'),
('Insatiable', 15, '45 min', '2018-08-10'),
('Mindhunter', 18, '60 min', '2017-10-13'),
('3%', 15, '49 min', '2016-11-25'),
('Altered Carbon', 18, '60 min', '2018-02-02'),
('The Haunting of Hill House', 15, '572 min', '2018-10-12'),
('Santa Clarita Diet', 15, '30 min', '2017-02-03'),
('Disenchantment', 15, '30 min', '2018-08-17'),
('BoJack Horseman', 18, '25 min', '2014-08-22'),
('Girlboss', 15, '26 min', '2017-04-21'),
('Ozark', 18, '60 min', '2017-07-21'),
('Lost in Space', 12, '60 min', '2018-04-13'),
('Baby', 15, '50 min', '2018-11-30'),
('Unbreakable Kimmy Schmidt', 12, '30 min', '2015-03-06'),
('Everything Sucks!', 15, '30 min', '2018-02-16'),
('Cable Girls', 15, '50 min', '2017-04-28'),
('The Last Kingdom', 18, '60 min', '2015-10-10'),
('The Society', 15, '58 min', '2019-05-10'),
('Maniac', 18, '386 min', '2018-09-21'),
('Gilmore Girls: A Year in the Life', 12, '370 min', '2016-11-25'),
('Russian Doll', 18, '30 min', '2019-02-01'),
('Castlevania', 15, '23 min', '2017-07-07'),
('On My Block', 15, '30 min', '2018-03-16'),
('Marco Polo', 15, '60 min', '2014-12-12'),
('Grace and Frankie', 15, '30 min', '2015-05-08'),
('Love, Death & Robots', 18, '15 min', '2019-03-15'),
('Dear White People', 15, '30 min', '2017-04-28'),
('Safe', 15, '356 min', '2018-05-10'),
('Greenhouse Academy', 10, '25 min', '2017-09-08'),
('RuPaul''s Drag Race', 15, '63 min', '2009-02-02'),
('The Order', 15, '60 min', '2019-03-07'),
('Fuller House', 10, '30 min', '2016-02-26'),
('Travelers', 15, '45 min', '2016-12-23'),
('Master of None', 15, '30 min', '2015-11-06'),
('Love', 15, '50 min', '2016-02-19'),
('Narcos: Mexico', 15, '60 min', '2018-11-16'),
('The Hookup Plan', 15, '27 min', '2018-12-07'),
('One Day at a Time', 15, '30 min', '2017-01-06'),
('Between', 15, '60 min', '2015-05-21'),
('GLOW', 18, '35 min', '2017-06-23'),
('Making a Murderer', 15, '60 min', '2015-12-18'),
('Gypsy', 15, '51 min', '2017-06-30'),
('The Get Down', 15, '52 min', '2016-08-12'),
('The Protector', 15, '45 min', '2018-12-14'),
('Friends from College', 18, '30 min', '2017-07-14'),
('Arrested Development', 15, '22 min', '2003-11-02'),
('Hemlock Grove', 15, '46 min', '2013-04-19'),
('Slasher', 18, '60 min', '2016-03-04'),
('F Is for Family', 15, '30 min', '2015-12-18'),
('The Ranch', 15, '30 min', '2016-04-01'),
('American Vandal', 15, '34 min', '2017-09-15'),
('Dead to Me', 15, '30 min', '2019-05-03'),
('Quicksand', 18, '45 min', '2019-04-05');


-- CRIANDO A TABELA jumpflix_especificacoes
CREATE TABLE jumpflix_especificacoes(
    id_index INT AUTO_INCREMENT PRIMARY KEY,
    genero VARCHAR(255),
    pontuacao FLOAT,
    votos VARCHAR(255)
)AUTO_INCREMENT=1;

-- INSERINDO DADOS NA TABELA jumpflix_especificacoes
INSERT INTO jumpflix_especificacoes (genero, pontuacao, votos) VALUES
('Drama, Fantasia, Terror', 8.7, '1,327,188'),
('Drama, Mistério, Suspense', 7.5, '314,321'),
('Comédia, Crime, Drama', 8.0, '319,342'),
('Drama, Mistério, Ficção Científica', 8.7, '636,319'),
('Ação, Crime, Drama', 8.2, '529,086'),
('Crime, Drama, Fantasia', 8.1, '354,155'),
('Biografia, Crime, Drama', 8.8, '467,909'),
('Ação, Crime, Drama', 8.6, '472,940'),
('Drama, Mistério, Ficção Científica', 8.2, '162,528'),
('Ação, Crime, Drama', 7.9, '226,187'),
('Biografia, Crime, Drama', 8.8, '467,909'),
('Drama', 8.6, '529,463'),
('Aventura, Comédia, Crime', 8.0, '218,483'),
('Crime, Drama, Mistério', 8.7, '440,321'),
('Comédia, Drama, Romance', 8.3, '348,817'),
('Biografia, Crime, Drama', 8.8, '467,909'),
('Crime, Drama, Suspense', 7.2, '90,237'),
('Crime, Drama, Romance', 7.7, '297,650'),
('Drama, Fantasia, Terror', 7.4, '107,853'),
('Drama, Fantasia, Mistério', 7.8, '115,239'),
('Ação, Crime, Drama', 8.4, '263,516'),
('Ação, Aventura, Comédia', 7.9, '273,779'),
('Ação, Aventura, Crime', 6.4, '139,364'),
('Drama, Fantasia, Mistério', 7.8, '115,239'),
('Ação, Crime, Drama', 7.2, '139,241'),
('Drama, Fantasia, Mistério', 7.8, '115,239'),
('Comédia, Drama', 8.2, '103,009'),
('Animação, Comédia, Romance', 7.8, '89,033'),
('Drama, Ficção Científica, Suspense', 6.3, '41,355'),
('Ação, Aventura, Crime', 7.2, '116,048'),
('Biografia, Drama, History', 8.6, '255,352'),
('Aventura, Comédia, Drama', 7.7, '66,482'),
('Comédia, Drama, Suspense', 6.5, '32,495'),
('Crime, Drama, Mistério', 8.6, '333,075'),
('Ação, Drama, Ficção Científica', 7.3, '28,008'),
('Ação, Drama, Ficção Científica', 7.9, '187,859'),
('Drama, Terror, Mistério', 8.6, '286,535'),
('Comédia, Terror', 7.8, '75,813'),
('Animação, Ação, Aventura', 7.2, '72,503'),
('Animação, Comédia, Drama', 8.8, '186,993'),
('Comédia', 7.0, '19,687'),
('Crime, Drama, Suspense', 8.5, '344,631'),
('Aventura, Drama, Família', 7.3, '105,388'),
('Drama', 6.8, '13,083'),
('Comédia', 7.6, '78,450'),
('Comédia, Drama', 7.4, '23,120'),
('Aventura, Drama, Família', 7.3, '105,388'),
('Drama', 7.5, '16,087'),
('Ação, Drama, History', 8.5, '164,641'),
('Drama, Mistério, Ficção Científica', 7.1, '36,504'),
('Comédia, Drama, Ficção Científica', 7.7, '86,275'),
('Comédia, Drama', 7.5, '44,543'),
('Comédia, Drama, Mistério', 7.7, '106,602'),
('Animação, Ação, Aventura', 8.3, '79,792'),
('Comédia, Drama', 7.8, '19,427'),
('Ação, Aventura, Drama', 8.0, '78,306'),
('Comédia', 8.2, '56,789'),
('Animação, Curta, Ação', 8.4, '195,422'),
('Comédia, Drama', 6.4, '26,364'),
('Crime, Drama, Mistério', 7.2, '51,704'),
('Aventura, Comédia, Drama', 6.6, '6,921'),
('Crime, Drama, Mistério', 7.2, '51,704'),
('Game-Show, Reality-TV', 8.5, '23,189'),
('Drama, Fantasia, Terror', 6.7, '33,053'),
('Comédia, Drama, Família', 6.7, '29,332'),
('Drama, Mistério, Ficção Científica', 8.0, '63,928'),
('Comédia, Drama', 8.2, '76,143'),
('Comédia, Drama, Romance', 7.6, '45,854'),
('Crime, Drama', 8.4, '92,447'),
('Comédia, Romance', 7.1, '5,910'),
('Crime, Drama, Mistério', 7.2, ' '),
('Comédia, Drama', 8.2, '18,238'),
('Drama, Mistério, Ficção Científica', 5.9, '9,906'),
('Comédia, Drama, Esporte', 8.0, '50,376'),
('Documentario, Crime', 8.5, '102,505'),
(' ', 7.2, '51,704'),
('Drama, Suspense', 6.7, '18,683'),
('Drama, Musica, Musical', 8.2, '23,633'),
('Ação, Aventura, Drama', 6.4, '36,866'),
('Comédia, Drama', 6.9, '23,324'),
('Comédia', 8.7, '323,189'),
('Drama, Fantasia, Terror', 7.0, '42,524'),
('Crime, Drama, Terror', 6.7, '16,830'),
('Animação, Comédia, Drama', 8.0, '41,074'),
('Comédia, Drama, Faroeste', 7.5, '42,401'),
('Comédia, Crime, Drama', 8.1, '32,985'),
('Comédia, Crime, Drama', 7.9, '99,440'),
('Crime, Drama, Mistério', 7.4, '25,507');


-- Criando a tabela promocao_netflix
CREATE TABLE promocao_jumpflix (
    id_promocao INT NOT NULL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL
);

-- INSERINDO DADOS NA TABELA promocao_jumpflix
INSERT INTO promocao_jumpflix (id_promocao, titulo, descricao, data_inicio, data_fim) 
VALUES 
(1, 'Promoção de Verão', 'Desfrute de um desconto especial para novos assinantes durante o verão!', '2024-10-01', '2024-12-31'),
(2, 'Oferta Especial de Inverno', 'Aproveite descontos exclusivos durante todo o inverno!', '2024-12-01', '2025-02-28'),
(3, 'Promoção de Primavera', 'Descontos especiais para filmes e séries de primavera!', '2024-03-01', '2024-05-31'),
(4, 'Oferta de Aniversário', 'Celebre conosco e ganhe um desconto especial!', '2024-10-15', '2024-10-17'),
(5, 'Promoção de Halloween', 'Aproveite o Halloween com descontos assustadores!', '2024-10-25', '2024-10-31'),
(6, 'Oferta de Natal', 'Comemore o Natal com grandes descontos!', '2024-12-20', '2024-12-25'),
(7, 'Promoção de Páscoa', 'Descontos especiais para celebrar a Páscoa!', '2024-04-01', '2024-04-05'),
(8, 'Oferta de Verão', 'Aproveite o calor com grandes descontos!', '2024-07-01', '2024-08-31'),
(9, 'Promoção de Black Friday', 'Descontos incríveis na Black Friday!', '2024-11-25', '2024-11-30'),
(10, 'Oferta de Ano Novo', 'Comece o ano novo com descontos especiais!', '2024-12-31', '2025-01-01'),
(11, 'Promoção de Verão', 'Desfrute de um desconto especial para novos assinantes durante o verão!', '2023-10-01', '2023-12-31'),
(12, 'Promoção de Primavera', 'Descontos especiais para filmes e séries de primavera!', '2023-03-01', '2023-05-31'),
(13, 'Promoção de Primavera', 'Descontos especiais para filmes e séries de primavera!', '2024-03-01', '2024-05-31'),
(14, 'Promoção de Halloween', 'Aproveite o Halloween com descontos assustadores!', '2024-10-25', '2024-10-31');


-- CRINADO A TABELA descricao_promo_netflix
CREATE TABLE descricao_promo_jumpflix (
    id_promocao INT NOT NULL,
    codigo_promocional VARCHAR(20) NOT NULL,
    tipo_desconto ENUM('porcentagem', 'valor_fixo'),
    valor_desconto DECIMAL(10, 2),
    condicoes TEXT,
    ativo BOOLEAN NOT NULL,
    PRIMARY KEY (codigo_promocional),
    FOREIGN KEY (id_promocao) REFERENCES promocao_jumpflix(id_promocao)
);


-- INSERINDO DADOS NA TABELA descricao_promo_jumpflix
INSERT INTO descricao_promo_jumpflix (id_promocao, codigo_promocional, tipo_desconto, valor_desconto, condicoes, ativo) 
VALUES 
(1, 'VERAO2023', 'porcentagem', 15.00, 'Válido apenas para novas assinaturas realizadas durante o período da promoção.', 1),
(2, 'INVERNO2024', 'valor_fixo', 5.00, 'Válido para todos os assinantes.', 0), 
(3, 'PRIMAVERA2024', 'porcentagem', 20.00, 'Válido para todos os assinantes.', 1),
(4, 'ANIVERSARIO2024', 'valor_fixo', 2.50, 'Válido para todos os assinantes.', 0), 
(5, 'HALLOWEEN2023', 'porcentagem', 10.00, 'Válido para todos os assinantes.', 1),
(6, 'NATAL2024', 'valor_fixo', 3.00, 'Válido para todos os assinantes.', 0),
(7, 'PASCOA2024', 'porcentagem', 25.00, 'Válido para todos os assinantes.', 1),
(8, 'VERAO2024', 'valor_fixo', 4.00, 'Válido para todos os assinantes.', 0), 
(9, 'BLACKFRIDAY2024', 'porcentagem', 30.00, 'Válido para todos os assinantes.', 1),
(10, 'BLACKFRIDAY2023', 'valor_fixo', 3.00, 'Válido para todos os assinantes.', 0),
(11, 'ANONOVO2023', 'valor_fixo', 6.00, 'Válido para todos os assinantes.', 0),
(12, 'CINEMAEMCASA2024', 'valor_fixo', 2.50, 'Válido para todos os assinantes.', 1),
(13, 'DIADASCRIANCAS2023', 'valor_fixo', 2.50, ' ', 1),
(14, 'SUPERVERAO2023', 'valor_fixo', 4.00, 'Válido para todos os assinantes.', 0); 

-- CRIANDO A TABELA clientes_promo_jumpflix
CREATE TABLE clientes_promo_jumpflix (
    id_cli_promo CHAR(4) PRIMARY KEY,
    codigo_promocional VARCHAR(20),
    pais VARCHAR(50),
    valor  DECIMAL(10, 2),
    quantidade INT,
    FOREIGN KEY (codigo_promocional) REFERENCES descricao_promo_jumpflix(codigo_promocional)
);

-- INSERINDO DADOS NA TABELA clientes_promo_jumpflix
INSERT INTO clientes_promo_jumpflix (id_cli_promo, codigo_promocional, pais,valor, quantidade) 
VALUES 
('001A', 'VERAO2023', 'Brasil',2.00 ,1000),
('002B', 'INVERNO2024', 'Estados Unidos',5.00 , 5005),
('003C', 'PRIMAVERA2024', 'França',3.00 , 75000),
('004D', 'ANIVERSARIO2024', 'Espanha',2.50 , 300),
('005E', 'HALLOWEEN2023', 'Estados Unidos',2.00  , 80050),
('015E', 'HALLOWEEN2023', 'Estados Unidos',2.00  , 80050),
('006F', 'NATAL2024', 'Japão',3.00  , 45000),
('007G', 'PASCOA2024', 'Alemanha',4.00 , 600),
('008H', 'VERAO2024', 'Brasil',4.00, 11000),
('025E', 'HALLOWEEN2023', 'Estados Unidos',2.00  , 80050),
('009I', 'BLACKFRIDAY2024', 'Canadá',5.00, 9000),
('010J', 'ANONOVO2023', 'Estados Unidos',6.00 ,  7000),
('012L', 'TERROR2023', ' ',2.00  , 80050),
('011K', 'DIADOSNAMORADOS2023', 'Brasil',3.00 ,  85000);



