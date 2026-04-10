CREATE DATABASE Azienda;
USE AZIENDA;

CREATE TABLE Impiegato(
matricola INT PRIMARY KEY,
cognome VARCHAR(50) NOT NULL,
stipendio INT NOT NULL,
dipartimento CHAR(2)  NOT NULL
);
CREATE TABLE Dipartimento(
codice CHAR(2) PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
sede VARCHAR(50) NOT NULL,
direttore INT NOT NULL
);
CREATE TABLE Progetto(
sigla VARCHAR(10) PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
bilancio INT NOT NULL,
responsabile INT NOT NULL,

CONSTRAINT fk_progetto_impiegato
FOREIGN KEY(responsabile)
REFERENCES Impiegato(matricola)

);
CREATE TABLE Partecipazione(
impiegato INT,
progetto VARCHAR(50) NOT NULL,

PRIMARY KEY(impiegato,progetto),
CONSTRAINT fk_partecipazione_impiegato
FOREIGN KEY (impiegato)
REFERENCES Impiegato(matricola),

CONSTRAINT fk_partecipazione_progetto
FOREIGN KEY (progetto)
REFERENCES Progetto(sigla)
);
INSERT INTO Impiegato VALUES
(101, 'Sili',    60, 'NO'),
(102, 'Rossi',   40, 'NO'),
(103, 'Neri',    40, 'NO'),
(104, 'Gallo',   75, 'NO'),
(201, 'Neri',    40, 'SU'),
(202, 'Verdi',   50, 'SU'),
(301, 'Bisi',    70, 'IS'),
(401, 'Bianchi', 80, 'CE'),
(402, 'Marino',  45, 'CE');

INSERT INTO Dipartimento VALUES
('NO', 'Nord',   'Milano',  101),
('SU', 'Sud',    'Napoli',  201),
('IS', 'Isole',  'Palermo', 301),
('CE', 'Centro', 'Roma',    401);

INSERT INTO Progetto VALUES
('Alpha', 'Vendite',       30,  202),
('Beta',  'Inventario',    50,  301),
('Gamma', 'Distribuzione', 18,  301),
('Delta', 'Acquisti',      120, 401);

INSERT INTO Partecipazione VALUES
(101, 'Alpha'),
(101, 'Beta'),
(103, 'Alpha'),
(103, 'Beta'),
(201, 'Beta'),
(202, 'Beta'),
(104, 'Delta'),
(402, 'Delta');

ALTER TABLE Impiegato
ADD CONSTRAINT fk_impiegato_dipartimento
FOREIGN KEY(dipartimento)
REFERENCES Dipartimento(codice);

ALTER TABLE Dipartimento
ADD CONSTRAINT fk_dipartimento_impiegato
FOREIGN KEY(direttore)
REFERENCES Impiegato(matricola);

-- Esercitazione
SELECT matricola,cognome FROM Impiegato
WHERE stipendio>50;

SELECT cognome,stipendio FROM Impiegato
WHERE dipartimento LIKE 'CE';

SELECT Impiegato.cognome,Dipartimento.nome FROM Impiegato
JOIN Dipartimento ON Impiegato.dipartimento = Dipartimento.codice;

SELECT cognome FROM Impiegato
WHERE Impiegato.matricola IN (SELECT Direttore FROM Dipartimento);

SELECT Progetto.nome,Impiegato.cognome FROM Progetto
JOIN Impiegato ON Progetto.responsabile = Impiegato.matricola;

SELECT Progetto.nome,Impiegato.cognome FROM Partecipazione
JOIN Progetto ON Partecipazione.progetto = Progetto.sigla
JOIN Impiegato ON Partecipazione.impiegato = Impiegato.matricola
WHERE Progetto.bilancio > 100;

SELECT cognome  FROM Impiegato
JOIN Dipartimento ON Impiegato.dipartimento = Dipartimento.codice
WHERE stipendio > ALL(
SELECT Impiegato.stipendio FROM Impiegato
WHERE Impiegato.matricola = Dipartimento.direttore
);
SELECT cognome FROM Impiegato
WHERE Impiegato.matricola IN(SELECT Direttore FROM Dipartimento) 
OR impiegato.matricola IN(SELECT Responsabile FROM Progetto);


SELECT DISTINCT nome FROM Dipartimento
JOIN Impiegato ON Dipartimento.codice=Impiegato.dipartimento
WHERE Impiegato.stipendio>60;

/* OPPURE*/

SELECT nome FROM Dipartimento
WHERE EXISTS (
SELECT * FROM Impiegato
WHERE Impiegato.dipartimento = Dipartimento.codice
AND stipendio > 60
);

SELECT nome FROM Dipartimento
WHERE codice NOT IN (SELECT  Dipartimento FROM Impiegato WHERE stipendio<60);

SELECT cognome FROM Impiegato
WHERE stipendio  = (SELECT MAX(stipendio) FROM Impiegato);

SELECT matricola,cognome FROM Impiegato
WHERE matricola NOT IN(
SELECT Impiegato FROM Partecipazione);

SELECT matricola,cognome FROM Impiegato
JOIN Partecipazione ON Impiegato.matricola=Partecipazione.impiegato
GROUP BY matricola, cognome
HAVING COUNT(Partecipazione.progetto)>1;

SELECT matricola, cognome FROM Impiegato
WHERE matricola IN (
    SELECT impiegato
    FROM Partecipazione
    GROUP BY impiegato
    HAVING COUNT(progetto) = 1
);
SELECT dipartimento,AVG(stipendio) AS media FROM Impiegato
GROUP BY impiegato.dipartimento
ORDER BY media DESC;

SELECT i.matricola, i.cognome
FROM Impiegato i
WHERE i.stipendio > (
    SELECT AVG(i2.stipendio) * 1.10
    FROM Impiegato i2
    WHERE i2.dipartimento = i.dipartimento
);
