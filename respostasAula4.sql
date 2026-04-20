create table tb_log_estudante(
	codigo serial not null,
	matricula_est integer,
	comando varchar(50),
	usuario varchar(20),
	data_hora timestamp,
	primary key (codigo)
	
);

create or replace rule rl_insere_estudante as
on insert to estudante
do also
	insert into tb_log_estudante(matricula_est, comando, usuario, data_hora)
	values(new.matricula, 'INSERT', current_user, now());


insert into estudante values (8, 3, 'Arthur Roberto', '11434177637', 'rua turmalina', '(38)99745-0827', '2002-12-02')

select * from tb_log_estudante tle 

create or replace rule rl_update_estudante as
on update to estudante
where old.telefone is distinct from new.telefone
do also
	insert into tb_log_estudante(matricula_est, comando, usuario, data_hora)
	values (old.matricula, 'ALT_FONE', current_user, now())
	
update estudante set endereco = 'Rua Francisco de Paula Moura Neto' where rg = '11434177637'

select * from tb_log_estudante tle 

update estudante set telefone = '(38)999149051' where rg = '11434177637'

select * from tb_log_estudante tle

create or replace rule rl_no_delete_disciplina as
on delete to disciplina
do instead nothing

delete from disciplina 

select * from disciplina

create table tb_professor_disciplina_auditoria (
	codigo serial primary key,
	codigo_disc integer,
	cpf_func varchar(15),
	dt_exclusao date,
	usuario varchar(20)
);

create or replace rule rl_delete_prof_disc as
on delete to professor_disciplina
do also
	insert into tb_professor_disciplina_auditoria(codigo_disc, cpf_func, dt_exclusao,usuario)
	values (old.codigo_disc, old.cpf_func, now(), current_user)

select * from professor_disciplina

delete from professor_disciplina

select * from professor_disciplina pd 

select * from tb_professor_disciplina_auditoria tpda 
