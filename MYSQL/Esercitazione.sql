CREATE DATABASE Biblioteca;

CREATE TABLE Biblioteca.utente (
    id_utente INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL UNIQUE,
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
(1, 'Mario', 'Rossi', 'm.rossi@mail.it', 25),
(2, 'Giulia', 'Bianchi', 'g.bianchi@mail.it', 19),
(3, 'Luca', 'Verdi', 'l.verdi@mail.it', 34),
(4, 'Sara', 'Neri', 's.neri@mail.it', 16);

INSERT INTO Biblioteca.libro VALUES
 (1, 'Il Nome Rosa', 'Eco', '978884524', 1980),
(2, '1984', 'Orwell', '978045152', 1949),
(3, 'Divina Commedia', 'Dante', '978014243', 1600),
(4, 'Il Principe', 'Machiavelli', '978019953', 1532);

INSERT INTO Biblioteca.prestito VALUES 
(1, 1, 1, '2024-01-10', '2024-01-20'),
(2, 2, 2, '2024-02-01', NULL),
(3, 3, 1, '2024-02-15', '2024-02-28'),
(4, 4, 3, '2024-03-01', NULL);