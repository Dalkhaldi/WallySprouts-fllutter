 
<?php

include "connect.php" ;
$video_type = $_POST['video_type'];
$child_age = $_POST['child_age'];
 
 $sql  = "SELECT * FROM video WHERE video_type = ? AND child_age = ?" ;  
 $stmt = $con->prepare($sql);
 $stmt->execute(array($video_type,$child_age)) ; 
 $all = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 

 echo json_encode($all) ; 
