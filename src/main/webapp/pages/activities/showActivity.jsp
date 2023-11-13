<%@page import="uy.turismo.webapp.ws.DtCategory"%>
<%@page import="uy.turismo.webapp.ws.DtTouristicDeparture"%>
<%@page import="uy.turismo.webapp.ws.DtTouristicBundle"%>
<%@page import="uy.turismo.webapp.ws.DtTouristicActivity"%>
<%@page  import="uy.turismo.webapp.ws.DtDepartment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
DtTouristicActivityWS activityToShow = (DtTouristicActivityWS) request.getAttribute("activityToShow");
	String activityImagePath = (String) request.getAttribute("activityImagePath");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=activityToShow.getName() %></title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <style>
     	.custom-list-group {
            background-color: #c7ecee; /* Slight sky-blue background color */
            padding: 0; /* Remove default padding */
        }
        .list-group-item {
        	background-color: #c7ecee;
            padding: 1px 10px; /* Adjust spacing between list items */
        }
        .list-item-pink {
        	background-color: #ffc0cb;
            padding: 1px 10px; /* Adjust spacing between list items */
        }
        .list-item-yellow {
    		background-color: #ffffcc; /* Slight yellow background color */
		}
        
        p{
    		line-height: 0.9; /* You can adjust the value as needed for tighter or looser spacing */
		}
    </style>
</head>
<body>
<jsp:include page="../../templates/header.jsp" />
    <div class="container mt-4">
     
        <div class="row">
            <div class="col-md-8 " style="">
                <div class="card" style="padding: 1em; background-color: aliceblue;">
                	<h3 class="card-title"><%= activityToShow.getName() %></h5>
                	<%if(activityToShow.getImage() != null){ %>
                    <img src="<%= activityImagePath %>" class="card-img-top" alt="Image" style="margin: auto;  border-radius: 5%; " >
                    <% }else{ %>
                    <img src="assets/images/noImage.jpg" class="card-img-top" alt="Image" style="margin: auto;  border-radius: 5%; " >
                    <%} %>
                    <div class="card-body">
                        <p class="card-text">Descripción: <%= activityToShow.getDescription()%></p>
                        <p class="card-text">Departamento: <%= activityToShow.getDepartment().getName() %></p>
                        <p class="card-text">Ciudad: <%= activityToShow.getCity() %> </p>
                        <p class="card-text">Fecha de alta: <%= activityToShow.getUploadDate() %></p>
                        <p class="card-text">Duración: <%= activityToShow.getDuration() %> HRs</p>
                        <p class="card-text">Costo por turista: <%= activityToShow.getCostPerTourist()%>$ </p> 
                        <p class="card-text">Proveedor: <%= activityToShow.getProvider().getNickname() %></p>
                    </div>
                </div>
            </div>
            <div  class="col-md-4">
             	<%if(!activityToShow.getBundles().isEmpty()){ %>
            
            	<h5 class="card-text">Paquetes: </h5>
            	<ul class="list-group custom-list-group">
	            	<%
	            	for(DtTouristicBundleWS bundle : activityToShow.getBundles()){
	            	%>
	            		<a href="<%= request.getContextPath() %>/bundleProfile?id=<%=bundle.getId()%>">
	            			<li class="list-group-item"><%= bundle.getName() %></li>
	            		</a>
	            		<br>
	                	<br>
	            	<%}%>
	            <%} %>
	                </ul>
	                
                
                <%if(!activityToShow.getDepartures().isEmpty()){ %>
                
	                <h5 class="card-text">Salidas: </h5>
	            	<ul class="list-group custom-list-group">
	            	<%
	            	for(DtTouristicDepartureWS departure : activityToShow.getDepartures()){
	            	%>
	            		<a href="<%= request.getContextPath() %>/showDeparture?id=<%=departure.getId()%>">
	            			<li class="list-group-item list-item-pink"><%= departure.getName() %></li>
	            		</a>
	            		<br>
                		<br>
	            	<%}%>
	            <%}%>
                </ul>
                
                <%if(!activityToShow.getCategories().isEmpty()){ %>
                <h5 class="card-text">Categorias: </h5>
            	<ul class="list-group custom-list-group">
            	<%
            	for(DtCategoryWS category : activityToShow.getCategories()){
            	%>
            		<li class="list-group-item list-item-yellow"><%= category.getName() %></li>
            		<%}%>
            	<%} %>
                </ul>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
    </div>
<jsp:include page="../../templates/footer.jsp" />
    <!-- Add Bootstrap JS and jQuery scripts (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

