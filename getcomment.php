<?php

include "connect.php" ;
$postid =$_POST['postid'];
 
 $sql  = "SELECT comments.* , users.*  FROM comments
  INNER JOIN users ON  comments.com_user = users.id  WHERE com_post = $postid" ;  
 $stmt = $con->prepare($sql);
 $stmt->execute(array($postid)) ; 
 $all = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($all) ; 
