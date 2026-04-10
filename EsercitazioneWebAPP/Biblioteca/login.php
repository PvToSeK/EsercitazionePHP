<?php 
$conn = mysqli_connect("localhost","root","","Biblioteca");
if($conn->connect_error){
    die("Connection failed: ".$conn->connect_error);
}
if(isset($_POST['password']) && isset($_POST['email'])){
    $password = $_POST['password'];
    $email = $_POST['email'];

    if(strlen($password) <8){
        echo "Inserire una password da 8 o più caratteri";
    }else{

        $query = ("SELECT *  FROM Utente WHERE email = '$email' AND psw = '$password' ");
        $result = mysqli_query($conn,$query);
    }

};





?>