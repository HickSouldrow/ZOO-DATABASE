create database Zoologico; 
use Zoologico; 

CREATE TABLE Ala ( 
    CodAla INT IDENTITY,   
    Descricao VARCHAR(50) NOT NULL,                  
    Localizacao VARCHAR(25) NOT NULL,             
	PRIMARY KEY(CodAla) 
); 

CREATE TABLE Tipo_Container ( 
    TipoContainer INT IDENTITY, 
    ContainerDescr VARCHAR(40) NOT NULL, 
	PRIMARY KEY (TipoContainer) 
); 

CREATE TABLE Cargo ( 
    CodCargo INT IDENTITY, 
    Cargo VARCHAR(50) NOT NULL, 
	PRIMARY KEY(CodCargo) 
); 

  CREATE TABLE Funcionario ( 
    Codfunc INT IDENTITY, 
    Nome VARCHAR(50) NOT NULL, 
    CPF VARCHAR(14) Unique NOT NULL, 
    Endereco VARCHAR(50) NOT NULL, 
    Email VARCHAR(80) Unique NOT NULL, 
	CodCargo INT NOT NULL, 
    DataNascFunc DATE NOT NULL, 
    Salario FLOAT NOT NULL, 
	PRIMARY KEY(CodFunc), 
	FOREIGN KEY (CodCargo) REFERENCES Cargo(CodCargo), 
); 

CREATE TABLE Veterinario ( 
    CRMV VARCHAR(15) NOT NULL,     
    CodFunc int NOT NULL,             
	PRIMARY KEY(CRMV), 
    FOREIGN KEY (CodFunc) REFERENCES Funcionario(CodFunc)  
); 

CREATE TABLE Container ( 
    CodContainer INT IDENTITY, 
    NumAnimal FLOAT NOT NULL, 
	NumMaxAnimal  INT NOT NULL, 
    TipoContainer INT NOT NULL, 
    CodAla INT NOT NULL, 
	PRIMARY KEY(CodContainer),
	FOREIGN KEY (TipoContainer) REFERENCES Tipo_Container(TipoContainer), 
    FOREIGN KEY (CodAla) REFERENCES Ala(CodAla) 
);

CREATE TABLE TipoAnimal ( 
    TipoAnimal INT IDENTITY, 
    Especie VARCHAR(60) NOT NULL, 
    NomeCientifico VARCHAR(35) UNIQUE NOT NULL, 
    Descricao VARCHAR(50) NOT NULL, 
	PRIMARY KEY(TipoAnimal) 
); 

CREATE TABLE Animal ( 
    CodAnimal INT IDENTITY NOT NULL, 
    Apelido VARCHAR(50) NOT NULL, 
    Genero VARCHAR(5) NOT NULL,
    Peso VARCHAR(7) NOT NULL, 
    Tamanho VARCHAR(5) NOT NULL, 
    DataNasc DATE NOT NULL,
    TipoAnimal INT NOT NULL, 
    Cor VARCHAR(15) NOT NULL, 
    CodContainer INT NOT NULL,
	PRIMARY KEY(CodAnimal),
    FOREIGN KEY (CodContainer) REFERENCES Container(CodContainer), 
    FOREIGN KEY (TipoAnimal) REFERENCES TipoAnimal(TipoAnimal) 
); 

CREATE TABLE Consulta ( 
    CodAnimal INT NOT NULL, 
    CRMV VARCHAR(15) NOT NULL , 
    DataConsulta DATETIME NOT NULL, 
    ConsultaDescr VARCHAR(50) NOT NULL, 
    FOREIGN KEY (CodAnimal) REFERENCES Animal(CodAnimal), 
    FOREIGN KEY (CRMV) REFERENCES Veterinario(CRMV) 
); 

CREATE TABLE LimpezaContainer ( 
    CodContainer INT IDENTITY, 
    CodFunc INT NOT NULL, 
    DataLimpeza DATETIME NOT NULL,  
    FOREIGN KEY (CodContainer) REFERENCES Container(CodContainer), 
    FOREIGN KEY (CodFunc) REFERENCES Funcionario(CodFunc), 
	

); 
