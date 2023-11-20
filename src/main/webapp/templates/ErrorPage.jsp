<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String errorType = (String) request.getAttribute("errorType");
	
	String error = (String) request.getAttribute("error");
    %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Error</title>
  <!-- Include Bootstrap CSS -->
  
<link rel="stylesheet" href="assets/styles/main.css">
<script src="assets/scripts/jquery3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="assets/scripts/clock.js" type="text/javascript"></script>
   
   <link rel="icon" href="assets/images/star.ico" type="image/png">
</head>
<body onload="currentTime()">
<jsp:include page="header.jsp" />
<div class="container">
<br>
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card text-center">
        <div class="card-body">
          <!-- Big Red Title -->
          <h1 class="text-danger">Ha ocurrido un Error!</h1>
          
          <!-- Label -->
          <label for="inputField"> <%= error %></label>

          <!-- Button -->
          <%switch(errorType) {
			
			case "User":%>
				<a href="<%= request.getContextPath() %>/register">
					<button class="btn btn-primary">Volver a Registrar Usuario</button>
				</a>
				<%break;
				
			case "Activity":%>
				<a href="<%= request.getContextPath() %>/registerActivity">
					<button class="btn btn-primary">Volver a Registrar Actividad</button>
				</a>
				<%break;
				
			case "Purchase":%>
			
				<%Long id = Long.parseLong(request.getParameter("bundleId")); %>
			
				<a href="<%= request.getContextPath() %>/bundleProfile?id=<%=id%>">
					<button class="btn btn-primary">Reintentar compra</button>
				</a>
				<%break;
				
			case "Departure":%>
				<a href="<%= request.getContextPath() %>/registerDeparture">
					<button class="btn btn-primary">Volver a Registrar Salida</button>
				</a>
			<%break;
			case "FinishedActivity":%>
			<a href="<%= request.getContextPath() %>/registerDeparture">
					<button class="btn btn-primary">Volver a Registrar Salida</button>
			</a>
			<%break;
		}%>
          
        </div>
      </div>
    </div>
  </div>
</div>


<jsp:include page="footer.jsp" />
</body>
</html>