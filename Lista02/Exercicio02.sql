CREATE TABLE ALunos(
	idAluno int primary key,
	nomeAluno varchar(100),
	dataNasc date
)

CREATE TABLE Curso (
	idCurso int primary key,
	nomeCurso varchar(50)
)

CREATE TABLE turmas(
	idTurma int primary key,
	idCurso int,
	CONSTRAINT fk_curso FOREIGN KEY (idCurso) REFERENCES curso (idCurso),
	prof_responsavel varchar(100)
)

CREATE TABLE alunos_turmas(
	idTurma int,
	CONSTRAINT fk_turma FOREIGN KEY (idTurma) REFERENCES turmas(idTurma),
	idAluno int,
	CONSTRAINT fk_aluno FOREIGN KEY (idAluno) REFERENCES alunos (idAluno) 
)

INSERT INTO alunos VALUES(1,'Charlie Brown','20/10/2000')
INSERT INTO alunos VALUES(2,'Axel Rose','20/10/2000');
INSERT INTO alunos VALUES(3,'Elvis Presley','20/10/2000');
INSERT INTO alunos VALUES(4,'John Lennon','20/10/2000');
INSERT INTO alunos VALUES(5,'Paul Macartney','20/10/2000');
INSERT INTO alunos VALUES(6,'George Harrison','20/10/2000');
INSERT INTO alunos VALUES(7,'Mick Jagger','20/10/2000');
INSERT INTO alunos VALUES(8,'Keith Richards','20/10/2000');
INSERT INTO alunos VALUES(9,'Roger Waters','20/10/2000');
INSERT INTO alunos VALUES(10,'Freddie Mercury','20/10/2000');

INSERT INTO curso VALUES(1,'Técnico em Informatica');
INSERT INTO curso VALUES(2,'Técnico em Enfermagem');
INSERT INTO curso VALUES(3,'Técnico em Contablidade');
INSERT INTO curso VALUES(4,'Técnico em Eletronica');
INSERT INTO curso VALUES(5,'Técnico em Administração');
INSERT INTO curso VALUES(6,'Técnico em Segurança do Trabalho');
INSERT INTO curso VALUES(7,'Técnico em Mecanica');
INSERT INTO curso VALUES(8,'Técnico em Logistica');
INSERT INTO curso VALUES(9,'Técnico em Radiologia');
INSERT INTO curso VALUES(10,'Técnico em Alimentos');

INSERT INTO turmas VALUES(1, 2,'Marcos Assunção');
INSERT INTO turmas VALUES(2, 4,'Ronaldinho Gaucho');
INSERT INTO turmas VALUES(3, 6,'Arthur Antunes Coimbra');
INSERT INTO turmas VALUES(4, 2,'Romario de Souza Faria');
INSERT INTO turmas VALUES(5, 5,'Marcos Evangelista de Morais');
INSERT INTO turmas VALUES(6, 8,'Roberto Carlos da Silva');
INSERT INTO turmas VALUES(7, 3,'Marta Vieira da Silva');
INSERT INTO turmas VALUES(8, 9,'Roberto Rivellino');
INSERT INTO turmas VALUES(9, 10,'José Roberto Gama de Oliveira');
INSERT INTO turmas VALUES(10, 1,'Rivaldo Vitor Borba Ferreira');

INSERT INTO alunos_turmas VALUES(1,2);
INSERT INTO alunos_turmas VALUES(2,3);
INSERT INTO alunos_turmas VALUES(3,6);
INSERT INTO alunos_turmas VALUES(4,7);
INSERT INTO alunos_turmas VALUES(5,8);
INSERT INTO alunos_turmas VALUES(6,9);
INSERT INTO alunos_turmas VALUES(7,1);
INSERT INTO alunos_turmas VALUES(8,3);
INSERT INTO alunos_turmas VALUES(9,10);
INSERT INTO alunos_turmas VALUES(10,3);



SELECT * FROM alunos
SELECT * FROM curso
SELECT * FROM turmas
SELECT * FROM alunos_turmas