
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>

<%@page import="java.awt.image.BufferedImage"%>
<%@ page import="java.io.ByteArrayOutputStream"%>
<%@ page import="java.util.Base64"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@page import="uy.turismo.webapp.functions.Functions"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>

<%@page import="uy.turismo.webapp.ws.controller.DtTouristicDepartureWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtDepartmentWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicActivityWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtCategoryWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtPurchaseWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicBundleWS"%>

<%@page import="uy.turismo.webapp.ws.controller.Publisher"%>
<%@page import="uy.turismo.webapp.ws.controller.PublisherService"%>

<%@page import="uy.turismo.webapp.functions.Functions"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//departureProfile

PublisherService service = new PublisherService();
Publisher controller = service.getPublisherPort();

Long departureId = (Long) request.getAttribute("departureId"); //id que me viene desde el servlet

DtTouristicDepartureWS departure = controller.getTouristicDepartureData(departureId);

String name = departure.getName();

String place = departure.getPlace();

Integer maxTourist = departure.getMaxTourist();

String uploadDateStr = departure.getUploadDate();
LocalDate uploadDate = LocalDate.parse(uploadDateStr, DateTimeFormatter.ISO_DATE);

String departureDateStr = departure.getDepartureDateTime();
LocalDateTime departureDateTime = LocalDateTime.parse(departureDateStr, DateTimeFormatter.ISO_DATE_TIME);


byte [] departureImage = departure.getImage();

//Logica para inscripcion

DtTouristWS touristData = new DtTouristWS();

Boolean availableUser = session.getAttribute("userType") != null
		&& ((String) session.getAttribute("userType")).equalsIgnoreCase("tourist");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="assets/styles/main.css">
<script src="assets/scripts/jquery3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="assets/scripts/clock.js" type="text/javascript"></script>

<link rel="icon" href="assets/images/star.ico" type="image/png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.image {
	width: 25em;
	border-radius: 5%;
}
</style>
</head>
<body onload="currentTime()">
	<jsp:include page="../../templates/header.jsp" />

	<div class="card text-center">

		<div class="card-header d-flex justify-content-between">
			<h2><%=name%></h2>
			<%
			if (availableUser) {
				Integer touristAmount = departure.getTourists().size();

				Long userId = (Long) session.getAttribute("userId");

				touristData = (DtTouristWS) controller.getUserData(userId);

				if (touristAmount < maxTourist && !touristData.getDepartures().contains(departure)) {

					List<DtTouristicBundleWS> touristBundles = touristData.getBundles();

					List<DtPurchaseWS> touristPurchases = touristData.getPurchases();

					List<DtTouristicBundleWS> availableBundles = new ArrayList<DtTouristicBundleWS>();

					for (int i = 0; i < touristPurchases.size(); i++) {

						DtPurchaseWS purchase = touristPurchases.get(i);
						DtTouristicBundleWS bundle = touristBundles.get(i);
						
						List<DtTouristicActivityWS> activitiesInBundle = controller
								.getTouristicBundleData(
										bundle.getId()).getActivities();
		
						LocalDate actualDate = LocalDate.now();
						String expireDateStr = purchase.getExpireDate();
						LocalDate expireDate = LocalDate.parse(expireDateStr, DateTimeFormatter.ISO_DATE);

		
						if (actualDate.isBefore(expireDate) && activitiesInBundle.contains(departure.getTouristicActivity())) {
							availableBundles.add(bundle);
		
						}else{
							touristPurchases.remove(i);
						}
					}
			%>
			<div class="dropdown">
				<button class="btn btn-primary dropdown-toggle" type="button"
					id="dropdownMenuButton" data-bs-toggle="dropdown"
					aria-expanded="false">Inscripcion</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<li><span class="dropdown-header">Inscripcion por
							Paquete</span></li>
					<%
					for (int i = 0; i < availableBundles.size(); i++) {
						

						DtPurchaseWS purchase = touristPurchases.get(i);
						DtTouristicBundleWS bundle = availableBundles.get(i);
						
						String url = 
								request.getContextPath() + 
								"/inscription?touristId=" + 
								touristData.getId() + 
								"&departureId=" + 
								departureId + 
								"&touristAmount=" +
								purchase.getTouristAmount(); 
					%>
						<li><a class="dropdown-item" href="<%= url %>"><%=bundle.getName()%></a></li>
					<%}%>
					<li><hr class="dropdown-divider"></li>
					<li><span class="dropdown-header">Inscripcion Normal</span></li>
					<li>
						<a class="dropdown-item" onclick="requestInscription();">Inscribirse</a>
		    			<input class="dropdown-item" name="touristAmount" id="touristAmount" type="number" min="1"  placeholder="Cant. de Turistas"/>
					</li>
				</ul>
			</div>
			<%
			}
			}
			%>
		</div>

		<div class="card-body">
			<%
			if (departureImage != null) {

				BufferedImage image = Functions.convertArrayToBI(departureImage);
		        
		        String imagePath = Functions.saveImage(
		        		image, 
	               		departure.getName(), 
	               		getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
	               		"departure/");
			%>
			<img class="image"
				src="<%=imagePath%>"
				alt="Foto de perfil">
			<%
			} else {
			%>
			<p>No se encontró la imagen.</p>

			<%
			}
			%>
			<p class="card-text">
				Lugar:
				<%=place%></p>
			<p class="card-text">
				Cupos disponibles:
				<%=maxTourist%></p>
			<p class="card-text">
				Fecha de salida:
				<%=departureDateTime%></p>
		</div>

	</div>

	<jsp:include page="../../templates/footer.jsp" />
	
	<script>

		function requestInscription(){

			//Cargo los valores que quiero pasar como parametro
			var touristId = <%= touristData.getId() %>;
			var departureId = <%= departureId %>;
			var touristAmount = document.getElementById("touristAmount").value;
			var contextPath = '<%= request.getContextPath() %>';
			
			// Construye la URL con los parámetros.
			var url = 
				contextPath + "/inscription?touristId=" + touristId + "&departureId=" + departureId + "&touristAmount=" + touristAmount;
			
			// Realiza la solicitud GET.
			fetch(url)
			    .then(function (response) {
			        if (response.status === 200) {
			            return response.text();
			        }
			        throw new Error("Supero la cantidad maximas de turistas para esta salida");
			    })
			    .then(function (data) {
			        alert("Se ha Inscripto correctamente");
			        //console.log(data);
			    })
			    .catch(function (error) {
				    alert(error);
			        //console.error(error);
			    });

			
		}

	</script>
	
	


</body>
</html>

