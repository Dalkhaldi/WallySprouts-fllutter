<?php

include "connect.php" ;
$postid =$_POST['subject'];
 
 $sql  = "SELECT post.* , users.*  FROM post
  INNER JOIN users ON  post.post_user = users.id  WHERE post_subject = $postid" ;  
 $stmt = $con->prepare($sql);
 $stmt->execute(array($postid)) ; 
 $all = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($all) ;