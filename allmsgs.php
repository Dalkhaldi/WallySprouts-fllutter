<?php

include "connect.php" ;
$user1id =$_POST['user1id'];
$user2id =$_POST['user2id'];
 
 $sql  = "SELECT * FROM maseges WHERE user1id IN ('$user1id','$user2id') AND user2id IN( '$user2id','$user1id')  " ;  
 $stmt = $con->prepare($sql);
 $stmt->execute(array($user1id,$user2id)) ; 
 $all = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($all) ; 

 
  