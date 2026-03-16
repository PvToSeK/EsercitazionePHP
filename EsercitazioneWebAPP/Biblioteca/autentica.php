<?php
session_start();
$conn = mysqli_connect("localhost","root","","Biblioteca");
if(isset($_POST["email"])&& isset($_POST["password"])){
$email= $_POST["email"];
$password = $_POST["password"];
$query =("SELECT * FROM Utente Where email = ? AND psw = ?");
if($stmt = $conn->prepare($query)){
    $stmt->bind_param("ss",$email,$password);
    $stmt->execute();
    $result= $stmt->get_result();
}
}



?>