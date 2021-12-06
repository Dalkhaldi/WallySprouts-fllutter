<?php
	$db = mysqli_connect('localhost','root','','wallysprouts');
	if (!$db) {
		echo "Database connection faild";
	}

	$like_user = $_POST['likeuser'];
   
    $like_post = $_POST['likepost'];
   


	$db->query("DELETE FROM liked WHERE liked.like_uer=? AND liked.like_post=?");


?>