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
    titolo VARCHAR(20) NOT NULL,
    autore VARCHAR(20) NOT NULL,
    isbn VARCHAR(13) UNIQUE,
    anno_pubblicazione INT CHECK (anno_pubblicazione >= 1500)
);

CREATE TABLE Biblioteca.prestito (
    id_prestito INT PRIMARY KEY,
    id_libro INT,
    id_utente INT,
    data_prestito DATE NOT NULL,
    data_restituzione DATE CHECK (data_restituzione > data_prestito),

    CONSTRAINT fk_prestito_utente
        FOREIGN KEY (id_utente)
        REFERENCES Biblioteca.utente(id_utente),

    CONSTRAINT fk_prestito_libro
        FOREIGN KEY (id_libro)
        REFERENCES Biblioteca.libro(id_libro)
);

INSERT INTO Biblioteca.utente VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@gmail.com', 25),
(2, 'Giulia', 'Bianchi', 'giulia.bianchi@yahoo.com', 19),
(3, 'Luca', 'Verdi', 'luca.verdi@gmail.com', 34),
(4, 'Sara', 'Neri', 'sara.neri@gmail.com', 16),
(5, 'Anna', 'Gialli', 'anna.gialli@hotmail.com', 22),
(6, 'Marco', 'Blu', 'marco.blu@gmail.com', 17),
(7, 'Elena', 'Rosa', 'elena.rosa@libero.it', 28),
(8, 'Davide', 'Marroni', 'davide.marroni@gmail.com', 15),
(9, 'Nicolo', 'Rossi', 'nicolo.rossi@gigi.com', 23);


INSERT INTO Biblioteca.libro VALUES
(1, 'Il Nome della Rosa', 'Umberto Eco', '9788845240001', 1980),
(2, '1984', 'George Orwell', '9780451520002', 1949),
(3, 'Il Codice Da Vinci', 'Dan Brown', '9788804660003', 2003),
(4, 'Hunger Games', 'Suzanne Collins', '9788804670004', 2008),
(5, 'Il Trono di Spade', 'George R. R. Martin', '9788804680005', 2011),
(6, 'Inferno', 'Dan Brown', '9788804690006', 2013),
(7, 'Ready Player One', 'Ernest Cline', '9788804700007', 2011),
(8, 'Il Labirinto', 'James Dashner', '9788804710008', 2012);

INSERT INTO Biblioteca.prestito VALUES
(5, 1, 2, '2026-04-10', '2026-04-20'),
(6, 2, 3, '2023-05-12', '2023-05-22'),
(7, 3, 4, '2024-06-01', NULL),
(8, 5, 5, '2026-07-15', '2026-07-25'),
(9, 6, 6, '2025-01-10', NULL),
(10, 1, 3, '2024-09-05', '2024-09-15'),
(11, 7, 8, '2023-11-20', '2023-12-01'),
(12, 5, 1, '2024-10-02', NULL),
(13, 2, 9, '2026-02-15', NULL);


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
 WHERE utente.email = 'nicolo.rossi@gigi.com'
 

