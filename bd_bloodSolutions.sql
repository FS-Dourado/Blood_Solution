CREATE DATABASE blood_solutions;
USE blood_solutions;

-- Criação das tabelas
CREATE TABLE empresa(
	idEmpresa INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    cnpj CHAR(15)
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
    mensagem VARCHAR(100)
);

-- Inserimento de dados

INSERT INTO empresa VALUES
	(null, 'Hospital Israelita Albert Einstein', 02159784000157),
    (null, 'Hospital Sirio Libanes', 54833209000100),
    (null, 'Hospital Oswaldo Cruz', 85560317000120);
    
INSERT INTO usuario VALUES
	(null, 'Felipe Dourado', 'felipe@gmail.com', 'dourado123', 'Administrador', 1),
    (null, 'Nicolly Juliani', 'nicolly@gmail.com', 'juliani_45', 'Funcionário', 1),
    (null, 'Pedro Donizete', 'pedro@gmail.com', 'pedro_lucky', 'Administrador', 2),
    (null, 'Arthur Garcia', 'garcia@gmail.com', 'garciarthur', 'Funcionário', 2),
    (null, 'Marcela Mendes', 'marcella@gmail.com', 'm4rc3ll4_', 'Administrador', 3),
    (null, 'Mirella Ot', 'mirella@gmail.com', 'ot_mirella', 'Funcionário', 3);
    
INSERT INTO local_empresa VALUES
	(null, '#','Av. Albert Eintein, 627/701', 1),
	(null, '#','Rua Dona Adma Jafet, 115', 2),
    (null, '#','Rua Treze de Maio, 1815', 3);
    
INSERT INTO lote VALUES
	(null, 25, '23', 1),
    (null, 50, '24', 1),
    (null, 20, '20', 2),
    (null, 55, '15', 2),
    (null, 40, '10', 3),
    (null, 35, '14', 3);
    
INSERT INTO sensor VALUES
	(null, 1, 1),
    (null, 0, 1),
    (null, 0, 2),
    (null, 1, 2),
    (null, 1, 3),
    (null, 0, 3);
    
INSERT INTO historico VALUES
	(null, 10.3, default, 1),
    (null, 10, default, 1),
    (null, 5.5, default, 2),
    (null, 6.3, default, 2),
    (null, 4.7, default, 3),
    (null, 5.3, default, 3),
    (null, 10.3, default, 4),
    (null, 7, default, 4),
    (null, 5.4, default, 5),
    (null, 5.4, default, 5),
    (null, 6.6, default, 6),
    (null, 6.0, default, 6);
    
INSERT INTO contato VALUES
	(null, 'Marcos Silva', 'marcos@gmail.com', 'Gostaria de saber, como contratar o serviço de vocês?'),
    (null, 'Gabriel Santana', 'santana@gmail.com', 'Qual o preço médio do sistema de vocês?');
    
-- SELECTS DE TODAS AS TABELAS
SELECT * FROM empresa;
SELECT * FROM usuario;
SELECT * FROM local_empresa;
SELECT * FROM lote;
SELECT * FROM sensor;
SELECT * FROM historico;
SELECT * FROM contato;