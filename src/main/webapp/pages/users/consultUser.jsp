<%@page import="uy.turismo.webapp.ws.controller.DtDepartmentWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicBundleWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtPurchaseWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtInscriptionWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicDepartureWS"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uy.turismo.webapp.ws.controller.ActivityState"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicActivityWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtProviderWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristWS"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="uy.turismo.webapp.ws.controller.DtUserWS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
DtUserWS userData = (DtUserWS) request.getAttribute("userData");

String imagePath = (String) request.getAttribute("imagePath");

String fullUserName = String.format("%s %s", userData.getName(), userData.getLastName());

// Formateo de la fecha de tipo: dd/MM/yyyy
/* DateTimeFormatter format = DateTimeFormatter.ofPattern("d MMMM 'de' yyyy") */;

// Saco la fecha ya formateada como se explico antes
String birthDateStr = userData.getBirthDate();

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
					<img src="<%=imagePath%>" class="card-img-top" alt="Foto de perfil" style="border-radius: 3em;">
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
				<div align="right">
					<% if(userInSession){ 
						session.setAttribute("imagePath", imagePath);
					%>
		                <a  href="<%= request.getContextPath() %>/updateuser?id=<%= userData.getId() %>">
		                    <button class="btn btn-info">
		                        &nbsp;Modificar Perfil&nbsp;
		                    </button>
		                </a>
					<%} %>
				
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
						if (userData instanceof DtProviderWS) {
							DtProviderWS providerData = (DtProviderWS) userData;
						%>
							<p class="card-text">
								Descripción:
								<%=providerData.getDescription()%></p>
							<p class="card-text">
								Sitio Web: <a href="<%=providerData.getUrl()%>"><%=providerData.getUrl()%></a>
							</p>

						<%
							List<DtTouristicActivityWS> activitiesToPrint = new ArrayList<DtTouristicActivityWS>();
												
							Map<Long, String> activityImages = (Map<Long, String>) request.getAttribute("activityImages");
						
							if (!providerData.getTouristicActivities().isEmpty()) {
	
								for(DtTouristicActivityWS activity : providerData.getTouristicActivities()){
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
								for (DtTouristicActivityWS activity : activitiesToPrint) {
								%>
								<li class="list-group-item">
									<div class="media">
										<img src="<%=activityImages.get(activity.getId())%>"

											class="mr-3" style="width: 100px; border-radius: 1em;"> 
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
					} else {
						DtTouristWS toursitData = (DtTouristWS) userData;
					%>
						<p class="card-text">
							Nacionalidad:
							<%=toursitData.getNationality()%></p>

					<%
					List<DtTouristicDepartureWS> departuresToPrint = toursitData.getDepartures();
					List<DtPurchaseWS> purchasesToPrint = toursitData.getPurchases();
					List<DtInscriptionWS> inscriptions = toursitData.getInscriptions();
					
					Map<Long, String> departureImages = (Map<Long, String>) request.getAttribute("departureImages");
					Map<Long, String> bundleImages = (Map<Long, String>) request.getAttribute("bundleImages");
					
					
					if(departuresToPrint != null){
					%>
						<div class="container">
							<h4 class="card-text">Salidas:</h4>
							<ul class="list-group custom-list">
							<%
							for (int i = 0; i < departuresToPrint.size(); i++) {
								DtInscriptionWS inscription = inscriptions.get(i);
								String inscriptionDateStr = inscription.getInscriptionDate();
								DtTouristicDepartureWS departure = departuresToPrint.get(i);
							%>
								<li class="list-group-item">
									<div class="media">
										<img src="<%=departureImages.get(departuresToPrint.get(i).getId())%>"
											class="mr-3" style="width: 100px; border-radius: 1em;"> 
										<div class="media-body">
											<a href="<%=request.getContextPath()%>/showDeparture?id=<%=departure.getId()%>"> <b> <%=departure.getName()%> </b> </a>
											<%
											if(userInSession){
											%>
												<br>
												Fecha de inscripción: <%=inscriptionDateStr%> <br>
												Costo total: <%=inscription.getTotalCost()%> <br>
												Cantidad de Turistas: <%=inscription.getTouristAmount()%>
											<%
											}
											%>
										</div>
									</div>
								</li>
							<%
							}
							%>
							</ul>
						</div>
					<%
					}
					if(userInSession){
						if(purchasesToPrint != null){
					%>
						<div class="container">
							<h4 class="card-text">Paquetes:</h4>
							<ul class="list-group custom-list">
							<%
							for (DtPurchaseWS purchase : purchasesToPrint) {
								DtTouristicBundleWS bundle = purchase.getBundle();
								String purchaseDateStr = purchase.getPurchaseDate();
								String expireDateStr = purchase.getExpireDate();
							%>
								<li class="list-group-item">
									<div class="media">
										<img src="<%= bundleImages.get(bundle.getId()) %>"
											class="mr-3" style="width: 100px;border-radius: 1em;"> 
										<div class="media-body">
											<a href="<%= request.getContextPath() %>/bundleProfile?id=<%= bundle.getId() %>"> <b> <%= bundle.getName() %> </b> </a>
												<br>
												Fecha de compra: <%= purchaseDateStr %> <br>
												Fecha de vencimiento: <%= expireDateStr %> <br>
												Costo total: <%= purchase.getTotalCost() %> <br>
												Cantidad de Turistas: <%= purchase.getTouristAmount() %> <br>
										</div>
									</div>
								</li>
							<%
							}
							%>
							</ul>
						</div>
					<%
								}
							}
						}
					%>
				</div>
			</div>
		</div>
		
	</div>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>


	<jsp:include page="../../templates/footer.jsp" />
 <hr>
 <br>
 <br>
</body>

</html>