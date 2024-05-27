<?php
//print_r($_GET);

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
        <div class="container">
            <h1 class="text-center">Editar usuario</h1>
            <div class="row justify-content-center">
                <div class="col-md-4 form-container">
                    <h4>Formulario</h4>
                    <form action="./update.php" method="post">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" value="<?= $fila['nombre']; ?>" id="nombre" name="nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="ap_paterno">Apellido Paterno</label>
                            <input type="text" class="form-control" id="ap_paterno" value="<?= $fila['ap_paterno']; ?>" name="ap_paterno" required>
                        </div>
                        <div class="form-group">
                            <label for="ap_materno">Apellido Materno</label>
                            <input type="text" class="form-control" id="ap_materno" value="<?= $fila['ap_materno']; ?>" name="ap_materno" required>
                        </div>
                        <div class="form-group">
                            <label for="fecha_nacimiento">Fecha de Nacimiento</label>
                            <input type="date" class="form-control" id="fecha_nacimiento" value="<?= $fila['fecha_nacimiento']; ?>" name="fecha_nacimiento" required>
                        </div>
                        <div class="form-group">
                            <label for="correo_electronico">Correo Electrónico</label>
                            <input type="email" class="form-control" id="correo_electronico" value="<?= $fila['correo_electronico']; ?>" name="correo_electronico" required>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono</label>
                            <input type="tel" class="form-control" id="telefono" value="<?= $fila['telefono']; ?>" name="telefono" required>
                        </div>
                        <input type="hidden" name="id_cliente" value="<?= $fila['id_cliente']; ?>">
                        <button type="submit" class="btn btn-primary btn-block mt-3">Enviar</button>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <!-- place footer here -->
    </footer>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous">
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous">
    </script>
</body>

</html>