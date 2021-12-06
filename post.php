 

<?php
include "connect.php";
if ($_SERVER['REQUEST_METHOD'] == "POST"){

   

  // check if user excist
  $image = $_FILES['image']['name'];
  $name = $_POST['name'];
  $post_user = $_POST['post_user'];
  $caption = $_POST['caption'];
  $post_subject = $_POST['post_subject'];
  $is_vedio = $_POST['is_vedio'];
  $imagePath = 'upload/'.$image;
  $tmp_name = $_FILES['image']['tmp_name'];

  move_uploaded_file($tmp_name, $imagePath);
   { // if user not exist =>  not rigister => start register
    $stmt   = $con->prepare("INSERT INTO post(`post_user`,`caption`,`post_subject`,`imagename`,`image`,`is_vedio`)VALUES('".$post_user."','".$caption."','".$post_subject."','".$name."','".$image."','".$is_vedio."')");
    $stmt->execute(array($post_user ,$post_subject ,$post_subject , $name,$is_vedio)) ;
    $row = $stmt->rowcount() ;
    if ($row > 0) {
      // echo "success" ;
      echo json_encode(array('status' => "success"));
    }
  }
  // End Check
}
?>
