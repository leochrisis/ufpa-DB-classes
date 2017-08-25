--Criação de tabelas (questão)

--Definição da tabela Empregado e sua chave primária.
create table Empregado
(rg varchar(15) not null,
rg_supervisor varchar(15), --foreign key (autorelacionamento)
depto number(2), --foreign key
nome varchar(50),
cpf char(11) not null,
salario number(6,2) not null,
constraint Pk_Emp primary key(rg));

--Definição da tabela Dependente e sua chave primárias.
create table Dependente
(nome_depen varchar(40) not null,
rg_resp varchar (15) not null, --foreign key
nascimento date,
relacao varchar(20),
sexo char(1),
constraint Pk_depen primary key(nome_depen, rg_resp));

--Definição da tabela Departamento e sua chave primária.
create table Departamento
(numero number(2) not null,
rg_gerente varchar(15), --foreign key
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
(numero_projeto number(2) not null, --foreign key
rg_empregado varchar(15) not null, --foreing key 
horas number,
constraint Pk_Emp_Proj primary key(numero_projeto, rg_empregado));

--Definição da tabela Departamento_projeto e sua chave primária.
create table Departamento_Projeto
(numero_depto number(2) not null, --foreign key
numero_projeto number(2) not null, --foreign key
constraint Pk_Depto_Proj primary key(numero_depto, numero_projeto));

--Definição de constraints para foreign key (questão 2)

--Definição do auto-relacionamento existente na tabela Empregado.
alter table Empregado add constraint Fk_Emp_Sup foreign key(rg_supervisor) references Empregado(rg);

--Definição do relacionamento entre a tabela Empregado e a tabela Departamento
alter table Empregado add constraint Fk_Emp_Depto foreign key(depto) references Departamento(numero);

--Definição do relacionamento entre a tabela Empregado e a tabela Dependente
alter table Dependente add constraint Fk_Emp_Depen foreign key(rg_resp) references Empregado(rg);

--Definição do relacionamento entre a tabela Departamento e Empregado
alter table Departamento add constraint Fk_Depto_Emp foreign key(rg_gerente) references Empregado(rg);

--Definição de relacionamento entre a tabela Empregado e a tabela Empregado_projeto
alter table Empregado_projeto add constraint Fk_Emp_Emp_Proj foreign key(rg_empregado) references Empregado(rg);

--Definição de relacionamento entre a tabela Projetos e a tabela Empregado_projeto
alter table Empregado_projeto add constraint Fk_Proj_Emp_Proj foreign key(numero_projeto) references Projeto(numero);

--Definição de relacionamento entre a tabela Departamento_Projeto e a tabela Departamento
alter table Departamento_Projeto add constraint Fk_Depto_Depto_Proj foreign key(numero_depto) references Departamento(numero);

--Definição de relacionamento entre a tabela Departamento_Projeto e a tabela Projeto
alter table Departamento_Projeto add constraint Fk_Proj_Depto_Proj foreign key(numero_projeto) references Projeto(numero);

--Execução de alterações em tabelas(questão 3)

--Inserção de atributo na tabela Departamento.
alter table Departamento add data_ger date not null;

--Definição do valor padrão do atributo data_ger
alter table Departamento modify data_ger default sysdate;

--Retirada do atributo relação da tabela Dependente
alter table Dependente drop column relacao;

--Redefinição do atributo nome da tabela Empregado
alter table Empregado modify nome varchar(70);

--Definiçaõ da tabela Localizacao_Depto e sua chave primária
create table Localizacao_Depto
(numero_loc number(2) not null,
numero_depto number(2) not null,
nome_loc varchar(30),
constraint Pk_Loc primary key(numero_loc, numero_depto));

--Definição do relacionamento entre a tabela Departamento e a tabela Localizacao_Depto
alter table Localizacao_Depto add constraint Fk_Depto_Loc_Depto foreign key(numero_depto) references Departamento(numero);

--Inserção do atributo RG_Gerente_Proj na tabela de projetos
alter table Projeto add RG_Gerente_Proj varchar(15);

--Definição do relacionamento entre a tabela Projeto e a tabela Empregado
alter table Projeto add constraint Fk_Emp_Proj foreign key(RG_Gerente_Proj) references Empregado(rg);

--Povoando o banco de dados

--Pvoando a tabela de Empregado com 5 linhas.
insert into Empregado(rg, nome, cpf, salario) values ('123456789', 'Leonardo Costa', '12345678901', 1000.50);
insert into Empregado(rg, rg_supervisor, nome, cpf, salario) values ('123456781', '123456789', 'Ítalo Costa', '12345678900', 50.49);
insert into Empregado(rg, rg_supervisor, nome, cpf, salario) values ('123456782', '123456789', 'Matheus Leite', '12345678902', 1.50);
