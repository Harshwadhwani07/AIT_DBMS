<?php
  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "college";
  
  
  // Create connection
  $con = mysqli_connect($servername, $username, $password, $dbname);
  // Check connection
  if (!$con) {
   die("Connection failed: " . mysqli_connect_error());
  }


    $name = $_POST['name'];
    $email = $_POST['email'];
    $mobno = $_POST['mobno'];
    $city = $_POST['city'];
    $category = $_POST['category'];
    $age = $_POST['age'];
    $paf = $_POST['paf'];
    $course = $_POST['course'];
    $dp = $_POST['DP'];
    $exp = $_POST['EXP'];
    $dcy = $_POST['DCY'];
    $uni = $_POST['UNIVERSITY'];


    $con = mysqli_connect("localhost","root","","college");

    $sql = "INSERT INTO faculty_add VALUES('$name','$email','$mobno','$city','$category','$age','$paf','$course','$dp','$exp','$dcy','$uni')";
    
    if (mysqli_query($con, $sql)) {
      echo "New record created successfully with form input";
     } else {
      echo "Error: " . $sql . "<br><br><br>" . mysqli_error($con);
     }
     
     mysqli_close($con);
    
    ?>