<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtDepartment"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtTouristicBundle"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtPurchase"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtInscription"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtTouristicDeparture"%>
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

java.util.List<DtUser> usrFollowed = (List<DtUser>) session.getAttribute("followed"); //lista de seguidos del usuario en sesion.

//java.util.List<DtTouristicActivity> favActivities =  (List<DtTouristicActivity>) session.getAttribute("favActivities"); consultActivity

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
<script src="assets/scripts/jquery3.5.1.min.js"></script>
<script src="assets/scripts/bootstrap4.5.2.min.js"></script>
<script src="assets/scripts/bootstrap5.2.3.bundle.min.js"></script>
<script src="assets/scripts/clock.js" type="text/javascript"></script>
<link rel="icon" href="assets/images/star.ico" type="image/png">


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
						<h5 class="card-title" style="line-height: 2em"><%=fullUserName%> 	
							<%
							
							if (!userInSession) { // Aparece el botón si el usuario en la sesión no es el mismo del perfil.
							    boolean isFollowing = false;
							    for (DtUser followedUser : usrFollowed) {
							        if (followedUser.getId() == userData.getId()) {
							            isFollowing = true;
							            break;
							        }
							    }

							
								if (isFollowing) { %>
									<br>
									
								    <button data-session-userid="<%= (Long) session.getAttribute("userId") %>" data-page-userid="<%= userData.getId() %>" class="btn btn-primary" id="unFollowButton">
								        Dejar de seguir
								    </button>
							<% } else { %>
								    <br>
								    <button data-session-userid="<%= (Long) session.getAttribute("userId") %>" data-page-userid="<%= userData.getId() %>" class="btn btn-primary" id="followButton">
								        Seguir
								    </button>
								<% } 
							
							 } %>
						
						</h5>
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
						DtTourist toursitData = (DtTourist) userData;
					%>
						<p class="card-text">
							Nacionalidad:
							<%=toursitData.getNationality()%></p>

					<% 
						List<DtTouristicDeparture> departuresToPrint = toursitData.getDepartures();
						List<DtPurchase> purchasesToPrint = toursitData.getPurchases();
						List<DtInscription> inscriptions = toursitData.getInscriptions();
						
						Map<Long, String> departureImages = (Map<Long, String>) request.getAttribute("departureImages");
						Map<Long, String> bundleImages = (Map<Long, String>) request.getAttribute("bundleImages");
						
						
						if(departuresToPrint != null){
							%>
							<div class="container">
								<h4 class="card-text">Salidas:</h4>
								<ul class="list-group custom-list">
								<%
								for (int i = 0; i < departuresToPrint.size(); i++) {
									DtInscription inscription = inscriptions.get(i);
									String inscriptionDateStr = inscription.getInscriptionDate().format(format);
									DtTouristicDeparture departure = departuresToPrint.get(i);
 							
 								%>
									<li class="list-group-item">
										<div class="media">
											<img src="<%=departureImages.get(departuresToPrint.get(i).getId())%>"
												class="mr-3" style="width: 50%; border-radius: 1em;"> 
											<div class="media-body">
												<a href="<%= request.getContextPath() %>/showDeparture?id=<%= departure.getId() %>"> <b> <%= departure.getName() %> </b> </a>
												<br>
												<%
												if(userInSession){ 
												%>
													
													<p>Fecha de inscripción: <%= inscriptionDateStr %> <br>
													Costo total: <%= inscription.getTotalCost() %> <br>
													Cantidad de Turistas: <%= inscription.getTouristAmount() %></p>
													
													<span id="hiddenData" style="display: none;">
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
										for (DtPurchase purchase : purchasesToPrint) {
											DtTouristicBundle bundle = purchase.getBundle();
											String purchaseDateStr = purchase.getPurchaseDate().format(format);
											String expireDateStr = purchase.getExpireDate().format(format);
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

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
	<script src="https://unpkg.com/jspdf@latest/dist/jspdf.umd.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
	
 		<script type="text/javascript">
 		
	 		$(document).ready(function() {
	 		    $('#followButton, #unFollowButton').on('click', function() {
	 		        var pageUserId = $(this).data('page-userid');
	 		       var sessionUserId = $(this).data('session-userid');
	 		        var buttonText = $(this).text();
	 		        var action = 'follow'; // Acción predeterminada
	
	 		        if (buttonText === 'Dejar de seguir') {
	 		            action = 'unfollow';
	 		        }
	
	 		        // Realiza la solicitud AJAX al servlet según la acción y el ID del usuario de la página
	 		        $.post('profile', { action: action, sessionUserId: sessionUserId, pageUserId: pageUserId }, function(data) {
	 		            // La solicitud se completó exitosamente
	 		            if (action === 'follow') {
	 		                $(this).text('Dejar de seguir');
	 		            } else if (action === 'unfollow') {
	 		                $(this).text('Seguir');
	 		            }
	 		        });
	 		    });
	 		});
 	
 		
	         function pdf() {
		 		var departureNameVar = document.getElementById("departureName").value;
		 		var touristAmountVar = document.getElementById("touristAmount").value;
		 		var inscriptionDateVar = document.getElementById("inscriptionDate").value;
		 		
			
				var content = `Comprobante de Suscripción\n 
					Nombre:   <%=fullUserName%>\n				                
	                Nombre de la salida: ${departureNameVar} 
	               	Fecha de salida: ${inscriptionDateVar} `;
	                var docDefinition = {
	                    content: [
	                        {text:content}
	                    ],
	                    defaultStyle: {
	                    }
	                };
	                
	                pdfMake.createPdf(docDefinition).print();
	            }
	     </script>

	<jsp:include page="../../templates/footer.jsp" />
 <hr>
 <br>
 <br>
</body>

</html>