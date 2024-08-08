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
values
(1, 'Oferta de verão', 'Desconto especial para novos clientes assinantes no verão!', '2024-06-01', '2024-08-31'),
(2,"Oferta Especial de Inverno", "Aproveite descontos exclusivos durante todo o inverno!", "2024-12-01", "2024-02-28"),
(3,"Promoção de Primavera", "Descontos especiais para filmes e séries de primavera!", "2024-03-01", "2024-5-31"),
(4,'Oferta de Aniversário', 'Celebre conosco e ganhe um desconto especial!', '2024-10-15', '2024-10-17'),
(5,'Promoção de Halloween', 'Aproveite o Halloween com descontos assustadores!', '2024-10-25', '2024-10-31');

DELETE FROM promocao_jumpflix
WHERE id_promocao = 15;

describe jumpflix_filmes;

ALTER TABLE jumpflix_filmes DROP COLUMN mes;

Insert into 
jumpflix_filmes(nome,classificacao_indicativa,tempo,data_lançamento)
values 
('Stranger Things', 15 , '60 min', '2016-07-15'),
('13 Reasons Why', 18,'60 min','2016-07-15'),
('Orange Is the New Black', 18 ,'59 min','2016-07-15'),
('Black Mirror', 18,'60 min','2016-07-15'),
('Money Heist', 15,'60 min','2016-07-15');
 
