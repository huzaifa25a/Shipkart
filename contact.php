<?php
        //Creating Connection
        $conn = mysqli_connect('localhost','root','','Shipkart');

        @$name = $_POST["fname"];
        @$email = $_POST["email"];
        @$subject = $_POST["subject"];

        $tb = "INSERT INTO `contact` (`name` , `email` , `subject`) VALUES ('$name' , '$email' , '$subject')";
        $er = mysqli_query($conn, $tb);

        if(!$er)
            {
                echo (mysqli_error($conn));
            }
        else
            { 
                echo "Thank you!! Your query has been sent.";
            }
        
?>


        

