<?php 
 $host ="192.168.1.8";
 $port="6000";
 set_time_limit(0);
 $socket=socket_create(AF_INET,SOCK_STREAM, 0) or die('could not creat socket');
 $result = socket_bind($socket,$host,$port) or die('could not bind to socket');
$result = socket_listen($socket,3) or die('could not listen');

while(true)
{
	$spawn = socket_accept($socket) or die('could not accept connection');
	$input = socket_read($spawn,1024) or die('could not read input');
	$input = trim($input);
	echo"client Message: ".$input;
	$output = strrev($input);
	socket_write($spawn, $output,strlen($output)) or die('could not write out');


}
socket_close($spawn);
socket_close($socket);

 ?>