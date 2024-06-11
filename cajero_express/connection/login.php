<?php 
//print_r($_POST);
session_start();

if(isset($_POST['n_tarjeta']) && isset($_POST['nip'])){
    require_once './conn.php';
    $n_tarjeta = $_POST['n_tarjeta'];
    $nip = $_POST['nip'];
    $sql = "SELECT * FROM tb_tarjetas WHERE n_tarjeta = '$n_tarjeta' AND nip = '$nip'";
    $result = $conn->query($sql);
    if($result->num_rows > 0){
        $row = $result->fetch_assoc();
        $_SESSION['id'] = $row['id_tarjeta'];
        $_SESSION['n_tarjeta'] = $row['n_tarjeta'];
        $_SESSION['saldo'] = $row['saldo'];
        $_SESSION['id_cliente'] = $row['id_cliente'];
        header("Location: ../view/bienvenida/index.php");
    }else{
        $_SESSION['error'] = "El número de tarjeta o el NIP son incorrectos";
        header("Location: ../index.html");
    }
}else{
    $_SESSION['error'] = "Completa todos los campos";
    header("Location: ../index.html");
}
?>