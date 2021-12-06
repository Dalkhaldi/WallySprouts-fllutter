 <?php
include "connect.php";
if ($_SERVER['REQUEST_METHOD'] == "POST"){

  
  $id =$_POST['id'];
  
  
  $stmt = $con->prepare("SELECT * FROM users WHERE id = ? ") ;
  $stmt->execute(array($id));

  $user = $stmt->fetch() ;

   $row = $stmt->rowcount()  ;

   if ($row > 0) {
       $id        = $user['id'] ;
       $username  = $user['username'] ;
       $user_image     = $user['user_image'] ;
       $Bio=$user['Bio'] ;
        
       echo json_encode(array('id' => $id , 'username' => $username ,'user_image' => $user_image,'Bio' =>$Bio  , 'status' => "success"));
   }else {
     echo json_encode (array('status' => "faild" , 'id' => $id    ) );
 } 


}
?>
  