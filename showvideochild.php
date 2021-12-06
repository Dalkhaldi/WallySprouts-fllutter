 
<?php

include "connect.php" ;
$video_id = $_POST['video_id'];
 
 
 $sql  = "SELECT * FROM video WHERE video_id = ? " ;  
 $stmt = $con->prepare($sql);
 $stmt->execute(array($video_id)) ; 
 $all = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($all) ; 
