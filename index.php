<!doctype html>
<html lang="en">

<head>
	<title>Title</title>
	<!-- Required meta tags -->
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

	<!-- Bootstrap CSS v5.2.1 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
	<style>
		body {
			background-color: #f7f9fc;
		}

		.container {
			margin-top: 20px;
		}

		.form-container {
			background-color: #e3f2fd;
			padding: 20px;
			border-radius: 10px;
		}

		.table-container {
			margin-top: 20px;
		}

		h1,
		h4 {
			color: #007bff;
		}

		.btn-primary {
			background-color: #007bff;
			border-color: #007bff;
		}
	</style>
</head>

<body>
	<main>
		<div class="container">
			<h1 class="text-center">Clientes</h1>
			<div class="row justify-content-center">
				<div class="col-md-4 form-container">
					<h4>Formulario</h4>
					<form action="./insert.php" method="post">
						<div class="form-group">
							<label for="nombre">Nombre</label>
							<input type="text" class="form-control" id="nombre" name="nombre" required>
						</div>
						<div class="form-group">
							<label for="ap_paterno">Apellido Paterno</label>
							<input type="text" class="form-control" id="ap_paterno" name="ap_paterno" required>
						</div>
						<div class="form-group">
							<label for="ap_materno">Apellido Materno</label>
							<input type="text" class="form-control" id="ap_materno" name="ap_materno" required>
						</div>
						<div class="form-group">
							<label for="fecha_nacimiento">Fecha de Nacimiento</label>
							<input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" required>
						</div>
						<div class="form-group">
							<label for="correo_electronico">Correo Electrónico</label>
							<input type="email" class="form-control" id="correo_electronico" name="correo_electronico" required>
						</div>
						<div class="form-group">
							<label for="telefono">Teléfono</label>
							<input type="tel" class="form-control" id="telefono" name="telefono" required>
						</div>
						<button type="submit" class="btn btn-primary btn-block mt-3">Enviar</button>
					</form>
				</div>
				<div class="col-md-8 table-container">
					<h4>Tabla</h4>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>Nombre Completo</th>
								<th>Fecha de Nacimiento</th>
								<th>Correo Electrónico</th>
								<th>Teléfono</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
							<?php
							include './conexion/conexion.php';

							$query = "SELECT * FROM clientes";

							$resultado = $conexion->query($query);

							if ($resultado->num_rows > 0) {
								while ($fila = $resultado->fetch_assoc()) {
									echo "
									<tr>
										<td>{$fila['nombre']} {$fila['ap_paterno']} {$fila['ap_materno']}</td>
										<td>{$fila['fecha_nacimiento']}</td>
										<td>{$fila['correo_electronico']}</td>
										<td>{$fila['telefono']}</td>
										<td>
											<button class='btn btn-warning btn-sm'>Editar</button>
											<button class='btn btn-danger btn-sm'>Eliminar</button>
										</td>
									</tr>
									";
								}
							}
							?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<!-- Bootstrap JavaScript Libraries -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous">
	</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous">
	</script>
</body>

</html>