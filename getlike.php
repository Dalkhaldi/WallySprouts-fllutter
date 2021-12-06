<?php

include "connect.php" ;
$postid =$_POST['postid'];
 
 $sql  = "SELECT liked.* , users.*  FROM liked
  INNER JOIN users ON  liked.like_user = users.id  WHERE like_post = $postid" ;  
 $stmt = $con->prepare($sql);
 $stmt->execute(array($postid)) ; 
 $all = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($all) ; 
