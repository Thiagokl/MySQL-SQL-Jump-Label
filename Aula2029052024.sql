-- Aula 20 REVER a AULA

DROP SCHEMA IF EXISTS DUPLICADOS;
CREATE SCHEMA DUPLICADOS;
USE DUPLICADOS;
 
CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto VARCHAR(50),
    quantidade INT,
    data_venda DATE
);
 
 
INSERT INTO vendas (produto, quantidade, data_venda) VALUES
('Produto A', 10, '2023-05-01'),
('Produto B', 5, '2023-05-02'),
('Produto A', 10, '2023-05-01'), -- duplicado
('Produto C', 7, '2023-05-03'),
('Produto B', 5, '2023-05-02'), -- duplicado
('Produto A', 10, '2023-05-01'),
 ('Produto A', 20, '2023-05-01'),
 ('Produto A', 20, '2023-05-02'),
 ('Produto B', 30, '2024-06-11'),
('Produto C', 20, '2023-05-01'); -- duplicado


CREATE TABLE empregados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    departamento VARCHAR(50),
    salario DECIMAL(10, 2)
);
 
INSERT INTO empregados (nome, departamento, salario) VALUES
('Alice', 'Vendas', 5000.00),
('Bob', 'Vendas', 6000.00),
('Charlie', 'TI', 7000.00),
('Dave', 'TI', 6500.00),
('Eve', 'Vendas', 5500.00);

CREATE TABLE transacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(50),
    valor DECIMAL(10, 2),
    canal VARCHAR(50),
    data_transacao DATE
);
 
INSERT INTO transacoes (cliente, valor, canal,data_transacao) VALUES
('Alice', 100.00,'PIX' ,'2023-05-01'),
('Bob', 200.00, 'DINHEIRO','2023-05-02'),
('Alice', 100.00,'DINHEIRO', '2023-05-01'), 
('Charlie', 300.00, 'PIX','2023-05-03'),
('Bob', 200.00,'PIX' ,'2023-05-02'), 
('Alice', 150.00, 'PIX','2023-05-04'),
('Charlie', 300.00,'DINHEIRO' ,'2023-05-03');


/*Remova os cliente com valor de transação duplicado*/

SELECT * FROM transacoes;

SELECT
		*,
		row_number() OVER (partition by cliente, data_transacao order by valor) AS ROW_NUM
FROM transacoes;

  
/*Obtenha os tops dois clientes com maior valor por canal*/

   SELECT
		cliente,
        valor, 
        canal, 
        data_transacao
	FROM (
			SELECT
			  *,
				row_number() OVER (partition by cliente, data_transacao order by valor) AS ROW_NUM
			FROM transacoes) AS tabela01
			WHERE ROW_NUM =1;
 
/*Obtenha os tops dois clientes com maior valor por canal*/

SELECT 
  *
FROM 
    (SELECT *, ROW_NUMBER() OVER (PARTITION BY canal ORDER BY valor DESC) as row_num
		FROM transacoes) as tabela29
			WHERE row_num <= 2;


-- CTE
with teste as (
select
	 id,
	 cliente,
	 valor,
	 canal,
	 data_transacao, 
	 row_number() OVER ( partition by canal ORDER BY valor desc) row_num
from transacoes
)
select
	*
from teste
where row_num <=2;


select * FROM empregados;

SELECT
    id,
    nome,
    departamento,
    salario,
    ROW_NUM
		FROM (
			SELECT
					id,
					nome,
					departamento,
					salario,
					ROW_NUMBER() OVER (PARTITION BY departamento ORDER BY salario DESC) AS ROW_NUM
			FROM empregados
) AS T1
WHERE ROW_NUM <= 2;

select 
		id, 
		nome, 
		departamento, 
		salario 
from ( select 
			id, 
            nome, 
            departamento, 
            salario, 
            row_number() over (partition by departamento order by salario DESC) as row_num 
            from empregados ) as sub 
				where row_num = 2;

select 
	id,
	nome,
	departamento,
	salario,
row_number() over (partition by departamento order by salario DESC) as row_num
from empregados;

select 
	id,
	nome,
	departamento,
	departamento,
row_number() over (order by salario DESC) as row_num
from empregados;





select 
produto,
quantidade
from ( select 
			*,
            row_number() over(partition by produto, quantidade, data_venda order by ID) row_num
            from vendas) as sub
            where row_num = 1;
            
            with teste as (
							select 
							*,
							row_number() over(partition by produto, quantidade, data_venda order by ID) row_num
							from vendas) as sub
							where row_num = 1;
            

