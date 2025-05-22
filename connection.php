<?php      
	//connecting to database
    $servername = "localhost";  
    $username = "root";  
    $password = ""; 
    $database = "Shipkart"; 
      
	//Creating a connection  
    $conn=mysqli_connect($servername, $username, $password, $database); 
	
	//Die if connection is not successful
    if(!$conn)
    {  
        die("Failed to connect: ". mysqli_connect_error());  
    }  

    //Creating a database
    $sql = "CREATE DATABASE Shipkart";
    mysqli_query($conn, $sql);

    //Creating a table
    $sql = "CREATE TABLE `quote` ( `f_pincode` INT(6) NULL , `t_pincode` INT(6) NULL , `weight` INT(5) NULL , 
    `delivery_service` VARCHAR(11) NULL , `price` INT(6) NULL , `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP)";
    mysqli_query($conn, $sql);

?>  