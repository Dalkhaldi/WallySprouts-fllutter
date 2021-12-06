<?php
include "connect.php";
if ($_SERVER['REQUEST_METHOD'] == "POST"){

   
  $image = $_FILES['image']['name'];
  $name = $_POST['name'];
  $id =  $_POST['id'] ;
  $username =  $_POST['username'] ;
  $Bio =  $_POST['Bio'] ;
  $imagePath = 'upload/'.$image;
  $tmp_name = $_FILES['image']['tmp_name'];

  move_uploaded_file($tmp_name, $imagePath);
  // check if user excist

     
    $stmt   = $con->prepare("UPDATE users SET user_image ='$image'  , imagename = '$name' , username ='$username' , Bio ='$Bio' WHERE  id = '$id'") ;
    $stmt->execute(array($image,$name,$username,$Bio)) ;
    $row = $stmt->rowcount() ;
    if ($row > 0) {
      // echo "success" ;
      echo json_encode(array('status' => "success"));
    }
  }
  // End Check

?>
