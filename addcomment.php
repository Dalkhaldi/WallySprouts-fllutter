 

<?php
include "connect.php";
if ($_SERVER['REQUEST_METHOD'] == "POST"){

   

  // check if user excist
   
  $comment_user = $_POST['commentuser'];
  $comment = $_POST['comment'];
  $comment_post = $_POST['commentpost'];
   

   
   { // if user not exist =>  not rigister => start register
    $stmt   = $con->prepare("INSERT INTO comments(`comment`, `com_user`, `com_post`)VALUES('".$comment."','".$comment_user."','".$comment_post."')");
    $stmt->execute(array($comment ,$comment_user ,$comment_post)) ;
    $row = $stmt->rowcount() ;
    if ($row > 0) {
      // echo "success" ;
      echo json_encode(array('status' => "success"));
    }
  }
  // End Check
}
?>