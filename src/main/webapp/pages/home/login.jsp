<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<% 	
	String userAgent = request.getHeader("user-agent");
	System.out.println(userAgent);
	
	if(userAgent.contains("Mobile")){

		session.setAttribute("userDevice", "mobile");
	}else{
		session.removeAttribute("userDevice");
	};
	//esta implementación es MUY fea ya que solo se checkea en esta página y hay que recargar para que se muestren los cambios.
	//TODO: encontrar forma de que se checke más frecuentemente y sin recargar plox.
%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="assets/styles/main.css">
<script src="assets/scripts/jquery3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="assets/scripts/clock.js" type="text/javascript"></script>

<link rel="icon" href="assets/images/star.ico" type="image/png">
<title>Turismo.UY</title>
</head>


<style>
	@media (max-width: 700px){
		.mobile{
			width: 100% !important;
		}
	}
</style>

<body onload="currentTime()">
<jsp:include page="../../templates/header.jsp" />
	<main class="form-signin w-50 m-auto container-fluid mobile">
		<form action=" <%= request.getContextPath() %>/login" method="post" accept-charset="UTF-8">
			<h1 class="h3 mb-3 fw-normal pt-3">Iniciar Sesión</h1>

			<div class="form-floating my-3">
				<input type="email" class="form-control" name="loginUserEmailInput"
					placeholder="nombre@ejemplo.com" required> <label
					for="credencialInput"> E-Mail</label>
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
<jsp:include page="../../templates/footer.jsp" />
</body>
</html>
