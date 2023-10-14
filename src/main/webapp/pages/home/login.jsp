<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/styles/bootstrap4.5.2.min.css">
<link rel="stylesheet" href="assets/styles/main.css">
<script src="assets/scripts/jquery3.5.1.min.js"></script>
<script src="assets/scripts/bootstrap4.5.2.min.js"></script>
    <script src="../../assets/scripts/bootstrap5.2.3.bundle.min.js"></script>
<script src="assets/scripts/clock.js" type="text/javascript"></script>
<link rel="icon" href="assets/images/star.ico" type="image/png">
<title>Turismo.UY</title>
</head>

<body onload="currentTime()">
	<script src="templates/header.js"></script>
	<main class="form-signin w-50 m-auto container-fluid">
		<form action=" <%= request.getContextPath() %>/login" method="post" accept-charset="UTF-8">
			<h1 class="h3 mb-3 fw-normal pt-3">Iniciar Sesión</h1>

			<div class="form-floating my-3">
				<input type="email" class="form-control" name="loginUserEmailInput"
					placeholder="nombre@ejemplo.com" required> <label
					for="credencialInput">Nickname o Mail</label>
			</div>
			<div class="form-floating my-3">
				<input type="password" class="form-control"
					name="loginUserPasswordInput" placeholder="Password" required>
				<label for="loginUserPasswordInput">Contraseña</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">Iniciar
				Sesión</button>
		</form>
		<a href="<%= request.getContextPath() %>/register">¿No tienes cuenta? <b>Registrate
				aquí</b></a>
	</main>
	<script src="templates/footer.js"></script>
</body>
</html>
