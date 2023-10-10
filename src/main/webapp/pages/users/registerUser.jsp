<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../assets/styles/bootstrap4.5.2.min.css">
    <link rel="stylesheet" href="../../assets/styles/main.css">
    <script src="../../assets/scripts/jquery3.5.1.min.js"></script>
    <script src="../../assets/scripts/bootstrap4.5.2.min.js"></script>
    <script src="../../assets/scripts/clock.js" type="text/javascript"></script>
    <link rel="icon" href="../../assets/images/star.ico" type="image/png">
    <title>Turismo.UY</title>
</head>

<body onload="currentTime()">
    <div class="">
        <script src="../../templates/header.js"></script>
        <main class="form-signin w-50 m-auto container-fluid">
            <form action="registerUser" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
                <h1 class="h3 mb-3 fw-normal pt-3">Registro</h1>
                <div class="input-group">
                    <span class="input-group-text">Nombre y Apellido</span>
                    <input type="text" aria-label="First name" class="form-control" required>
                    <input type="text" aria-label="Last name" class="form-control" required>
                </div>
                <br>

                nickname (Ãºnico en la pla-taforma),
                <br>
                nombre,
                <br>
                apellido,<br>
                contraseÃ±a,<br>
                confirmaciÃ³n de contraseÃ±a,<br>
                correo electrÃ³nico (Ãºnico),<br>
                fecha de nacimiento,<br>
                y (opcionalmente) una imagen.<br>


                Turista: Nacionalidad
                <br>

                Proveedor: Descripcion y link pagina,
                <button class="w-100 btn btn-lg btn-primary" type="submit">Iniciar SesiÃ³n</button>
            </form>
            <a href="../home/login.html">Volver al inicio de sesiÃ³n</a>
        </main>
        <script src="../../templates/footer.js"></script>
    </div>
</body>

</html>