<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "college";


// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
 die("Connection failed: " . mysqli_connect_error());
}

        $first_name =  $_POST['first_name'];
        $last_name =  $_POST['last_name'];
        $email = $_POST['email'];
        $mobno = $_POST['mobno'];
        $city = $_POST['city'];
        $fname = $_POST['fname'];
        $jee = $_POST['jee_score'];


        
$sql = "INSERT INTO addmission VALUES ('$first_name','$last_name','$email','$mobno','$city','$fname','$jee')";


if (mysqli_query($conn, $sql)) {
 echo "New record created successfully with form input";
} else {
 echo "Error: " . $sql . "<br><br><br>" . mysqli_error($conn);
}

mysqli_close($conn);
?>