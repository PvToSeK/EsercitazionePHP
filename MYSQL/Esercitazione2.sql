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