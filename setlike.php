 

<?php
include "connect.php";
if ($_SERVER['REQUEST_METHOD'] == "POST"){

   

  // check if user excist
   
  $like_user = $_POST['likeuser'];
   
  $like_post = $_POST['likepost'];
   

   
   { // if user not exist =>  not rigister => start register
    $stmt   = $con->prepare("INSERT INTO liked(`like_user`, `like_post`)VALUES('".$like_user."','".$like_post."')");
    $stmt->execute(array($like_user ,$like_post)) ;
    $row = $stmt->rowcount() ;
    if ($row > 0) {
      // echo "success" ;
      echo json_encode(array('status' => "success"));
    }
  }
  // End Check
}
?>