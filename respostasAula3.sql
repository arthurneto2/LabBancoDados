create or replace view estudantes_portugues (nome, matricula) as
select e.nome, e.matricula
from estudante e 
inner join cursa on cursa.matricula_est = e.matricula
inner join disciplina on disciplina.codigo = cursa.cod_disc
where disciplina.descricao = 'Portugues'

select * from estudantes_portugues ep

create or replace view estudantes_portugues (nome, matricula, rg) as
select e.nome, e.matricula, e.rg
from estudante e 
inner join cursa on cursa.matricula_est = e.matricula
inner join disciplina on disciplina.codigo = cursa.cod_disc
where disciplina.descricao = 'Portugues'

select * from estudantes_portugues ep

create or replace view numero_estudante_turma as
select codigo, count(estudante.matricula)
from turma
inner join estudante on estudante.cod_turma = turma.codigo
group by turma.codigo
order by turma.codigo

select * from numero_estudante_turma

drop view numero estudante_turma