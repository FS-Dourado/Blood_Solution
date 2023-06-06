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
        cep CHAR(9),
        bairro VARCHAR(45),
        numero INT,
        complemento VARCHAR(45),
        fkEmpresa INT,
        constraint fkEmp FOREIGN KEY (fkEmpresa) references empresa(idEmpresa)
    );

    CREATE TABLE lote(
        idLote INT PRIMARY KEY auto_increment,
        qtdBolsa INT,
        tipoSanguineo CHAR(3),
        validade DATE,
        fkLocal INT,
        constraint chktipoSanguineo CHECK (tipoSanguineo IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
        constraint fkLocal FOREIGN KEY (fkLocal) references local_empresa(idLocal)
    );

    CREATE TABLE sensor(
        idSensor INT PRIMARY KEY auto_increment,
        stts VARCHAR(15),
        fkLocal INT,
        constraint fkLocal_emp FOREIGN KEY (fkLocal) references local_empresa(idLocal)
    );
   
CREATE TABLE registroLotes(
	idRegistro INT,
	dataEntrada DATETIME default current_timestamp,
    dataSaida DATETIME default current_timestamp,
    fkLote INT,
    constraint const foreign key (fkLote) references lote(idLote),
    constraint pk primary key (idRegistro, fkLote)
);

  CREATE TABLE historico(
        idHistorico INT PRIMARY KEY auto_increment,
        temperatura DOUBLE,
        temperaturaSimulada DOUBLE,
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
	(null, 'Armazenamento Principal','Av. Albert Eintein, 627/701', 1),
    (null, 'Armazenamento 2','Av. Albert Eintein, 627/701', 1),
	(null, 'Armazenamento Principal','Rua Dona Adma Jafet, 115', 2),
    (null, 'Armazenamento Principal','Rua Treze de Maio, 1815', 3),
    (null, 'Transporte', 'Em Transporte', 1);

INSERT INTO lote VALUES
	(null, 25, 'A+', '2023-05-12', 1),
    (null, 50, 'B+' ,'2023-04-30', 1),
    (null, 20, 'AB+' ,'2023-05-10', 2),
    (null, 45, 'A-', '2023-05-05', 3),
    (null, 40, 'AB-','2023-05-01', 3),
    (null, 35, 'B-','2023-04-29', 4),
    (null, 20, 'O+', '2023-05-15', 5);

INSERT INTO sensor VALUES
	(null, 'Ativo', 1),
    (null, 'Ativo', 2),
    (null, 'Ativo', 3),
    (null, 'Ativo', 4),
    (null, 'Ativo', 5);

INSERT INTO historico VALUES
	(null, 6, default, 1),
    (null, 5, default, 2),
    (null, 4, default, 2),
    (null, 5.5, default, 1),
    (null, 4.7, default, 3),
    (null, 5.3, default, 4),
    (null, 3, default, 3),
    (null, 4.5, default, 4),
    (null, 5.4, default, 5),
    (null, 5, default, 5);

INSERT INTO contato VALUES
	(null, 'Marcos Silva', 'marcos@gmail.com', 'Gostaria de saber, como contratar o serviço de vocês?'),
    (null, 'Gabriel Santana', 'santana@gmail.com', 'Qual o preço médio do sistema de vocês?');

    -- Usuário de cada empresa
    SELECT * FROM usuario JOIN empresa
        ON fkEmpresa = idEmpresa;
        
    -- Lote de cada empresa
    SELECT * FROM lote JOIN local_empresa
        ON fkLocal = idLocal
        JOIN empresa 
        ON idEmpresa = fkEmpresa;
        
    -- Histórico do sensor
    SELECT sensor.idSensor,
    sensor.stts,
    historico.temperatura,
    historico.horario FROM sensor JOIN historico
        ON idSensor = fkSensor;
        
        
    -- local de cada lote
    SELECT * FROM lote JOIN local_empresa
        ON fkLocal = idLocal;


    -- local de cada sensor
    SELECT * FROM sensor JOIN local_empresa
        ON idLocal = fkLocal;
        
    -- local de cada lote e seus respectivos sensores
    SELECT * FROM lote JOIN local_empresa
        ON fkLocal = idLocal
        JOIN sensor
        ON sensor.fkLocal = idLocal;

	SELECT * FROM lote;

	SELECT * FROM usuario;
    SELECT * FROM local_empresa;
    SELECT * FROM lote;
-- 


