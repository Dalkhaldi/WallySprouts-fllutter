<?php
	$db = mysqli_connect('localhost','root','','wallysprouts');
	if (!$db) {
		echo "Database connection faild";
	}
    $file = $_FILES['video_path']['name'];
	$image = $_FILES['video_image']['name'];
	$videoName = $_POST['video_name'];
	$videotype = $_POST['video_type'];
	$childage  = $_POST['child_age'];
 
	$imagePath = 'childvideo/'.$image;
	$filePath = 'childvideo/'.$file;
	$tmp_name = $_FILES['video_image']['tmp_name'];
	
	$tmp_video = $_FILES['video_path']['tmp_name'];
	

	move_uploaded_file($tmp_name, $imagePath);
	move_uploaded_file($tmp_video, $filePath);

	$db->query("INSERT INTO video(video_name , video_type , child_age ,video_path , video_image )VALUES('".$videoName."','".$videotype."','".$childage."','".$file."','".$image."' )");


?>