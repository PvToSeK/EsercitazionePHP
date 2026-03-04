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