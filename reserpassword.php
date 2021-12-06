<?php
include "connect.php";
if ($_SERVER['REQUEST_METHOD'] == "POST"){

   
  $email    = filter_var($_POST['email'] , FILTER_SANITIZE_EMAIL);
  $password =  $_POST['password'] ;

  // check if user excist

     
    $stmt   = $con->prepare("UPDATE users SET password ='$password' WHERE  email = '$email'") ;
    $stmt->execute(array($password)) ;
    $row = $stmt->rowcount() ;
    if ($row > 0) {
      // echo "success" ;
      echo json_encode(array('email' => $email,'password' => $password , 'status' => "success"));
    }
  }
  // End Check

?>
