<?php
print_r($_GET);

$id_cliente = $_GET['id_cliente'];

include './conexion/conexion.php';

$query = "CALL sp_buscar_cliente_id('$id_cliente')";

$resultado = $conexion->query($query);

$fila = $resultado->fetch_assoc();
?>

<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>

<body>
    <header>
        <!-- place navbar here -->
    </header>
    <main>
        <h3>Perfil de <?= $fila['nombre'] ?> <?= $fila['ap_paterno'] ?> <?= $fila['ap_materno'] ?></h3>

        <div class="container">
            <div class="row">
                <div class="col-4">
                    <!--Aqui van los datos del usuario-->
                    <p>Correo Electronico: <?= $fila['correo_electronico'] ?></p>
                    <p>Telefono: <?= $fila['telefono'] ?></p>
                </div>
                <div class="col-8">mundo
                    <!--Aqui van la tabla-->
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Dirección</th>
                                <th>Codigo postal</th>
                                <th>Referencia</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Reg. 227 Mnz 30 l12</td>
                                <td>77516</td>
                                <td>Cerca de mall</td>
                                <td>
                                    <a href="">Editar</a>
                                    <a href="">Eliminar</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

    </main>
    <footer>
        <!-- place footer here -->
    </footer>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>

</html>