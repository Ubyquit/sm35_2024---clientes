<?php 
$hostname = "localhost";
$username = "root";
$password = "root";
$database = "cajero_express_sm35";

$conn = new mysqli($hostname, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>