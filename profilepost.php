<?php

include "connect.php" ;
   
   $id =  $_POST['id'] ;
     
   $where =  " WHERE post_user Like  '$id%'  "   ; 
 
 $sql  = " SELECT post.* , users.* FROM post INNER JOIN users ON post.post_user = users.id $where" ;  
 $stmt = $con->prepare($sql);
 $stmt->execute() ; 
 $post = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($post) ;