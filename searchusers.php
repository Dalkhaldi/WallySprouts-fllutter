 <?php

include "connect.php" ;
   
   $username =  $_POST['query'] ;
     
   $where =  " WHERE username Like  '$username%'  "   ; 
 
 $sql  = " SELECT events.* , users.* FROM events INNER JOIN users ON events.event_user = users.id $where" ;  //"SELECT events.* , users.* FROM events INNER JOIN users ON events.event_user = users.id"
 $stmt = $con->prepare($sql);
 $stmt->execute() ; 
 $events = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($events) ;