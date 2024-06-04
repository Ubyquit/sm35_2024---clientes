<?php
// IF si es GET o es POST

// IF si es GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    // IF si el monto es mayor a 0
    if ($_GET['monto'] > 0) {
        // Mostrar el monto
        echo '<h1>Retirar $' . $_GET['monto'] . '</h1>';
    } else {
        // Mostrar mensaje de error
        echo '<h1>El monto no es válido</h1>';
    }
} else {
    // IF si es POST
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // IF si el monto es mayor a 0
        if ($_POST['monto'] > 0) {
            // Mostrar el monto
            echo '<h1>Retirar $' . $_POST['monto'] . '</h1>';
        } else {
            // Mostrar mensaje de error
            echo '<h1>El monto no es válido</h1>';
        }
    }
}

?>