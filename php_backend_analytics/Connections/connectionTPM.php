<?php

	$conn = new mysqli("127.0.0.1", "root", "root", "demo_tpm");

	//check connection
	if($conn -> connect_errno){
		echo "Connection Error: " . $conn -> connect_error;
		exit();
    }

?>