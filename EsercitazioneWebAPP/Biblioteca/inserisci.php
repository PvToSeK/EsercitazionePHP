<?php
$con = mysqli_connect("localhost", "root", "", "Biblioteca");

$idUtente = $_POST['id_utente'];
$nome     = $_POST['nome'];
$cognome  = $_POST['cognome'];
$email    = $_POST['email'];
$eta      = $_POST['eta'];

$query = "INSERT INTO utente (id_utente, nome, cognome, email, eta) 
          VALUES ($idUtente, '$nome', '$cognome', '$email', $eta)";

$result = mysqli_query($con, $query);

if ($result) {
    echo "Inserimento riuscito";
} else {
    echo "Errore: " . mysqli_error($con);
}

mysqli_close($con);
?>
