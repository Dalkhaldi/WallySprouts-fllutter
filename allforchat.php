 
<?php

include "connect.php" ;
$type="a";
 
 $sql  = "SELECT * FROM users  " ;  
 $stmt = $con->prepare($sql);
 $stmt->execute() ; 
 $all = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($all) ; 

 