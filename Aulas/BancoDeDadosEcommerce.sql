--***************************************--
--COMANDOS DDL (DATA DEFINITION LANGUAGE)--
--***************************************--

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



DROP TABLE product;

DROP TABLE client CASCADE;

CREATE TABLE clients (
	idclient SERIAL PRIMARY KEY,
	cpf varchar(14),
	firstname text,
	lastname text,
	address text
);

CREATE TABLE products (
	idproduct SERIAL PRIMARY KEY,
	idclient int,
	CONSTRAINT fk_client FOREIGN KEY (idclient) REFERENCES clients (idclient),
	productname varchar(50),
	brand varchar(20),
	category varchar(20),
	discount numeric,
	price numeric
);

INSERT INTO clients (cpf,firstname,lastname,address) VALUES
('000.000.000-00','Rodrigo','Junior','Rua 00, 000, Bairro 0'),
('111.111.111-11','Joao','Silva','Rua 01, 100, Bairro 1'),
('222.222.222-22','Maria','Gomez','Rua 02, 200, Bairro 2'),
('333.333.333-33','José','Andrade','Rua 03, 300, Bairro 3'),
('444.444.444-44','Bruno','Silveira','Rua 04, 400, Bairro 4'),
('555.555.555-55','Ana','Cabral','Rua 05, 500, Bairro 5'),
('666.666.666-66','Lucia','Silva','Rua 06, 600, Bairro 6'),
('777.777.777-77','Antonio','Mange','Rua 07, 700, Bairro 7'),
('888.888.888-88','Nicolas','Silva','Rua 08, 800, Bairro 8'),
('999.999.999-99','Sandra','Fourlan','Rua 09, 900, Bairro 9');

INSERT INTO products (idclient,productname,brand,category,discount,price) VALUES
(2,'Headset','jbl','eletronicos',0.1,195.89),
(1,'notebook','dell','eletronicos',0.12,3500.00),
(10,'cadeira gammer','dragon','imobiliario',0.0,1630.9),
(2,'mesa para computador','dragon','imobiliario',0.0,695.89),
(1,'mouse','dell','eletronicos',0.12,124.79),
(3,'prateleira',null,'imobiliario',0.0,80.9),
(5,'postit','faber castel','papelaria',0.02,5.29),
(8,'lapiseira','pentel','papelaria',0.02,18.9);

-- COMANDOS DQL (Data Query Language) --

-- Vizualizando a tabela de clients
SELECT * FROM clients

-- Selecionando Colunas especificas clients
SELECT idclient, firstname, lastname FROM clients

-- Vizualizando a tabela de produtos
SELECT * FROM products

-- Selecionando Colunas especificas clients, visualizando uma coluna de calculo e nomeando
SELECT productname, price, discount, price*discount AS "desconto em reais" FROM products


-- DESAFIO: Exibir o nome do produto, preço e preço com disconto
SELECT productname, price, price-(price*discount) AS "preço com desconto" FROM products

-- Exibe valores sem repetição
SELECT DISTINCT brand FROM products

-- Calculadora
SELECT 3*4, 11%2, 2^3, ||/27

-- Funções
SELECT random()

-- SELECT com clausula WHERE
-- Operadores de comparacao >, <, >=, <=, =, <> ou !=
-- Exibir produtos com valor acima de 100 reais
SELECT productname, price FROM products 
WHERE price >= 100

-- Operadores logicos: AND, OR ou NOT
-- Exibir produtos com valor entre 100 e 800 reais
SELECT productname, price FROM products
WHERE price >= 100 AND price <=800

-- Alternativa
SELECT productname, price FROM products
WHERE price BETWEEN 100 AND 800

-- Produtos cujo preco esteja abaixo de 100 e acima de 800
SELECT productname, price FROM products
WHERE price <= 100 OR price >= 800

-- DESAFIO: listar todos os produtos da marca DELL
SELECT productname, brand FROM products
WHERE brand = 'dell'

-- DESAFIO: listar todos os produtos comprados por JOAO
SELECT productname, brand FROM products
WHERE idclient = 2

-- alternativa
SELECT productname FROM products
WHERE idclient = (SELECT idclient FROM clients
					  WHERE firstname = 'Rodrigo')
				  
-- DESAFIO: listar cliente com id par
SELECT productname, brand FROM products
WHERE idclient%2 = 0

-- FUNÇÕES --

-- função COUNT
-- Quantos produtos foram vendidos no total
SELECT COUNT(idproduct) FROM products

-- função AVG (AVERAGE) 
-- Qual o prec medio dos podutos vendidos
SELECT AVG(price) FROM products

-- função MAX (maximo)
-- Qua o preco mais alto negociado
SELECT MAX(price) FROM products

-- função MIN (minimo)
-- Qua o preco mais baixo negociado
SELECT MIN(price) FROM products

-- função SUM (soma)
-- qual o valor total vendido
SELECT SUM(price) FROM products

-- função ORDER BY (ordenação de valores)
-- ordenar coluna de forma crescente ou descendente(DESC);
SELECT * FROM clients
ORDER BY firstname DESC

-- Exercícios:

-- 1. Quantos produtos da marca dell foram vendidos?
SELECT COUNT(idproduct) FROM products
WHERE brand = 'dell'

-- 2. Quantos produtos João comprou?
SELECT COUNT(productname) FROM products
WHERE idclient = (SELECT idclient FROM clients WHERE firstname = 'Joao')

-- 3. Qual o preço médio dos produtos da dell?
SELECT AVG(price) FROM products
WHERE brand = 'dell'

-- 4. Qual o produto mais caro vendido?
SELECT productname, price FROM products
WHERE price = (SELECT MAX(price) FROM products)

-- 5. Qual o produto mais barato vendido?
SELECT productname, price FROM products
WHERE price = (SELECT MIN(price) FROM products)

-- 6. Qual o valor total de equipamentos dell vendidos?
SELECT SUM(price) FROM products
WHERE brand = 'dell'

-- 7. Quanto Rodrigo já gastou no eCommerce?
SELECT SUM(price) FROM products
WHERE idclient = (SELECT idclient FROM clients WHERE firstname = 'Rodrigo' )

-- 8. Exiba todos os produtos da catergoria eletronicos ordenados do mais barato para o mais caro.
SELECT productname, price FROM products WHERE category = 'eletronicos'
ORDER BY price

-- 9. Exiba todos os produtos comprados por Rodrigo ordenados do mais caro para o mais barato.
SELECT productname, price FROM products
WHERE idclient = (SELECT idclient FROM clients WHERE firstname = 'Rodrigo' )
ORDER BY price DESC

SELECT * FROM products

--****************************--
--         Preparação         --
--****************************--

-- Adicionar produtos que não foram comprados
INSERT INTO products (productname,brand,category,discount,price) VALUES
('impressora','hp','eletronicos',0.12,489.9),
('luminaria','ge','eletronicos',0.5,46.80),
('drone','dji','eletronico',0.12,9856.0)

-- Cross join (lixo)

SELECT * FROM clients, products
SELECT * FROM products, clients
SELECT * FROM clients CROSS JOIN products


-- Inner Join (Relaciona por PK/FK)

SELECT firstname,productname FROM clients INNER JOIN products
ON clients.idclient = products.idclient WHERE firstname = 'Rodrigo' OR firstname = 'rodrigo'

SELECT * FROM clients INNER JOIN products USING (idclient) -- comando de cima simplificado (usando idclient pra juntar)

SELECT * FROM clients NATURAL INNER JOIN products --Puxa PK por ser Natural