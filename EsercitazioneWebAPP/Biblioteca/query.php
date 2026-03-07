<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    $conn = mysqli_connect("localhost","root","","Biblioteca");
if (isset($_GET['eta'])){
$eta = $_GET['eta'];
$query = ("SELECT nome,cognome,eta FROM Utente WHERE eta = $eta");
$result = mysqli_query($conn,$query);

if($result -> num_rows > 0){
    while($riga = $result -> fetch_assoc()){
        echo "Nome: ".$riga["nome"]."<br>"; 
        echo "Cognome: ".$riga["cognome"]."<br>"; 
        echo "Eta: ".$riga["eta"]."<br>";
        
    }
}else{
    echo "Nessun utente trovato per l'età $eta ";
}
}

    
    ?>
</body>
</html>