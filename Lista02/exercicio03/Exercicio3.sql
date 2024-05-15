select * from funcionarios_projetos
SELECT * from funcionarios
select * from projetos

-- a.
SELECT funcionarios.nomefunc, projetos.nomeproj FROM (projetos NATURAL INNER JOIN funcionarios_projetos)
NATURAL INNER JOIN funcionarios WHERE projetos.nomeproj = 'Banco de dados Escola(x)'

-- b.
SELECT funcionarios.nomefunc, projetos.nomeproj FROM (projetos NATURAL INNER JOIN funcionarios_projetos)
NATURAL INNER JOIN funcionarios WHERE funcionarios.nomefunc = 'Marco Polo'

-- c.
SELECT 
	COUNT (funcionarios.nomefunc)/ COUNT (projetos.idprojetos) AS funcionarios_por_projeto
FROM 
	funcionarios
NATURAL INNER JOIN
	funcionarios_projetos
NATURAL INNER JOIN
	projetos
