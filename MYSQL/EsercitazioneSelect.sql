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