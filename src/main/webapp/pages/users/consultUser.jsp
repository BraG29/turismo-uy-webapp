<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	DtUser userData = (DtUser) request.getAttribute("userData");

	String imagePath = (String) request.getAttribute("imagePath");

	String fullUserName = String.format("%s %s", userData.getName(), userData.getLastName());
	
	// Formateo de la fecha de tipo: dd/MM/yyyy
	DateTimeFormatter format = DateTimeFormatter.ofPattern("d MMMM 'de' yyyy");

	// Saco la fecha ya formateada como se explico antes
	String birthDateStr = userData.getBirthDate().format(format);
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
<script src="assets/scripts/clock.js" type="text/javascript"></script>
<link rel="icon" href="assets/images/star.ico" type="image/png">
<title>Turismo.UY</title>
</head>

<body>

	<jsp:include page="../../templates/header.jsp" />

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<img src="<%=imagePath%>" class="card-img-top"
						alt="Foto de perfil">
					<div class="card-body">
						<h5 class="card-title"><%= fullUserName %> </h5>
						<p class="card-text">
							Correo Electrónico:
							<%=userData.getEmail()%></p>
						<p class="card-text">
							Nickname:
							<%=userData.getNickname()%></p>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Información del Perfil</h5>
						<p class="card-text">Fecha de Nacimiento: <%= birthDateStr %></p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>


	<jsp:include page="../../templates/footer.jsp" />

</body>

</html>