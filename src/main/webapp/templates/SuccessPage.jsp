<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Accion realizada correctamente</title>
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
    
                    
                    <% 
                    String successType = (String) request.getAttribute("successType");
            		
            		String success = (String) request.getAttribute("successMessage");
					
            		
                	switch(successType) {
        			
	    				case "User":%>
	    				 <h1 style="text-color: green;"class="text-success"><%= success %></h1>
	    					<a href="<%= request.getContextPath() %>/userList">
	    						<button class="btn btn-primary"> Ver listado de usuarios </button>
	    					</a>
	    					
    					<%break;
    					
    					case "Purchase": %>
				          <h1 style="text-color: green;"class="text-success"><%= success %></h1>
				          		
	    					<a href="<%= request.getContextPath() %>/bundleList">
	    						<button class="btn btn-primary"> Volver al listado de paquetes </button>
	    					</a>
				 		<%	break;
				 		
    					case "Activity":%>
    						
    						<h1 style="text-color: green;"class="text-success"><%= success %></h1>
    						<a href="<%= request.getContextPath()%>/consultActivity?redirectTo=activity">
	    						<button class="btn btn-primary"> Volver al listado de Actividades </button>
	    					</a>
    						<%break;
    					
    					case "Departure":%>
    					
    					<h1 style="text-color: green;"class="text-success"><%= success %></h1>
    						<a href="<%= request.getContextPath()%>/consultActivity?redirectTo=departure">
	    						<button class="btn btn-primary"> Volver al listado de Actividades </button>
	    					</a>
	    				<%break;	
                	}%>
    				
    				
                   
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