<?php

	//connect to database
	$conn = new mysqli("127.0.0.1", "Preston", "Hartpre13", "tpm_forms");

	//check connection
	if($conn -> connect_errno){
		echo "Connection Error: " . $conn -> connect_error;
		exit();
    }

?>