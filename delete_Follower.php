<?php
	$db = mysqli_connect('localhost','root','','wallysprouts');
	if (!$db) {
		echo "Database connection faild";
	}

	$follower_id = $_POST['follower_id'];


	$db->query("DELETE FROM followers WHERE followers.followers_id = '".$follower_id."'");


?>