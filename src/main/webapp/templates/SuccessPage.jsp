<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Accion realizada correctamente</title>
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
	    				
    					case "Inscription":
    						Long departureId = Long.parseLong(request.getParameter("departureId"));   					
    					%>
    						
    						<h1 style="text-color: green;"class="text-success"><%= success %></h1>
    						<a href="<%= request.getContextPath()%>/showDeparture?id=<%=departureId%>">
	    						<button class="btn btn-primary"> Volver a la salida</button>
	    					</a>
	    					
    						<%
    						break;
                	}%>
    				
    				
                   
        </div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>