 
<?php
include "connect.php";
if ($_SERVER['REQUEST_METHOD'] == "POST"){

	$post_id = $_POST['post_id'];
  // check if user excist

   
   { // if user not exist =>  not rigister => start register
    $stmt   = $con->prepare("DELETE FROM post WHERE post.post_id = ?") ;
    $stmt->execute(array($post_id)) ;
    $row = $stmt->rowcount() ;
    if ($row > 0) {
      // echo "success" ;
      echo json_encode(array('post_id' => $post_id , 'status' => "success"));
    }
  
  // End Check
}}
?>

