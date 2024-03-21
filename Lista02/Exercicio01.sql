select * from livros
select * from Autor
select * from livros_autor

CREATE TABLE livros(
	isbn int primary key,
	titulo varchar(150),
	editora varchar(150),
	anoPubli integer
)
CREATE TABLE livros_Autor(
	isbn int,
	CONSTRAINT fk_isbn FOREIGN KEY (isbn) REFERENCES livros (isbn),
	idAutor int,
	CONSTRAINT fk_Autor FOREIGN KEY (idAutor) REFERENCES Autor (idAutor)	
)

ALTER TABLE livros_autor ALTER COLUMN isbn TYPE bigint;

INSERT INTO livros VALUES(9845663802345, 'Dom Quixote', 'Nova Fronteira', 1605)
INSERT INTO livros VALUES(9321823942432, 'A Divina Comédia', 'Martin Claret', 1308);
INSERT INTO livros VALUES(9312312312843, 'Orgulho e Preconceito', 'Martin Claret', 1813);
INSERT INTO livros VALUES(9745935743445, '1984', 'Companhia das Letras', 1949);
INSERT INTO livros VALUES(9875694594354, 'O Apanhador no Campo de Centeio', 'J.D. Salinger', 1951);
INSERT INTO livros VALUES(9852423432423, 'Cem Anos de Solidão', 'Record', 1967);
INSERT INTO livros VALUES(9641384914732, 'Crime e Castigo', 'Martin Claret', 1866);
INSERT INTO livros VALUES(9338193812731, 'O Senhor dos Aneis', 'Martins Fontes', 1954);
INSERT INTO livros VALUES(9043781231311, 'Harry Potter', 'Rocco', 1997);
INSERT INTO livros VALUES(9238194381412, 'A Revolução dos Bichos', 'Companhia das Letras', 1945);
INSERT INTO livros VALUES(9184378423421, 'O Pequeno Principe', 'Agir', 1943);

INSERT INTO livros_autor VALUES(9845663802345,1);
INSERT INTO livros_autor VALUES(9321823942432,2);
INSERT INTO livros_autor VALUES(9312312312843,3);
INSERT INTO livros_autor VALUES(9745935743445,4);
INSERT INTO livros_autor VALUES(9875694594354,5);
INSERT INTO livros_autor VALUES(9852423432423,6);
INSERT INTO livros_autor VALUES(9641384914732,7);
INSERT INTO livros_autor VALUES(9338193812731,8);
INSERT INTO livros_autor VALUES(9043781231311,9);
INSERT INTO livros_autor VALUES(9238194381412,10);
INSERT INTO livros_autor VALUES(9184378423421,11);

INSERT INTO Autor VALUES(1,'Miguel de Cervantes');
INSERT INTO Autor VALUES(2,'Dante Alighieri');
INSERT INTO Autor VALUES(3,'Jane Austen');
INSERT INTO Autor VALUES(4,'George Orwell');
INSERT INTO Autor VALUES(5,'J.D. Salinger');
INSERT INTO Autor VALUES(6,'Gabriel García Márquez');
INSERT INTO Autor VALUES(7,'Miguel de Cervantes');
INSERT INTO Autor VALUES(8,'J.R.R. Tolkien');
INSERT INTO Autor VALUES(9,'J.K. Rowling');
INSERT INTO Autor VALUES(10,'George Orwell');
INSERT INTO Autor VALUES(11,'Antoine de Saint-Exupéry');
