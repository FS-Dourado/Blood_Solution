create database BloodSoluctions;
use BloodSoluctions;

create table cadastro(
idf int primary key auto_increment,
nome_funcionarios varchar(50),
cpf char(11) not null,
dtNasc date,
email varchar(50),
funcao varchar(50),
senha varchar(50) 
)auto_increment = 1000;

create table empresa(
idE int primary key auto_increment,
nome varchar(50),
cnpj int,
endereço varchar(50),
email varchar(40),
senha varchar(20),
telefone int,
representante varchar(20)
);

create table sensor(
idSensor int primary key  auto_increment ,
temperatura decimal (2,2),
sttSensor char (1),
horario datetime default current_timestamp
);

create table histórico(
idHistórico int primary key auto_increment,
temperatura decimal (2,2),
sttSensor char (1),
horario datetime default current_timestamp,
fkSensor int,
constraint fk_Histórico foreign key (fkSensor) references  sensor (idSensor)
);	 

create table armazemento(
id int primary key auto_increment,
LocalArmazenamento varchar(50),
TipoSanguinio varchar(15),
qtdBolsas int,
chkSangue varchar(15),
constraint chkSangue check (chkSangue in ('O+','O-','A+','A-','AB+','AB-','Golden Blood')
));

drop database BloodSoluctions;