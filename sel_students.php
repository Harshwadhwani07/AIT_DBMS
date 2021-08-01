<html>
    <head>
        <title>Selected Students</title>
         <style>

             
         </style>
    </head>

    <body>
    <center>
    <h3>SELECTED STUDENTS</h3>
    <table border="2">

        <tr>
            <th>FIRST_NAME</th>
            <th>LAST_NAME</th>
            <th>EMAIL</th>
            <th>JEE SCORE</th>
        </tr>
</center>
    </body>
</html>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "college";


// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);


$query = "select * from sel_students";
$data = mysqli_query($conn, $query);
$total = mysqli_num_rows($data);
if($total > 0)
 {
     while($row = mysqli_fetch_assoc($data))
     {
        echo '<tr>';
        echo '<td>'.$row['first_name'].'</td>';
        echo '<td>'.$row['last_name'].'</td>';
        echo '<td>'.$row['email'].'</td>';
        echo '<td>'.$row['jee'].'</td>';
        echo '</tr>';
     }
 }
 else{
     echo "NO DATA CURRENTLY AVAILABLE";
 }
?>
