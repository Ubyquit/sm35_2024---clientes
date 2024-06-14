<?php 

session_start();

if(!isset($_SESSION['id'])){
    header("Location: ../../index.html");
}

$saldo = $_SESSION['saldo'];
?>

<!doctype html>
<html lang="en">

<head>
    <title>Bienvenido a tu cajero</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="../../assets/css/styles.css" />
    <style>
        body {
            background-image: url('../../assets/img/4854835.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }
    </style>
</head>

<body>
    <header>
        <!-- place navbar here -->
    </header>
    <main class="container full-height d-flex flex-column justify-content-center">
        <h1 class="text-secondary-emphasis text-center mb-5 pt-5">Tu saldo actual <?= $saldo; ?></h1>
        <div class="row flex-grow-1">
            <div class="col-6 align-bottom-left">
            <a href="../bienvenida/index.php">
                <div class="card pt-4 pb-4 border-0 rounded-0 shadow mb-3 bg-body-tertiary">
                    <div class="card-body text-center">
                        <h1 class="card-title">atras</h1>
                    </div>
                </div>
            </a>
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