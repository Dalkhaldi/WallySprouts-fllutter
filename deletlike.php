 
<?php
include "connect.php";
if ($_SERVER['REQUEST_METHOD'] == "POST"){

	$com_id = $_POST['com_id'];
  // check if user excist

   
   { // if user not exist =>  not rigister => start register
    $stmt   = $con->prepare("DELETE FROM comments WHERE comments.com_id = ?") ;
    $stmt->execute(array($com_id)) ;
    $row = $stmt->rowcount() ;
    if ($row > 0) {
      // echo "success" ;
      echo json_encode(array('com_id' => $com_id , 'status' => "success"));
    }
  
  // End Check
}}
?>

