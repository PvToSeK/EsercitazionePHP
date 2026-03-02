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