CREATE DATABASE BloodSolutions;
USE BloodSolutions;

/* Criação das tabelas */
CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY auto_increment,
    nome VARCHAR(50) not null,
    cnpj CHAR(14) not null,
    email VARCHAR(70) not null,
    senha VARCHAR(50) not null,
    constraint chkEmail CHECK (email LIKE '%@%')
);

CREATE TABLE armazenamento (
	idArmazenamento INT PRIMARY KEY auto_increment,
    localArmazenamento varchar(50),
	tipoSanguineo varchar(15) not null,
	qtdBolsas int,
    constraint chkTipo check (tipoSanguineo in ('O+','O-','A+','A-','AB+','AB-','Golden Blood'))
);

CREATE TABLE sensor (
	idSensor INT PRIMARY KEY auto_increment,
    sttsSensor char(1),
    idArmazenamento INT,
    constraint fk_Armazenamento foreign key (idArmazenamento) references armazenamento (idArmazenamento)
);

CREATE TABLE historico (
	idHistorico INT PRIMARY KEY auto_increment,
    temperatura DOUBLE,
    horario DATETIME default current_timestamp,
    idSensor INT,
    constraint fk_Sensor foreign key (idSensor) references sensor (idSensor)
);

/* Inserçao de dados */
INSERT INTO empresa(nome, cnpj, email, senha) VALUES
	('Hospital Dourados','01234567890000','dourados@gmail.com','dourado123'),
    ('Hospital Santa Luzia','10101010101010','santaluzia@gmail.com','santaluzia'),
    ('Hospital Lua Nova','01010101010101','luanova@gmail.com','luanova');
    
INSERT INTO armazenamento(localArmazenamento, tipoSanguineo, qtdBolsas) VALUES
	('Avenida João Dias', 'O+', 35),
	('Avenida Marechal Teodoro', 'A-', 50),
	('Avenida Brasil', 'A+',  25),
	('Rua Lurdes Da Conceição', 'AB-', 10);

INSERT INTO sensor(sttsSensor, idArmazenamento) VALUES
	(1, 1),
	(1, 2),
	(0, 3),
    (0, 4);
    
INSERT INTO historico(temperatura, idSensor) VALUES
	(04.22, 1),
	(05.88, 2),
	(00.00, 3),
    (01.00, 4),
    (02.50, 1);

/* Select's */
SELECT * FROM historico;
SELECT * FROM sensor;
SELECT * FROM empresa;
SELECT * FROM armazenamento;