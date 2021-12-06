<?php
include "connect.php";
if ($_SERVER['REQUEST_METHOD'] == "POST"){

    $email    = filter_var( $_POST['email'] , FILTER_SANITIZE_EMAIL) ;


    $stmt = $con->prepare("SELECT * FROM users WHERE email = ? ") ;
    $stmt->execute(array($email));

    $user = $stmt->fetch() ;

    $row = $stmt->rowcount()  ;

    if ($row > 0) {
        
        $email     = $user['email'] ;
        
        echo json_encode(array( 'email' => $email , 'status' => "success"));
    }else {
        echo json_encode (array('status' => "faild" , 'email' => $email ) );
    }


}
?>
