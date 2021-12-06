<?php

include "connect.php" ;
 
 $sql  = "SELECT liked.* , post.*  FROM liked INNER JOIN post ON  liked.like_post = post.post_id " ;  
 $stmt = $con->prepare($sql);
 $stmt->execute() ; 
 $all = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($all) ; 
