<?php 
$conn = mysqli_connect("localhost","root","","Biblioteca");
if (isset($_GET['eta'])){
$eta = $_GET['eta'];
$query = ("SELECT nome,cognome,eta FROM Utente WHERE eta = $eta");
$result = mysqli_query($conn,$query);
}







if($result -> num_rows > 0){
    while($riga = $result -> fetch_assoc()){
        echo "Nome: ".$riga->nome;
        echo "Cognome: ".$riga->cognome;
        echo "Eta: ".$riga->eta;
        
    }
}






?>