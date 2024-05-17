<?php

// Vamos a crear la conexión a la base de datos

$hostname = "localhost";
$username = "root";
$password = "root";
$database = "tb_clientes";

$conexion = new mysqli($hostname, $username, $password, $database);

if ($conexion->connect_error) {
    die("La conexión falló: " . $conexion->connect_error);
}

?>