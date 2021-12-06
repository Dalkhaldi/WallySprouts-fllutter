<?php
include "connect.php";
if ($_SERVER['REQUEST_METHOD'] == "POST"){

   
   
  $caption = $_POST['caption'];
  $post_id =  $_POST['post_id'] ;
  $post_subject =  $_POST['post_subject'] ;
   

   
     
    $stmt   = $con->prepare("UPDATE post SET caption ='$caption'  , post_subject = '$post_subject'  WHERE  post_id = '$post_id'") ;
    $stmt->execute(array($caption,$post_id,$subject)) ;
    $row = $stmt->rowcount() ;
    if ($row > 0) {
      // echo "success" ;
      echo json_encode(array('status' => "success"));
    }
  }
  // End Check

?>
