<?php
	function connection(){
		$server="ucka.veleri.hr";
		$username="bsvetlicic";
		$password="11";
		$database="bsvetlicic";
	
		$conn = mysqli_connect($server, $username, $password,$database)
				or die("Nema konekcije na bazu");

		return $conn;		
	}

?>