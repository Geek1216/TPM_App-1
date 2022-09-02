<?php

	$conn = new mysqli("127.0.0.1", "root", "root", "test_db_may");

	//check connection
	if($conn -> connect_errno){
		echo "Connection Error: " . $conn -> connect_error;
		exit();
    }

?>