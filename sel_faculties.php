<html>
    <head>
        <title>Selected faculties</title>
         <style>

             
         </style>
    </head>

    <body>
    <center>
    <h3>SELECTED FACULTIES</h3>
    <table border="2">

        <tr>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>POST APPLIED FOR</th>
            <th>COURSE</th>
            <th>DEGREE PERCENTAGE</th>
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
$query = "select * from sel_faculty";
$data = mysqli_query($conn, $query);
$total = mysqli_num_rows($data);
if($total > 0)
 {
     while($row = mysqli_fetch_assoc($data))
     {
        echo '<tr>';
        echo '<td>'.$row['name'].'</td>';
        echo '<td>'.$row['email'].'</td>';
        echo '<td>'.$row['paf'].'</td>';
        echo '<td>'.$row['course'].'</td>';
        echo '<td>'.$row['dp'].'</td>';
        echo '</tr>';
     }
 }
 else{
     echo "NO DATA CURRENTLY AVAILABLE";
 }
?>
