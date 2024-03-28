CREATE TABLE Paciente(
	idPaciente int primary key,
	nomePac varchar(100),
	dataNasc date
);

CREATE TABLE Medico(
	idMedico int primary key,
	nomeMed varchar(100),
	especializacao varchar(50)
);

CREATE TABLE paciente_medico(
	idConsulta int primary key,
	idPaciente int,
	CONSTRAINT fk_paciente FOREIGN KEY (idPaciente) REFERENCES paciente (idpaciente),
	idMedico int,
	CONSTRAINT fk_medico FOREIGN KEY (idMedico) REFERENCES medico (idmedico) 
);

ALTER TABLE paciente_medico ADD dataConsulta date;

SELECT * FROM paciente
SELECT * FROM medico
SELECT * FROM paciente_medico

INSERT INTO paciente VALUES(1,'Leonardo DiCaprio', '11/11/1974'),
						   (2,'Meryl Streep', '22/06/1949'),
						   (3,'Tom Hanks', '09/06/1956'),
						   (4,'Denzel Washington', '28/12/1954'),
						   (5,'Julia Roberts', '28/10/1967'),
						   (6,'Brad Pitt', '18/12/1963'),
						   (7,'Jennifer Lawrence', '15/08/1990'),
						   (8,'Robert De Niro', '17/08/1943'),
						   (9,'Charlize Theron', '07/08/1975'),
						   (10,'George Clooney', '06/05/1961');

INSERT INTO medico VALUES (1, 'Nicole Kidman','Anestesista'),
						  (2, 'Johnny Depp','Cardiologista'),
						  (3, 'Sandra Bullok','Dermatologista'),
						  (4, 'Will Smith','Endocrinologista'),
						  (5, 'Scarlett Johansson','Gastroenerologista'),
						  (6, 'Daniel Day-Lewis','Ginecologista'),
						  (7, 'Emma Watson','Hematologista'),
						  (8, 'Morgan Freeman','Infectologista'),
						  (9, 'Cate Blanchett','Neurocirurgiao'),
						  (10, 'Hugh Jackman','Oncologista');
						  
INSERT INTO paciente_medico VALUES (1,1,5,'10/08/2022'),
								   (2,3,6,'12/08/2022'),
								   (3,6,2,'21/09/2022'),
								   (4,2,1,'28/09/2022'),
								   (5,8,2,'05/10/2022'),
								   (6,9,7,'07/10/2022'),
								   (7,7,9,'17/11/2022'),
								   (8,10,8,'08/01/2023'),
								   (9,5,10,'20/01/2023'),
								   (10,4,4,'21/04/2023');
								   
UPDATE paciente_medico SET idMedico = 1 WHERE idmedico = 4;
UPDATE paciente_medico SET idMedico = 1 WHERE idmedico = 5;
								   
-- a.
SELECT paciente.nomepac, medico.nomemed FROM (paciente NATURAL INNER JOIN paciente_medico)
NATURAL INNER JOIN medico WHERE medico.nomemed = 'Nicole Kidman'

-- b.
SELECT paciente.nomepac, medico.nomemed FROM (paciente NATURAL INNER JOIN paciente_medico)
NATURAL INNER JOIN medico WHERE paciente.nomepac = 'Leonardo DiCaprio'

-- c.

