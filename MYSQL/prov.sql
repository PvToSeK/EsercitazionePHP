create database Prova;

create table Prova.casa(

	id int PRIMARY KEY,
    nome varchar(20),
    indirizzo varchar(100) NOT NULL
    
);
create table Prova.numero_cellulare(
	id int PRIMARY KEY,
    numero int NOT NULL,
    tipo varchar(20) DEFAULT 'personale'
);

create table Prova.persona(
   cf varchar(16) PRIMARY KEY,
   nome varchar(20) NOT NULL,
   cognome varchar(20) NOT NULL,
   email varchar(30) UNIQUE


);
CREATE TABLE Prova.Rubrica (
    id INT PRIMARY KEY,
    id_persona VARCHAR(16),
    id_cellullare INT,

    CONSTRAINT fk_rubrica_persona
        FOREIGN KEY (id_persona)
        REFERENCES Prova.persona(cf),

    CONSTRAINT fk_rubrica_cellullare
        FOREIGN KEY (id_cellullare)
        REFERENCES Prova.numero_cellulare(id)
);