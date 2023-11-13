<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String errorType = (String) request.getAttribute("errorType");
	
	String error = (String) request.getAttribute("error");
	
	Long id = Long.parseLong(request.getParameter("bundleId"));
    %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Error</title>
  <!-- Include Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container">
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
			
			
			
				<a href="<%= request.getContextPath() %>/bundleProfile?id=<%=id%>">
					<button class="btn btn-primary">Reintentar compra</button>
				</a>
				<%break;
				
			case "Departure":%>
				<a href="<%= request.getContextPath() %>/registerDeparture">
					<button class="btn btn-primary">Volver a Registrar Salida</button>
				</a>
			<%break;
		
		} %>
          
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Include Bootstrap JS and jQuery (Optional) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<jsp:include page="footer.jsp" />
</body>
</html>