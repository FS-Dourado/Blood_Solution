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

CREATE TABLE local_empresa(
	idLocal INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    fkEmpresa INT,
    constraint fkEn foreign key (fkEndereco) references  endereco(idEndereco),
	constraint fkEmp FOREIGN KEY (fkEmpresa) references empresa(idEmpresa)
);

CREATE TABLE endereco(
	idEndereco INT PRIMARY KEY auto_increment,
    CEP char(9),
    bairro VARCHAR(45),
    numero INT,
    complemento VARCHAR(50)
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

CREATE TABLE registroLotes(
	idRegistro INT,
	dataEntrada DATETIME default current_timestamp,
    dataSaida DATE default current_timestamp,
    fkLote INT,
    constraint const foreign key (fkLote) references lote(idLote),
    constraint pk primary key (idRegistro, fkLote)
);

CREATE TABLE sensor(
	idSensor INT PRIMARY KEY auto_increment,
    stts VARCHAR(15),
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


-- 


