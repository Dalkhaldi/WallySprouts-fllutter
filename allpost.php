<?php

include "connect.php" ;
 
 $sql  = "SELECT post.* , users.*  FROM post INNER JOIN users ON  post.post_user = users.id " ;  
 $stmt = $con->prepare($sql);
 $stmt->execute() ; 
 $all = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($all) ; 
