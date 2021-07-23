<?php 

	//PDO or MySQLI to connect

	$connect = mysqli_connect('localhost', 'root', '', 'grocery');

	// check connection

	if (!$connect) {
		echo "Connection error: " . msqli_connect_error();
	}

 ?>