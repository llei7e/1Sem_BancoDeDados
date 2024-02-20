--***************************************--
--COMANDOS DDL (DATA DEFINITION LANGUAGE)--
--***************************************--

--Criando tabela de Clientes e Produtos--

CREATE TABLE client (
	idCLient int primary key,
	cpf varchar(14) unique,	
	firstName text,
	lastName text,
	address text
);

CREATE TABLE product (
	idProduct int primary key,
	productName varchar(50),
	branch varchar(20),
	category varchar(50),
	price decimal
);


-- FAZER ALTERAÇÕES NA TABELA --
-- RENOMEANDO UMA COLUNA BRANCH - BRANCH --
ALTER TABLE product RENAME COLUMN branch TO brand

-- ALTERANDO UM TIPO DE DADO DE UMA COLUNA --
ALTER TABLE client ALTER COLUMN adress TYPE varchar(50)

-- ADICIONANDO COLUNA --
ALTER TABLE product ADD COLUMN aaa text

-- APAGAR COLUNA --
ALTER TABLE product DROP COLUMN aaa

-- ADICIONANDO FOREIGN KEY --
ALTER TABLE product ADD COLUMN idClient int
ALTER TABLE product ADD FOREIGN KEY (idClient) REFERENCES client

-- ADICIONANDO RESTRIÇÕES --
ALTER TABLE product ALTER COLUMN productName SET NOT NULL


--**********************************--
--COMANDOS DQL (DATA QUERY LANGUAGE)--
--**********************************--


SELECT * FROM product
SELECT * FROM client


--*****************************************--
--COMANDOS DML (DATA MANIPULATION LANGUAGE)--
--*****************************************--

-- Inserir dados na tabela (é necessario saber a ordem das colunas)
INSERT INTO Client VALUES (1,'312.456.545-98','Josvaldo','Silveira','Rua do Senai');
INSERT INTO Client VALUES (2,'222.222.222-22','Joanderson',null,'Rua da casa dele');

-- Inserindo dados em ordem aleatória --
INSERT INTO Client (cpf, firstName, idCLient, lastName, address) 
VALUES ('333.333.333-33','Joanderson',3,null,'Rua da casa dele');

-- Inserindo dados com dados faltando (null) --
INSERT INTO Client (cpf, firstName, idCLient) 
VALUES ('444.444.444-44','Joannesburgo',4);

INSERT INTO Client (idCLient, cpf, firstName, lastName, address) 
VALUES (5,null,'Joannesburgo',null,null);

-- Sobrescrever dados da tabela (não esquecer id a ser alterado)--
UPDATE client SET address = 'Rua certa agora'
WHERE idClient = 1

INSERT INTO product (idProduct, productName, brand, category, price, idClient) 
VALUES (82,'Garrafa Dagua','BonaFont','Bebidas',1.99, 2);

INSERT INTO product (idProduct, productName, brand, category, price, idClient) 
VALUES (550,'Notebook','DELL','Eletronico',3890.89,1);

INSERT INTO product (idProduct, productName, brand, category, price, idClient) 
VALUES (10,'Refrigerante de Cola Original','Coca Cola','Bebidas',10.90, 4);

INSERT INTO product (idProduct, productName, brand, category, price, idClient) 
VALUES (35,'Copo Americano','Copo de Requeijao','Utensilios',5.90, 1);

INSERT INTO product (idProduct, productName, brand, category, price, idClient) 
VALUES (175,'Conjunto 5 pratos','marca de prato','Utensilios',100.90, 5);

-- REAJUSTAR PREÇO EM DESCONTO DE 10,00 REAIS PARA PRODUTOS ACIMA DE 50,00 REAIS --
UPDATE product SET price = price -10
WHERE price >50

-- Reajustar preço em 5,00 reais para produtos entre 1,00 e 80,00 --
UPDATE product SET price = price +5
WHERE price >= 1 AND price <= 80

-- Ceder desconto de 50% para todos os produtos acima de 1,00 real e abaixo de 70,00 reais --
UPDATE product SET price = price /2
WHERE price < 1 OR price > 70
