<%@page import="java.util.ArrayList"%>
<%@page import="uy.turismos.servidorcentral.logic.enums.ActivityState"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtProvider"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtTourist"%>
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

Boolean userInSession = (Long) session.getAttribute("userId") == userData.getId();
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/styles/bootstrap4.5.2.min.css">
<link rel="stylesheet" href="assets/styles/main.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- <script src="assets/scripts/bootstrap4.5.2.min.js"></script> -->
<script src="assets/scripts/jquery3.5.1.min.js"></script>
<script src="assets/scripts/bootstrap4.5.2.min.js"></script>
<script src="assets/scripts/bootstrap5.2.3.bundle.min.js"></script>
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
					<img src="<%=imagePath%>" class="card-img-top" alt="Foto de perfil">
					<div class="card-body">
						<h5 class="card-title"><%=fullUserName%>
						</h5>
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
						<p class="card-text">
							Fecha de Nacimiento:
							<%=birthDateStr%></p>
						<%
						if (userData instanceof DtProvider) {
							DtProvider providerData = (DtProvider) userData;
						%>
						<p class="card-text">
							Descripción:
							<%=providerData.getDescription()%></p>
						<p class="card-text">
							Sitio Web: <a href="<%=providerData.getUrl()%>"><%=providerData.getUrl()%></a>
						</p>

						<%

						List<DtTouristicActivity> activitiesToPrint = new ArrayList<DtTouristicActivity>();
							
						Map<Long, String> activityImages = (Map<Long, String>) request.getAttribute("activityImages");
						
						if (providerData.getTouristicActivities() != null) {

								for(DtTouristicActivity activity : providerData.getTouristicActivities()){
									if( userInSession ){
										switch(activity.getState()){
										
										case ACCEPTED:
										case REJECTED:
											activitiesToPrint.add(activity);
											break;
											
										case ADDED:
											activityImages.remove(activity.getId());
										break;
										}
										
									}else{
										switch(activity.getState()){
										
										case ACCEPTED:
											activitiesToPrint.add(activity);
											break;
											
										case REJECTED:
										case ADDED:
											activityImages.remove(activity.getId());
										break;
									}
										
									}
								}
							}
						%>
						<div class="container">
							<h4 class="card-text">Actividades:</h4>
							<ul class="list-group custom-list">
								<%
								for (DtTouristicActivity activity : activitiesToPrint) {
								%>
								<li class="list-group-item">
									<div class="media">
										<img src="<%=activityImages.get(activity.getId())%>"
											class="mr-3" style="width: 100px;"> 
											<div class="media-body"><%= activity.getName() %></div>
										
									</div>
								</li>
								<%
								}
								%>
							</ul>
						</div>
					</div>
					<%
					%>
					<%
					} else {
					DtTourist toursitData = (DtTourist) userData;
					%>
					<p class="card-text">
						Nacionalidad:
						<%=toursitData.getNationality()%></p>

					<% 
					}
					
					%>


				</div>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>


	<jsp:include page="../../templates/footer.jsp" />

</body>

</html>