CREATE DATABASE Techarena;
USE Techarena;
CREATE TABLE Giocatore(
ID_giocatore INT UNIQUE PRIMARY KEY,
nome VARCHAR(30) NOT NULL,
cognome VARCHAR(30) NOT NULL,
nickname VARCHAR(30) NOT NULL,
eta INT CHECK (eta>=12) ,
num_telefono VARCHAR(15)
);
CREATE TABLE Gioco(
ID_gioco INT UNIQUE PRIMARY KEY,
titolo VARCHAR(100) NOT NULL,
categoria VARCHAR(100) NOT NULL,
giocatori_squadra INT CHECK (giocatori_squadra>1 AND giocatori_squadra<=6)
);

CREATE TABLE Torneo(
ID_torneo INT UNIQUE PRIMARY KEY,
ID_gioco INT NOT NULL,
nome VARCHAR(30) NOT NULL,
data_inizio DATE NOT NULL,
data_fine DATE,
montepremi DECIMAL(10,2) CHECK (montepremi>0),
CONSTRAINT fk_torneo_gioco 
FOREIGN KEY (ID_gioco)
REFERENCES Gioco(ID_gioco)
);

CREATE TABLE Iscrizione(
ID_iscrizione INT PRIMARY KEY,
ID_giocatore INT,
ID_torneo INT,
data_iscrizione DATE,
punteggio_torneo INT,

CONSTRAINT fk_iscrizione_giocatore
FOREIGN KEY (ID_giocatore)
REFERENCES Giocatore(ID_giocatore),

CONSTRAINT fk_iscrizione_torneo
FOREIGN KEY (ID_torneo)
REFERENCES Torneo(ID_torneo)
);

INSERT INTO Techarena.Giocatore VALUES
(1,'Diego','Marinsek','PvToSeK','18','+393322743998'),
(2,'Miriam','Li Destri','miri_lide','18',NULL),
(3,'Omar','Nassih','On8player','18',NULL),
(4,'Francesco','Pettellino','overpower07','18','+394754623887'),
(5,'Nicolas','Astudillo','SmearyAuthor','18','+394554623382'),
(6,'Gianluca','Davila','ggianlu','19','+394662483855'),
(7,'Boh','Boh','Boh','17',NULL);

INSERT INTO Techarena.Gioco VALUES
(1,'Fortnite','Battle Royale','6'),
(2,'The Finals','Deatchmatch','6'),
(3,'Genshin Impact','Gacha','6');

INSERT INTO Techarena.Torneo VALUES
(1,1,'Torneo 1','2026-02-20','2026-02-21','1000'),
(2,2,'Torneo 2','2026-02-10','2026-02-18','100');

INSERT INTO Techarena.Iscrizione VALUES 
(1,1,1,'2026-02-20',70),
(2,2,1,'2026-02-20',80),
(3,4,1,'2026-02-20',60),
(4,3,2,'2026-02-10',NULL),
(5,5,2,'2026-02-10',NULL);


SELECT * FROM Techarena.Giocatore
 WHERE eta>=18;
 
 SELECT * FROM Techarena.Torneo
 WHERE montepremi>=1000;
 
 SELECT giocatore.nome,giocatore.cognome,torneo.nome FROM Techarena.Giocatore
 JOIN Techarena.iscrizione ON giocatore.ID_giocatore = iscrizione.ID_giocatore
 JOIN Techarena.torneo ON torneo.ID_torneo= iscrizione.ID_torneo;
 
 SELECT giocatore.nome,giocatore.cognome,iscrizione.punteggio_torneo FROM Giocatore
 JOIN Iscrizione ON giocatore.id_giocatore=iscrizione.id_giocatore
WHERE iscrizione.punteggio_torneo>65;
 
 SELECT * FROM Giocatore
 WHERE Giocatore.cognome LIKE 'M%';
 
 SELECT * FROM Gioco
 WHERE gioco.categoria LIKE '%battle%';
 
 SELECT Giocatore.nome, Torneo.nome FROM Giocatore
 JOIN Iscrizione ON iscrizione.ID_giocatore=giocatore.ID_giocatore
 JOIN Torneo ON iscrizione.ID_torneo = torneo.ID_torneo
 WHERE Torneo.nome = 'Torneo 1';
 
 SELECT * FROM Giocatore
 WHERE eta BETWEEN 17 AND 19;
 
 SELECT DISTINCT giocatore.nickname FROM Giocatore

 
 
  