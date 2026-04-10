CREATE DATABASE Biblioteca;

CREATE TABLE Biblioteca.utente (
    id_utente INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    eta INT CHECK (eta >= 14)
);

CREATE TABLE Biblioteca.libro (
    id_libro INT PRIMARY KEY,
    titolo VARCHAR(50) NOT NULL,
    autore VARCHAR(50) NOT NULL,
    isbn VARCHAR(13) UNIQUE,
    anno_pubblicazione INT CHECK (anno_pubblicazione >= 1500)
);

CREATE TABLE Biblioteca.prestito (
    id_prestito INT PRIMARY KEY,
    id_libro INT,
    id_utente INT,
    data_prestito DATE NOT NULL,
    data_restituzione DATE CHECK (data_restituzione > data_prestito),
    CONSTRAINT fk_prestito_utente FOREIGN KEY (id_utente) REFERENCES Biblioteca.utente(id_utente),
    CONSTRAINT fk_prestito_libro FOREIGN KEY (id_libro) REFERENCES Biblioteca.libro(id_libro)
);

INSERT INTO Biblioteca.utente VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@gmail.com', 26),
(2, 'Francesca', 'Bianchi', 'francesca.bianchi@gmail.com', 28),
(3, 'Luca', 'Verdi', 'luca.verdi@hotmail.com', 34),
(4, 'Sara', 'Neri', 'sara.neri@gmail.com', 16),
(5, 'Anna', 'Gialli', 'anna.gialli@hotmail.com', 22),
(6, 'Fabio', 'Marroni', 'fabio.marroni@gmail.com', 29),
(7, 'Elena', 'Rosa', 'elena.rosa@libero.it', 28),
(8, 'Davide', 'Felli', 'davide.felli@gmail.com', 19),
(9, 'Nicolo', 'Rossi', 'nicolo.rossi@gigi.com', 23),
(10, 'Federico', 'Bianchi', 'federico.bianchi@gmail.com', 32),
(13, 'Paolo', 'Galli', 'paolo.galli@gmail.com', 30),
(14, 'Marco', 'Blu', 'marco.blu@gmail.com', 14),
(15, 'Giulia', 'Viola', 'giulia.viola@gmail.com', 15),
(16, 'Roberto', 'Nero', 'roberto.nero@gmail.com', 50);

INSERT INTO Biblioteca.libro VALUES
(1, 'Storia d\'amore', 'Umberto Eco', '9788845240001', 1980),
(2, '1984', 'George Orwell', '9780451520002', 1949),
(3, 'Il Codice Da Vinci', 'Dan Brown', '9788804660003', 2003),
(4, 'Amore e Guerra', 'Suzanne Collins', '9788804670004', 2008),
(5, 'Il Trono di Spade', 'George R. R. Martin', '9788804680005', 2011),
(6, 'Inferno', 'Dan Brown', '9788804690006', 2013),
(7, 'Ready Player One', 'Ernest Cline', '9788804700007', 2011),
(8, 'Il Labirinto della Storia', 'James Dashner', '9788804710008', 2012),
(9, 'Storia Segreta', 'Umberto Eco', '9788804720009', 1890),
(10, 'Amore e Psiche', 'Dan Brown', '9788804730010', 1700),
(11, 'Vecchia Storia', 'George Orwell', '9788804740011', 1600),
(12, 'Libro Senza ISBN', 'Autore X', NULL, 2000),
(13, 'Il Barone Rampante', 'Italo Calvino', '9788804500001', 2020),
(14, 'Se una notte d\'inverno un viaggiatore', 'Italo Calvino', '9788804500002', 2022),
(15, 'Il Nome della Rosa', 'Umberto Eco', '9788804500003', 2026),
(16, 'L\'amica geniale', 'Elena Ferrante', '9788804500004', 2020),
(17, 'Libro Nuovo', 'Autore Y', '9788804500010', 2025);

INSERT INTO Biblioteca.prestito VALUES
(1, 1, 2, '2020-03-10', '2020-03-20'),
(2, 2, 3, '2020-06-15', '2020-06-25'),
(3, 3, 4, '2020-11-05', NULL),
(4, 4, 5, '2021-02-12', '2021-02-22'),
(5, 5, 6, '2024-01-10', NULL),
(6, 6, 1, '2024-05-05', '2024-05-15'),
(7, 7, 8, '2024-08-20', '2024-08-30'),
(8, 8, 9, '2024-09-10', NULL),
(9, 9, 10, '2025-02-15', '2025-02-25'),
(10, 10, 2, '2021-07-01', '2021-07-11'),
(11, 11, 5, '2024-03-15', '2024-03-25'),
(12, 12, 6, '2023-08-10', '2023-08-20'),
(13, 1, 13, '2025-06-10', '2025-06-20'),
(14, 13, 1, '2024-10-01', NULL),
(15, 14, 2, '2024-10-05', '2024-10-15'),
(16, 15, 3, '2024-11-01', NULL),
(17, 16, 4, '2024-11-10', '2024-11-20');

 -- Esercitazione 1
SELECT * FROM biblioteca.utente;
SELECT * FROM biblioteca.libro;
SELECT * FROM biblioteca.utente where eta<18;
SELECT * FROM biblioteca.libro where anno_pubblicazione>2010;
SELECT nome,cognome,eta FROM biblioteca.utente where email LIKE '%@gmail%';
SELECT distinct nome,cognome FROM biblioteca.utente;
SELECT * FROM biblioteca.utente where cognome LIKE 'B%';

SELECT DISTINCT libro.titolo, libro.autore FROM Biblioteca.libro 
JOIN Biblioteca.prestito ON libro.id_libro = prestito.id_libro 
WHERE prestito.data_prestito LIKE  '2026%';

SELECT * FROM Biblioteca.libro 
JOIN Biblioteca.prestito ON libro.id_libro = prestito.id_libro
JOIN Biblioteca.utente ON prestito.id_utente = utente.id_utente
 WHERE utente.email = 'nicolo.rossi@gigi.com';


 SELECT libro.titolo, libro.autore FROM Biblioteca.libro
 JOIN Biblioteca.prestito ON libro.id_libro = prestito.id_libro
 WHERE data_prestito BETWEEN '2021-01-01' AND '2025-12-31';
 
SELECT DISTINCT libro.titolo, libro.autore
FROM Biblioteca.libro
JOIN Biblioteca.prestito ON libro.id_libro = prestito.id_libro
JOIN Biblioteca.utente ON prestito.id_utente = utente.id_utente
WHERE utente.eta BETWEEN 18 AND 24;
 
 SELECT libro.titolo, libro.autore, utente.nome,utente.cognome
 FROM Biblioteca.libro
 JOIN Biblioteca.prestito ON libro.id_libro = prestito.id_libro
 JOIN Biblioteca.utente ON prestito.id_utente = utente.id_utente
 WHERE prestito.data_prestito BETWEEN '2020-01-01' AND '2020-12-31';

 -- Esercitazione 2
 SELECT * FROM Utente WHERE eta>=25;
 SELECT * FROM Utente WHERE nome LIKE 'F%';
 SELECT * FROM Utente WHERE email LIKE '%gmail%';
 SELECT * FROM Utente WHERE cognome LIKE '%lli';
 SELECT * FROM Utente WHERE eta BETWEEN 18 AND 30;
 SELECT DISTINCT autore FROM Libro; 
 SELECT * FROM Libro where titolo LIKE '%amore%';
 SELECT * FROM Libro WHERE anno_pubblicazione<1900;
 SELECT * FROM Libro WHERE isbn IS NOT NULL;
 SELECT * FROM Prestito WHERE data_restituzione IS NULL;
 SELECT * FROM Prestito WHERE data_prestito BETWEEN '2024-01-01' AND '2024-12-31';
 
 SELECT Utente.nome,Utente.cognome,Prestito.data_prestito FROM Utente
 JOIN Biblioteca.prestito ON prestito.id_utente = utente.id_utente;

SELECT DISTINCT Libro.titolo FROM Libro
JOIN Biblioteca.prestito ON libro.id_libro = prestito.id_libro;
 
SELECT Utente.nome, Libro.titolo  FROM Utente
JOIN Prestito ON utente.id_utente= prestito.id_utente
JOIN Libro ON prestito.id_libro = libro.id_libro;

SELECT * FROM Prestito
JOIN Utente ON  utente.id_utente = prestito.id_utente
WHERE Utente.cognome = 'Galli';

SELECT * FROM Libro
JOIN Prestito ON libro.id_libro= prestito.id_libro
WHERE libro.titolo LIKE '%storia%';

SELECT DISTINCT email FROM Utente
JOIN Prestito  ON Utente.id_utente = Prestito.id_utente;

SELECT titolo FROM Libro
JOIN Prestito ON libro.id_libro = prestito.id_libro
WHERE anno_pubblicazione BETWEEN 1500 AND 1700;

-- Esercitazione3
SELECT Utente.nome,Utente.cognome, Utente.eta FROM Utente
WHERE Utente.eta IN(14,15,22,50);

SELECT Utente.nome,Utente.cognome,Utente.email FROM Utente
INNER JOIN Prestito ON Utente.id_utente = Prestito.id_utente
INNER JOIN Libro ON Libro.id_libro = Prestito.id_libro
WHERE Libro.autore IN('Italo Calvino','Umberto Eco','Elena Ferrante');

SELECT * FROM Prestito
INNER JOIN Libro ON libro.id_libro = Prestito.id_libro
WHERE Libro.anno_pubblicazione IN(2020,2022,2026);

SELECT Utente.nome,Utente.cognome,Utente.email  FROM Utente
INNER JOIN Prestito ON Utente.id_utente=Prestito.id_utente
INNER JOIN Libro ON Libro.id_libro=Prestito.id_libro
WHERE Libro.isbn IS NOT NULL;

SELECT * FROM Prestito
WHERE data_restituzione IS NULL;

SELECT * FROM Prestito
WHERE Prestito.data_restituzione IS NOT NULL;

SELECT Libro.titolo,Libro.autore,Libro.isbn FROM Libro
WHERE id_libro NOT IN (SELECT Prestito.id_libro FROM Prestito);
 -- Esercitazione 4
 SELECT nome,cognome, COUNT(Prestito.id_prestito) AS numero_prestiti FROM Utente
 LEFT JOIN Prestito ON Utente.id_utente = Prestito.id_utente
 GROUP BY Utente.id_utente, Utente.nome,Utente.cognome;
 
 SELECT Libro.titolo, COUNT(Prestito.id_prestito) AS numero_prestiti FROM Libro
 LEFT JOIN Prestito ON Prestito.id_libro= Libro.id_libro
 GROUP BY Libro.titolo;

SELECT AVG(eta) AS eta_media FROM Utente;

SELECT MIN(eta),MAX(eta),AVG (eta) FROM Utente
JOIN Prestito ON Prestito.id_utente=Utente.id_utente;
SELECT MIN(eta),MAX(eta),AVG (eta) FROM Utente
WHERE id_utente IN(SELECT DISTINCT id_utente FROM Prestito)
