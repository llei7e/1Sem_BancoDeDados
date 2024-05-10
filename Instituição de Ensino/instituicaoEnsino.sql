--------------------------------------------
--------------  COMANDOS DDL  --------------
--------------------------------------------


CREATE TABLE alunos (
	cpf bigint PRIMARY KEY,
	nome varchar(50) NOT null,
	idade int,
	pais varchar(20),
	estado varchar(50),
	cidade varchar(50),
	rua text,
	num_casa varchar(10)
);


CREATE TABLE email (
	cpf bigint,
	FOREIGN KEY (cpf) REFERENCES alunos(cpf),
	email varchar(64),
	dominio varchar(20)
);


CREATE TABLE telefone (
	cpf bigint,
	FOREIGN KEY (cpf) REFERENCES alunos(cpf),
	ddd int,
	telefone varchar(10)
);


CREATE TABLE departamentos (
	id_depto SERIAL PRIMARY KEY,
	nome_depto varchar(50)
);


CREATE TABLE cursos (
	id_curso SERIAL PRIMARY KEY,
	id_depto int,
	FOREIGN KEY (id_depto) REFERENCES departamentos(id_depto),
	nome_curso varchar(50)
);


CREATE TABLE matriculas (
	ra SERIAL PRIMARY KEY,
	cpf bigint,
	FOREIGN KEY (cpf) REFERENCES alunos(cpf),
	id_curso int,
	FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
	status varchar(8)
);


CREATE TABLE disciplinas (
	id_disciplina SERIAL PRIMARY KEY,
	nome_disc varchar(50),
	obrigatorio boolean
);


CREATE TABLE cursos_disciplinas(
	id_disciplina int,
	FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina),
	id_curso int,
	FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


CREATE TABLE matriculas_disciplinas (
	ra int,
	FOREIGN KEY (ra) REFERENCES matriculas(ra),
	id_disciplina int,
	FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
);



--------------------------------------------
--------------  COMANDOS DML  --------------
--------------------------------------------

INSERT INTO alunos VALUES (12345678901, 'Ronaldinho Gaucho', 17, 'Brasil', 'São Paulo', 'São Paulo', 'Rua Augusta', '225'),
						  (98765432109, 'Zinedine Zidane', 15, 'Brasil', 'São Paulo', 'Osasco', 'Avenida dos Autonomistas', '140'),
						  (55888632554, 'Thierry Henry', 16, 'Brasil', 'São Paulo', 'São Paulo', 'Rua Oscar Freire', '552'),
						  (67845678983, 'Steven Gerrard', 16, 'Brasil', 'São Paulo', 'São Paulo', 'Avenida 23 de Maio', '874'),
						  (76485398153, 'Ricardo Kaká', 25, 'Brasil', 'São Paulo', 'São Paulo', 'Avenida Rebouças', '5000');
						  
						  
INSERT INTO email VALUES 	(12345678901, 'r10', '@gmail.com'),
							(98765432109, 'z10', '@gmail.com'),
							(55888632554, 'henry10', '@gmail.com'),
							(67845678983, 'gerrard10', '@gmail.com'),
							(76485398153, 'kaka10', '@gmail.com');
							
							
INSERT INTO telefone VALUES (12345678901, 15, '99879-1122'),
							(98765432109, 11, '99879-5572'),
							(55888632554, 11, '99435-1122'),
							(67845678983, 11, '99433-5467'),
							(76485398153, 11, '99862-9873');
							
							
INSERT INTO departamentos (nome_depto) VALUES('Tecnologia da Informação'),
											 ('Medicina e Saude'),
											 ('Administração e Negócios'),
											 ('Artes e Design'),
											 ('Engenharia');
							
							 
INSERT INTO cursos (id_depto, nome_curso) VALUES (1, 'Analise e Desenvolvedor de Sistemas'),
												 (1, 'Ciencia de Dados'),
												 (1, 'Engenheria de Software'),
												 (5, 'Engenharia Mecatronica'),
												 (5, 'Engenharia Mecanica');
						  
						  
INSERT INTO matriculas (cpf, id_curso, status) VALUES (76485398153, 1, 'formado'),
													  (12345678901, 1, 'ativo'),
													  (67845678983, 4, 'ativo'),
													  (55888632554, 1, 'ativo'),
													  (98765432109, 4, 'ativo');
						 
								 
INSERT INTO disciplinas (nome_disc, obrigatorio) VALUES ('Lógica de Programação', true),
														('Ciencia de Dados', true),
														('Estatistica', true),
														('Machine Learning', true),
														('Engenharia de Software', true),
														('Desenvolvimento Ágil de Software', true),
														('Sistemas Mecatronicos', true),
														('Automação e Controle', true),
														('Materiais e Processos de Fabricação', true),
														('Projetos de Maquinas', true);
							  
							  
INSERT INTO cursos_disciplinas VALUES (1,1),
									  (2,1),
									  (3,2),
									  (4,2),
									  (5,3),
									  (6,3),
									  (7,4),
									  (8,4),
									  (9,5),
									  (10,5);
									  
									  
INSERT INTO matriculas_disciplinas VALUES(1,1),
										 (1,2),
										 (2,1),
										 (2,2),
										 (3,7),
										 (3,8),
										 (4,1),
										 (4,2),
										 (5,7),
										 (5,8);							


UPDATE cursos SET nome_curso = 'Analise e Desenvolvimento de Sistemas' WHERE id_curso = 1

--------------------------------------------
--------------  COMANDOS DQL  --------------
--------------------------------------------


SELECT * FROM alunos
SELECT * FROM email
SELECT * FROM telefone
SELECT * FROM matriculas
SELECT * FROM cursos
SELECT * FROM departamentos
SELECT * FROM disciplinas
SELECT * FROM cursos_disciplinas
SELECT * FROM matriculas_disciplinas


--------------------------------------------------------------------------------------------------------------------------------------------

-- Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT matriculas.status, alunos.cpf,matriculas.ra, alunos.nome, alunos.idade, alunos.pais, alunos.estado, alunos.cidade, alunos.rua,
alunos.num_casa, email.email, email.dominio, telefone.ddd, telefone.telefone
FROM alunos NATURAL INNER JOIN matriculas NATURAL INNER JOIN email
NATURAL INNER JOIN telefone
WHERE matriculas.ra = 1 OR alunos.nome = 'Ricardo Kaká'



--------------------------------------------------------------------------------------------------------------------------------------------

-- Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT cursos.nome_curso, departamentos.nome_depto FROM cursos NATURAL INNER JOIN departamentos 
WHERE departamentos.nome_depto = 'Tecnologia da Informação'



--------------------------------------------------------------------------------------------------------------------------------------------

-- Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT  disciplinas.nome_disc, cursos.nome_curso FROM disciplinas NATURAL INNER JOIN cursos_disciplinas NATURAL INNER JOIN cursos
WHERE disciplinas.nome_disc = 'Sistemas Mecatronicos'



--------------------------------------------------------------------------------------------------------------------------------------------

-- Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT alunos.cpf, disciplinas.nome_disc FROM alunos NATURAL INNER JOIN matriculas 
NATURAL INNER JOIN matriculas_disciplinasNATURAL INNER JOIN disciplinas 
WHERE alunos.cpf = '67845678983'



--------------------------------------------------------------------------------------------------------------------------------------------

-- Filtrar todos os alunos matriculados em um determinado curso.
SELECT alunos.nome, cursos.nome_curso FROM cursos NATURAL INNER JOIN matriculas NATURAL INNER JOIN alunos 
WHERE cursos.nome_curso = 'Analise e Desenvolvimento de Sistemas'



--------------------------------------------------------------------------------------------------------------------------------------------

-- Filtrar todos os alunos matriculados em determinada disciplina.
SELECT alunos.nome, disciplinas.nome_disc FROM disciplinas
NATURAL INNER JOIN matriculas_disciplinas NATURAL INNER JOIN matriculas NATURAL INNER JOIN alunos 
WHERE disciplinas.nome_disc = 'Lógica de Programação'



--------------------------------------------------------------------------------------------------------------------------------------------

-- Filtrar alunos formados.
SELECT * FROM alunos LEFT JOIN matriculas USING (cpf) WHERE matriculas.status = 'formado'



--------------------------------------------------------------------------------------------------------------------------------------------

-- Filtrar alunos ativos.
SELECT * FROM alunos LEFT JOIN matriculas USING (cpf) WHERE matriculas.status = 'ativo'



--------------------------------------------------------------------------------------------------------------------------------------------

-- Apresentar a quantidade de alunos ativos por curso. (feito de DUAS FORMAS)
-- FORMA 1
SELECT 
COUNT (CASE WHEN id_curso = 1 THEN 1 END) AS A_d_s,
COUNT (CASE WHEN id_curso = 2 THEN 1 END) AS Ciencia_de_Dados,
COUNT (CASE WHEN id_curso = 3 THEN 1 END) AS Engenharia_de_Software,
COUNT (CASE WHEN id_curso = 4 THEN 1 END) AS Engenharia_Mecatronica,
COUNT (CASE WHEN id_curso = 5 THEN 1 END) AS Engenharia_Mecanica
FROM alunos NATURAL INNER JOIN matriculas NATURAL INNER JOIN cursos WHERE matriculas.status = 'ativo'


-- FORMA 2
SELECT
	cursos.nome_curso,
	COUNT (alunos.nome) AS Quantidade_de_Alunos
FROM alunos 
NATURAL INNER JOIN matriculas
NATURAL INNER JOIN cursos
WHERE matriculas.status = 'ativo'
GROUP BY cursos.nome_curso



--------------------------------------------------------------------------------------------------------------------------------------------

-- Apresentar a quantidade de alunos ativos por disciplina. (feito de DUAS FORMAS)
-- FORMA 1
SELECT
COUNT (CASE WHEN id_disciplina = 1 THEN 1 END) AS Linguagem_Programacao,
COUNT (CASE WHEN id_disciplina = 2 THEN 1 END) AS Ciencia_dados,
COUNT (CASE WHEN id_disciplina = 3 THEN 1 END) AS estatistica,
COUNT (CASE WHEN id_disciplina = 4 THEN 1 END) AS machine_learning,
COUNT (CASE WHEN id_disciplina = 5 THEN 1 END) AS engenharia_software,
COUNT (CASE WHEN id_disciplina = 6 THEN 1 END) AS dev_agil_software,
COUNT (CASE WHEN id_disciplina = 7 THEN 1 END) AS sistemas_mecatronicos,
COUNT (CASE WHEN id_disciplina = 8 THEN 1 END) AS automacao_e_controle,
COUNT (CASE WHEN id_disciplina = 9 THEN 1 END) AS materiais_e_processos_fabricacao,
COUNT (CASE WHEN id_disciplina = 10 THEN 1 END) AS projetos_de_maquinas
FROM alunos NATURAL INNER JOIN matriculas NATURAL INNER JOIN matriculas_disciplinas 
NATURAL INNER JOIN disciplinas WHERE matriculas.status = 'ativo'


-- FORMA 2
SELECT 
	disciplinas.nome_disc,
	COUNT (alunos.nome) AS Quantidade_de_Alunos
FROM 
	alunos
NATURAL INNER JOIN
	matriculas
NATURAL INNER JOIN
	matriculas_disciplinas
NATURAL INNER JOIN
	disciplinas
WHERE 
	matriculas.status = 'ativo'
GROUP BY 
	disciplinas.nome_disc