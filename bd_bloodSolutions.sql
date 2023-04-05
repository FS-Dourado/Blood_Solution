CREATE DATABASE blood_solutions;
USE blood_solutions;

CREATE TABLE empresa(
	idEmpresa INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    cnpj VARCHAR(45),
	email VARCHAR(45),
    senha VARCHAR(45)
);

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    email VARCHAR(45),
    senha VARCHAR(45),
    tipo VARCHAR(45),
    fkEmpresa INT,
    constraint fkEmpresa FOREIGN KEY (fkEmpresa) references empresa(idEmpresa),
    constraint chktipo CHECK (tipo IN('Funcionário', 'Administrador'))
);

CREATE TABLE local_empresa(
	idLocal INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    endereco VARCHAR(50),
    fkEmpresa INT,
    constraint fkEmp FOREIGN KEY (fkEmpresa) references empresa(idEmpresa)
);

CREATE TABLE lote(
	idLote INT PRIMARY KEY auto_increment,
    qtdBolsa INT,
    validade CHAR(2),
    fkLocal INT,
    constraint fkLocal FOREIGN KEY (fkLocal) references local_empresa(idLocal)
);

CREATE TABLE sensor(
	idSensor INT PRIMARY KEY auto_increment,
    stts CHAR(1),
    fkLocal INT,
    constraint fkLocal_emp FOREIGN KEY (fkLocal) references local_empresa(idLocal)
);

CREATE TABLE historico(
	idHistorico INT PRIMARY KEY auto_increment,
    temperatura DOUBLE,
    horario DATETIME default current_timestamp,
    fkSensor INT,
    constraint fkSensor FOREIGN KEY (fkSensor) references sensor(idSensor)
);

CREATE TABLE contato(
	idContato INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    email VARCHAR(45),
    mensagem VARCHAR(45)
);


