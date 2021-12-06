<?php 

	$db = mysqli_connect('localhost','root','','wallysprouts');
	if (!$db) {
		echo "Database connection faild";
	}
	$id = $_POST['id'];

	$followers = $db->query("SELECT * FROM followers WHERE user_friend_id = '".$id."' ");
	$list = array();

	while ($rowdata= $followers->fetch_assoc()) {
		$list[] = $rowdata;
	}

	echo json_encode($list);