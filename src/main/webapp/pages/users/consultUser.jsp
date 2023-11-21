<%@page import="java.util.ArrayList"%>
<%@page import="uy.turismo.webapp.ws.controller.DtDepartmentWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtPurchaseWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtInscriptionWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicDepartureWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicBundleWS"%>
<%@page import="uy.turismo.webapp.ws.controller.ActivityState"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicActivityWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtProviderWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtUserWS"%>
<%@page import="uy.turismo.webapp.ws.controller.Publisher"%>
<%@page import="uy.turismo.webapp.ws.controller.PublisherService"%>

<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.stream.Collectors"%>

<%@page import="java.time.format.DateTimeFormatter"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
DtUserWS userData = (DtUserWS) request.getAttribute("userData");

List<DtUserWS> usrFollowed = (List<DtUserWS>) session.getAttribute("followed"); //lista de seguidos del usuario en sesion.

//seguidores y seguidos del perfil.

List<DtUserWS> userProfileFollows = userData.getFollows();

List<DtUserWS> userProfileFollowers = userData.getFollowers();

String imagePath = (String) request.getAttribute("imagePath");

String fullUserName = String.format("%s %s", userData.getName(), userData.getLastName());

// Formateo de la fecha de tipo: dd/MM/yyyy
DateTimeFormatter format = DateTimeFormatter.ofPattern("d MMMM 'de' yyyy");

// Saco la fecha ya formateada como se explico antes
String birthDateStr = userData.getBirthDate();

Boolean userInSession = (Long) session.getAttribute("userId") == userData.getId();

Long userInSessionId = (Long) session.getAttribute("userId");

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

<script type="text/javascript">
		
	function pdf() {
	    // Tu función pdf aquí
	    var departureNameVar = document.getElementById("departureName").value;
	    var touristAmountVar = document.getElementById("touristAmount").value;
	    var inscriptionDateVar = document.getElementById("inscriptionDate").value;
	    var fullUserNameVar = document.getElementById("fullUserName").value;
	    var departureDateTimeVar = document.getElementById("departureDateTime").value;
	    
	    var content = `Comprobante de Suscripción\n 
	                    Nombre: ${fullUserNameVar}\n
	                    Nombre de la salida: ${departureNameVar}\n
	                    Fecha de inscripción: ${inscriptionDateVar}\n
	                    Cantidad de turistas: ${touristAmountVar}`;
	
	    var docDefinition = {
	        content: [
	            { text: content }
	        ],
	        defaultStyle: {}
	    };
	
	    pdfMake.createPdf(docDefinition).print();
	}
	
	
	document.addEventListener("DOMContentLoaded", function () {
	    
	    document.getElementById("generatePDF").addEventListener("click", pdf);
	});
	
	function showFollowsAndFollowers(){
		var list = document.getElementById("followsAndFollowers");
		 if (list.style.display === "none") {
             list.style.display = "flex";
         } else {
             list.style.display = "none";
         }
	}
	
</script>


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.56/pdfmake.min.js"></script>
       <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.56/vfs_fonts.js"></script>

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
						<h5 class="card-title" style="line-height: 2em"><%=fullUserName%> </h5>
							<%
							
							
							if (userInSessionId != null && !userInSession ) { // Aparece el botón si el usuario en la sesión no es el mismo del perfil.
							
								boolean isFollowing = false;
								if(usrFollowed != null && !usrFollowed.isEmpty()){
								    for (DtUserWS followedUser : usrFollowed) {
								        if (followedUser.getId() == userData.getId()) {
								            isFollowing = true;
								            break;
								        }
								    }
								}
									
							 	 
								
								if (isFollowing) { %>
									<form action="<%= request.getContextPath() %>/profile" onsubmit="return unFollow()" accept-charset="UTF-8" method="post">
										<input type="hidden" id="action" name="action" value="unFollow">
										<input type="hidden" id="pageUserId" name="pageUserId" value="<%= userData.getId()%>"> 
										<input type="hidden" id="sessionUserId" name="sessionUserId" value="<%=(Long) session.getAttribute("userId")%>">
									    <button type="submit" class="btn btn-primary">
									        Dejar de seguir
									    </button>
									</form>
							<% } else { %>
								    <form action="<%= request.getContextPath() %>/profile" onsubmit="return follow()" accept-charset="UTF-8" method="post">   
								    <input type="hidden" id="action" name="action" value="follow">
								    <input type="hidden" id="pageUserId" name="pageUserId" value="<%=userData.getId()%>"> 
									<input type="hidden" id="sessionUserId" name="sessionUserId" value="<%=(Long) session.getAttribute("userId")%>">								    
								    <button type="submit" class="btn btn-primary">
								        Seguir
								    </button>
								    </form>
								<% } 
							 } %>
						
						
						<p class="card-text">
							Correo Electrónico:
							<%=userData.getEmail()%></p>
						<p class="card-text">
							Nickname:
							<%=userData.getNickname()%>
							</p>
					</div>
				</div>
				<div align="right">
					<% if(userInSession){ 
						session.setAttribute("imagePath", imagePath);
					%>
					 <br>
		                <a  href="<%= request.getContextPath() %>/updateuser?id=<%= userData.getId() %>">
		                    <button class="btn btn-primary btn-lg">
		                        &nbsp;Modificar Perfil&nbsp;
		                    </button>
		                </a>
		             <br>
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
						
						if (providerData.getTouristicActivities() != null) {

								for(DtTouristicActivityWS activity : providerData.getTouristicActivities()){
									if( userInSession ){
										switch(activity.getState()){
										
										case FINISHED:
										case ACCEPTED:
										case REJECTED:
										case ADDED:
											activitiesToPrint.add(activity);
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
									<div class="media" style="align-items: baseline; justify-content: space-between;">
										<a href="<%= request.getContextPath() %>/showActivity?activityId=<%= activity.getId()%>">
										<% if(activityImages.containsKey(activity.getId())){ %>
											<img src="<%=activityImages.get(activity.getId())%>"
											class="mr-3" style="width: 100px; border-radius: 1em;"> 
										<% }else{ %>
											<img src="assets/images/noImage.jpg"
											class="mr-3" style="width: 100px; border-radius: 1em;"> 
										<%} %>
											
											<span class="media-body"><%= activity.getName() %></span>
										</a>
										<% switch(activity.getState()){
										
										case FINISHED:%>
											<span style="font-weight: bold;">FINALIZADA</span>
											
										<%break;
										case ACCEPTED:%>
											<span class="text-success" style=" font-weight: bold;">ACEPTADA</span>
											
										<%break;
										case REJECTED:%>
										
											<span class="text-danger" style=" font-weight: bold;">RECHAZADA</span>
											
										<%break;
										case ADDED:%>
										
											<span class="text-warning" style="font-weight: bold;">AÑADIDA</span>
											
										<%break;
										}%>
											
									</div>
								</li>								
								<%}%>

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
											<% if(departureImages.containsKey(departuresToPrint.get(i).getId())){ %>
											<img src="<%=departureImages.get(departuresToPrint.get(i).getId())%>"
												class="mr-3" style="width: 100px; border-radius: 1em;"> 
											<%} else{ %>
											<img src="assets/images/noImage.jpg"
												class="mr-3" style="width: 100px; border-radius: 1em;">
											
											<%} %>
											<div class="media-body">
												<a href="<%= request.getContextPath() %>/showDeparture?id=<%= departure.getId() %>"> <b> <%= departure.getName() %> </b> </a>
												<% if(userInSession){ %>
													<br>
													Fecha de inscripción: <%= inscriptionDateStr %> <br>
													Costo total: <%= inscription.getTotalCost() %> <br>
													Cantidad de Turistas: <%= inscription.getTouristAmount() %>
													
													<span id="hiddenData" style="display: none;">
														<input type ="hidden" id="fullUserName" value="<%=fullUserName%>">
														<input type ="hidden" id="departureName" value="<%=departure.getName()%>">
														<input type ="hidden" id="touristAmount" value="<%=inscription.getTouristAmount()%>">
														<input type ="hidden" id="inscriptionDate" value="<%=inscriptionDateStr%>">
													</span>
													
													<br>
										  			<button class="btn btn-primary" onclick="pdf()" id="generatePDF" >Generar comprobante de suscripción </button>
													
													
												<% }%>
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
												<% if(bundleImages.containsKey(bundle.getId())){ %>
													<img src="<%= bundleImages.get(bundle.getId()) %>"
														class="mr-3" style="width: 100px;border-radius: 1em;">
												<% }else{ %> 
													<img src="assets/images/noImage.jpg"
														class="mr-3" style="width: 100px;border-radius: 1em;">
												<% } %>
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
										
										<%}%>
										
										</ul>
									</div>
								
									
									<%}%>
								<%}%>
								<%}%>
								
						
				</div>
							<br>
							<button class="btn btn-primary btn-lg" onclick="showFollowsAndFollowers()"> 
		                    &nbsp;Seguidores/Seguidos&nbsp;
		                    </button>

								<hr>
								<div class="container-fluid">
			               			<div class="row" style="display: none; padding: 0;" id="followsAndFollowers">
			               			
				               		<%
				               		if(userProfileFollows == null){
				               			userProfileFollows = new ArrayList<DtUserWS>();
				               		}
				               	 	
				               		for (DtUserWS profileFollows: userProfileFollows){%>
					               		<div class="card border-info mb-3" style=" max-width: max-content; margin-right:1em; padding: 0;"  >	
						               	<div class="card-header bg-primary text-light" style="font-size: 1.25rem;">Seguidos:</div>
					               			<div class="card-body text-dark">
			               		
					               				<a class="card-text" href="<%=request.getContextPath()%>/profile?id=<%=profileFollows.getId()%>">
					           					
					           						<h5 class="card-title"><%=profileFollows.getNickname()%></h5>
					           					 </a>
					           					 
					           					<p class="card-text"> Email: <%=profileFollows.getEmail()%></p>
						           					
						               			</div>
											</div>
			               		<% }%>

				               		<%if(userProfileFollowers == null){
				               			userProfileFollowers = new ArrayList<DtUserWS>();
				               		}
				               		
				               		for (DtUserWS profileFollowers: userProfileFollowers){%>
				               			
				               			<div class="card border-success mb-3" style=" max-width: max-content; margin-right:1em; padding: 0;"  >	
							               	<div class="card-header bg-success text-light" style="font-size: 1.25rem;">Seguidores:</div>
						               			<div class="card-body text-dark">
				               		
						               				<a class="card-text" href="<%=request.getContextPath()%>/profile?id=<%=profileFollowers.getId()%>">
						           					
						           						<h5 class="card-title"><%=profileFollowers.getNickname()%></h5>
						           					 </a>
						           					 
						           					<p class="card-text"> Email: <%=profileFollowers.getEmail()%></p>
							           					
							               			</div>
												</div>
		               		<% }%>

		               		</div>		               		
					</div>
			</div>
		</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
	<script src="https://unpkg.com/jspdf@latest/dist/jspdf.umd.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
	
 	
<jsp:include page="../../templates/footer.jsp" />
 <hr>
 <br>
 <br>
</body>

</html>