<?php
session_start();
$conn = mysqli_connect("localhost","root","","Biblioteca");
if(isset($_SESSION["id_utente"])){
$id_utente = $_SESSION["id_utente"];
$query =("SELECT * FROM Utente Where id_utente = ?");
$stmt= $conn->prepare($query);
$stmt->bind_param("i",$id_utente);
$stmt->execute();
$result= $stmt->get_result();
    if($result -> num_rows > 0){
        $riga = $result -> fetch_assoc();
        echo "Nome: ".$riga["nome"]."<br>"; 
        echo "Cognome: ".$riga["cognome"]."<br>"; 
        echo "Eta: ".$riga["eta"]."<br>";
}
}
?>