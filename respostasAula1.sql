CREATE TABLE localizacao(
	codigolocal INTEGER,
	deptnumero INTEGER,
	nomelocal VARCHAR(30),
	PRIMARY KEY (codigolocal),
	FOREIGN KEY (deptnumero) REFERENCES departamento (dnumero)
);

INSERT INTO localizacao (codigolocal, deptnumero, nomelocal)
VALUES (1, 5, 'São Paulo');

INSERT INTO localizacao (codigolocal, deptnumero, nomelocal)
VALUES (2, 4, 'Curitiba'),(3, 1, 'Belo Horizonte');

SELECT codigolocal, deptnumero, nomelocal FROM localizacao;

UPDATE departamento SET gerentecpf = 1234555555
WHERE dnumero = 1;

SELECT gerentecpf FROM departamento
WHERE dnumero = 1;

SELECT pnome, unome, salario FROM funcionario
WHERE salario > 30000;

SELECT pnome, endereco FROM funcionario
INNER JOIN departamento ON departamento.dnome = 'Pesquisa';

SELECT funcionario.unome, trabalhaem.horas 
FROM funcionario
INNER JOIN trabalhaem ON trabalhaem.projetonumero = 3
ORDER BY trabalhaem.horas DESC;

SELECT pnome, unome
FROM funcionarios
INNER JOIN trabalhaem ON funcionario.cpf = trabalhaem.funcionariocpf
INNER JOIN projetos ON trabalhaem.projetonumero = projeto.projnumero
WHERE projetos.projnome = 'Transmogrifador'

SELECT 
	f.pnome AS nome_funcionario,
	f.unome AS sobrenome_funcionario,
	s.pnome AS nome_supervisor,
	s.unome AS sobrenome_supervisor
FROM funcionario f
LEFT JOIN departamento ON f.numerodept = departamento.dnumero
LEFT JOIN funcionario s ON departamento.gerentecpf = s.cpf;
