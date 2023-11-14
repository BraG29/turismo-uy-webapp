<%@page import="java.util.Map"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicDepartureWS"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="assets/scripts/jquery3.5.1.min.js"></script>
<script src="assets/scripts/bootstrap4.5.2.min.js"></script>
<script src="assets/scripts/bootstrap5.2.3.bundle.min.js"></script>
<script src="assets/scripts/clock.js" type="text/javascript"></script>
<link rel="icon" href="assets/images/star.ico" type="image/png">
<title>Turismo.UY</title>
</head>
<%
	List<DtTouristicDepartureWS> departures = (List<DtTouristicDepartureWS>) request.getAttribute("departures");

	Map<Long, String> departureImages = (Map<Long, String>) request.getAttribute("departureImages");
%>
<body onload="currentTime()">

	<jsp:include page="../../templates/header.jsp" />

	<div class="container">
		<br><h2 class="card-text">Elija una Salida Turística:</h2> <br>
		<ul class="list-group custom-list">
		<%for(DtTouristicDepartureWS departure : departures){ %>
			<li class="list-group-item">
				<div class="media">
					<img src="<%= departureImages.get(departure.getId()) %>" class="mr-3" style="width: 100px; border-radius: 5%;">
					<div class="media-body">
                    	<a href="<%= request.getContextPath() %>/showDeparture?id=<%=departure.getId()%>"> <b> <%= departure.getName() %> </b></a>
					</div>
				</div>
			</li>
		<%} %>
		</ul>
	</div>

	<jsp:include page="../../templates/footer.jsp" />
</body>

</html>