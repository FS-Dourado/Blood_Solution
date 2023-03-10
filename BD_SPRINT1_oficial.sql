create database BloodSoluctions;
use BloodSoluctions;

create table cadastro(
idf int primary key auto_increment,
nomeFuncionario varchar(50) not null,
dtNasc date,
email varchar(50) not null,
funcao varchar(50),
senha varchar(50),
chkEmail varchar(40),
constraint chkEmail check (email like '%@%')
)auto_increment = 1000;

insert into cadastro(nomeFuncionario, dtNasc, email, funcao, senha) values
('Victor Gabriel Gabriel Barbosa','1986-01-03','victor_gabriel_barbosa@techdomus.com.br', 'enfermeiro', 'x1mfKYFCqm'),
('Iago Roberto Thiago Ferreira','1989-09-02','iago_ferreira@davimil.com.br', 'enfermeiro', 'X5Sxxkbm5E'),
('Maya Analu Pietra Rodrigues','1990-12-02','maya_analu_rodrigues@lht.com.br', 'administradora', 'aJkIUMhJZu'),
('Laís Alice Gonçalves','1965-02-02','lais_goncalves@cafefrossard.com', 'Diretora', 'Y1nhWHYiS');

-- dar erro
insert into cadastro(nomeFuncionario,email) values
('raquel','raquelvitoria.com.br');

select nomeFuncionario from cadastro where funcao = 'enfermeiro';
select * from cadastro where funcao like '%a';
select * from cadastro where email like '%sa%';
select * from cadastro;
desc cadastro;
truncate cadastro;
drop table cadastro;


create table empresa(
idE int primary key auto_increment,
nome varchar(50) not null,
cnpj varchar(30) not null,
email varchar(40),
senha varchar(20),
representante varchar(50),
chkEmailEmpresa varchar(40),
constraint chkEmailEmpresa check (email like '%@%')
);

insert into empresa (nome, cnpj, email, senha, representante) values
('Hospital Santa Luzia', '84.066.236/0001-10', 'HPsanta@luzia.com.br', 'aJkIUMj555', 'Camilas almeida Santos'), 
('Hospital Santa Cruz', '37.035.666/0001-95', 'HPsanta@cruz.com' ,'aKSOaklw78', 'Luan Santos'), 
('Hospital Salva Vidas', '07.164.810/0001-22', 'HPsalva@vidas.com','a795GJKL5', 'Amanda Carvalho Nunes'), 
('Hospital Lua Nova', '38.076.779/0001-00', 'HPlua@noova.com' ,'a7963fkdsa', 'Joana Pereira');

-- dar erro
insert into empresa(nome,cnpj,email) values
('xxxx','695453231255522125','raquel.com.br');

select * from empresa where cnpj like '%0';
select * from empresa where nome like '%Santa%';
select * from empresa where email like '%uz%';
select * from empresa;
desc empresa;
truncate empresa;
drop table empresa;


create table sensor(
idSensor int primary key  auto_increment ,
localSensor varchar(50),
sttSensor char(1)
);

insert into sensor(localSensor, sttSensor) values
('Avenida João Dias', 1),
('Avenida Marechal Teodoro', 1),
('Avenida Brasil', 0);
insert into sensor(localSensor, sttSensor) values
('Rua Lurdes Da Conceição', 1);

select * from sensor where sttSensor = 1;
select * from sensor where sttSensor = 0;
select * from sensor where localSensor like '%Brasil%';
select * from sensor;
desc sensor;
truncate sensor;
drop table sensor;


create table historico(
idHistorico int primary key auto_increment,
temperatura double,
horario datetime default current_timestamp
);	 

insert into historico (temperatura) values
(04.22),
(05.88),
(00.00 );
insert into historico(temperatura) values
(03.99);

select * from historico where idHistorico = 2;
select horario from historico where idHistorico = 1;
select * from historico where temperatura < 05.00;
select * from historico;
desc historico;
truncate historico;
drop table historico;


create table armazenamento(
id int primary key auto_increment,
LocalArmazenamento varchar(50),
TipoSanguineo varchar(15) not null,
qtdBolsas int,
chkSangue varchar(15),
constraint chkSangue check (TipoSanguineo in ('O+','O-','A+','A-','AB+','AB-','Golden Blood')
));

insert into armazenamento (LocalArmazenamento, TipoSanguineo, qtdBolsas) values
('Avenida João Dias', 'O+', 35),
('Avenida Marechal Teodoro', 'A-', 50),
('Avenida Brasil', 'A+',  25),
('Rua Lurdes Da Conceição', 'AB-', 10);

-- dar erro
insert into armazenamento (TipoSanguineo) values
('D');

select * from armazenamento where qtdBolsas >= 30;
select * from armazenamento where TipoSanguineo like '%A%';
select * from armazenamento where LocalArmazenamento like '%o';
select * from armazenamento;
desc armazenamento;
truncate armazenamento;
drop table armazenamento;


drop database BloodSoluctions;