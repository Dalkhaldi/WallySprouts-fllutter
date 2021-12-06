 <?php

include "connect.php" ;
   
   $bookname =  $_POST['query'] ;
     
   $where =  " WHERE name Like  '$bookname%'  "   ; 
 
 $sql  = " SELECT * FROM books $where" ;  
 $stmt = $con->prepare($sql);
 $stmt->execute() ; 
 $books = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($books) ;