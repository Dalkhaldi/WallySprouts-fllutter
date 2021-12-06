 <?php

include "connect.php" ;
 
 $sql  = "SELECT * FROM users" ;  
 $stmt = $con->prepare($sql);
 $stmt->execute() ; 
$search = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($search) ; 