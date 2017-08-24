--Definição da tabela Empregado e sua chave primária.
create table Empregado
(rg varchar(15) not null,
rg_supervisor varchar(15),
depto number(2),
nome varchar(50),
cpf char(11) not null,
salario number(6,2) not null,
constraint Pk_Emp primary key(rg));

--Definição da tabela Dependente e sua chave primárias.
create table Dependente
(nome_depen varchar(40) not null,
rg_resp varchar (15) not null,
nascimento date,
relacao varchar(20),
sexo char(1),
constraint Pk_depen primary key(nome_depen, rg_resp));

--Definição da tabela Departamento e sua chave primária.
create table Departamento
(numero number(2) not null,
rg_gerente varchar(15),
nome varchar(40),
constraint Pk_Depto primary key(numero));

--Definição da tabela Projeto e sua chave primária.
create table Projeto
(numero number(2) not null,
nome varchar(30),
localizacao varchar(40),
constraint Pk_Proj primary key(numero));

--Definição da tabela Empregado_projeto e sua chave primária.
create table Empregado_projeto
(numero_projeto number(2) not null,
rg_empregado varchar(15) not null,
horas number,
constraint Pk_Emp_Proj primary key(numero_projeto, rg_empregado));

--Definição da tabela Departamento_projeto e sua chave primária.
create table Departamento_Projeto
(numero_depto number(2) not null,
numero_projeto number(2) not null,
constraint Pk_Depto_Proj primary key(numero_depto, numero_projeto));

--Definição do auto-relacionamento existente na tabela Empregado.
alter table Empregado add constraint Fk_Emp_Sup foreign key(rg) references Empregado 
