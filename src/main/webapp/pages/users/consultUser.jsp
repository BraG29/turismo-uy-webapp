<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	DtUser userData = (DtUser) request.getAttribute("userData");
	String imagePath = (String) request.getAttribute("imagePath");
%>


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

<body>
	<script src="templates/header.js"></script>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<img src="<%= imagePath %>" class="card-img-top"
						alt="Foto de perfil">
					<div class="card-body">
						<h5 class="card-title"><%= session.getAttribute("userName") %></h5>
						<p class="card-text">Correo Electrónico: <%= userData.getEmail() %></p>
						<p class="card-text">Nickname: <%= userData.getNickname() %></p>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Información del Perfil</h5>
						<p class="card-text">Aquí puedes agregar más detalles sobre el
							usuario.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="templates/footer.js"></script>
</body>

</html>