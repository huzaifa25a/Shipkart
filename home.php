<?php
        $conn = mysqli_connect('localhost','root','','Shipkart');
        if(mysqli_connect_error()){
            die("Failed to connect: ".mysqli_connect_error());
        }
        else{
            @$f_pincode = $_POST['f_pincode'];
            @$t_pincode = $_POST['t_pincode'];
            @$weight = $_POST['weight'];
            @$delivery_service = $_POST['delivery_service'];
            @$price = $_POST['result'];

            $sql = "INSERT INTO `quote` (`f_pincode`, `t_pincode`, `weight`, `delivery_service`, `price`, `date`) VALUES ('$f_pincode', '$t_pincode', '$weight', '$delivery_service', '$price', current_timestamp())";
            $res =  mysqli_query($conn, $sql);

            if ($res) {
                header("Location: details_tentative.html");
            }
            else {
                echo "Error: " . $sql . ":-" . mysqli_error($conn);
            }
            mysqli_close($conn);
        }
?>
