<?php

include './conexion/conexion.php';

//print_r($_POST);

$nombre = $_POST['nombre'];
$ap_paterno = $_POST['ap_paterno'];
$ap_materno = $_POST['ap_materno'];
$fecha_nacimiento = $_POST['fecha_nacimiento'];
$correo_electronico = $_POST['correo_electronico'];
$telefono = $_POST['telefono'];

$query = "CALL sp_insertar_cliente('$nombre','$ap_paterno','$ap_materno','$fecha_nacimiento','$correo_electronico','$telefono')";

$insert = $conexion->query($query);

header('Location: ./index.php');
