<%@page import="uy.turismo.webapp.ws.controller.DtCategoryWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicDepartureWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicBundleWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicActivityWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtDepartmentWS"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	
	DtTouristicActivityWS activityToShow = (DtTouristicActivityWS) request.getAttribute("activityToShow");
	String activityImagePath = (String) request.getAttribute("activityImagePath");
	

	String userType = (String) session.getAttribute("userType");
	
	List<DtTouristicActivityWS> favActivity = (List<DtTouristicActivityWS>) session.getAttribute("favActivities");
	
	Long id = (Long) session.getAttribute("id");
	

	//java.util.List<DtUser> usrFollowed = (List<DtUser>) session.getAttribute("followed");
	
	
	String userAgent = request.getHeader("user-agent");
	System.out.println(userAgent);
	
	if(userAgent.contains("Mobile")){

		session.setAttribute("userDevice", "mobile");
	}else{
		session.removeAttribute("userDevice");
	};
	String userDevice = (String) session.getAttribute("userDevice");
	//esta implementación es MUY fea ya que solo se checkea en esta página y hay que recargar para que se muestren los cambios.
	//TODO: encontrar forma de que se checke más frecuentemente y sin recargar plox.
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=activityToShow.getName() %></title>
    
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="assets/styles/main.css">
    <script src="assets/scripts/jquery3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="assets/scripts/clock.js" type="text/javascript"></script>
    <link rel="icon" href="assets/images/star.ico" type="image/png">
     <style>
        p{
    		line-height: 0.9; /* You can adjust the value as needed for tighter or looser spacing */
		}
    </style>
    
</head>
<body onload="currentTime()">
<jsp:include page="../../templates/header.jsp" />
    <div class="container mt-4">
     
        <div class="row">
            <div class="col-md-8 " style="">
                <div class="card" style="padding: 1em; background-color: aliceblue;">
                	<h3 class="card-title"><%= activityToShow.getName() %>        	
                	</h3>
                	
                	<%if(activityToShow.getImage() != null){ %>
                    <img src="<%= activityImagePath %>" class="card-img-top" alt="Image" style="margin: auto;  border-radius: 5%; " >
                    <script type="text/javascript"> console.log("<%= activityImagePath %>"); console.log("acaaaaaaaaaaaaaaaaaaaaaaa");</script>
                    <% }else{ %>
                    <img src="<%= activityImagePath %>" class="card-img-top" alt="Image" style="margin: auto;  border-radius: 5%; " >
                    <script type="text/javascript"> console.log("<%= activityImagePath %>"); console.log("acaaaaaaaaaaaaaaaaaaaaaaa2");</script>
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
            
            					<% 	
						if("tourist".equals(userType)){
						boolean isFavorite = false;
					    for (DtTouristicActivityWS activities : favActivity) {
					    	if (activities.getId() == activityToShow.getId()) {
					        	isFavorite = true;
					            break;
					        }
					    }
						if (isFavorite) { %>
						    <button  style="margin-left: 15%;" class="btn btn-primary" id="unMarkFavorite">
					       	Desmarcar actividad como favorita 
						    </button>
					<% 	} else { %>
						 	<button style="margin-left: 15%;" class="btn btn-primary" id="markFavorite">
					        Marcar actividad como favorita
						    </button>
					<% 	} 
					}%>
            	
            	
            	<% if (activityToShow.getUrlVideo() != null){%>
            	<br>
            	<iframe width="560" height="315" src="<%=activityToShow.getUrlVideo() %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
             	
             	<% } else{ %>
             	<br>
             	<span>No hay video chaval</span>
             	<span>No hay video</span>
             	 <img width="560" height="315" src="" class="card-img-top" alt="Video" style="margin: auto;  border-radius: 5%; " >
             	
             	<% }  %>
             	
             	
             	<%if(!activityToShow.getBundles().isEmpty()){ %>
            	
            	<br>
            	
            	<h5 class="card-text">Paquetes: </h5>
            	<ul class="list-group">
            		<%if(userDevice != null ){ %>
	            		<%for(DtTouristicBundleWS bundle : activityToShow.getBundles()){%>
		            		<a href="" class="list-group-item list-group-item-action list-group-item-info">
		            			 <%= bundle.getName() %>
		            		</a>
		            		<br>
		                	<br>
		            	<%}%>
            		<%}else{%>
            		
	            	<%for(DtTouristicBundleWS bundle : activityToShow.getBundles()){%>
	            		<a href="<%= request.getContextPath() %>/bundleProfile?id=<%=bundle.getId()%>" class="list-group-item list-group-item-action list-group-item-info">
	            			 <%= bundle.getName() %>
	            		</a>
	            		<br>
	                	<br>
	                	<%} %>
	            	<%}%>
	            <%} %>
	                </ul>
	                
                
                <%if(!activityToShow.getDepartures().isEmpty()){ %>
                <br>
	                <h5 class="card-text">Salidas: </h5>
	            	<ul class="list-group list-group-numbered">
	            	
	            	<%if(userDevice != null ){ %>
	            		<%for(DtTouristicDepartureWS departure : activityToShow.getDepartures()){%>
	            		<a href="" class="list-group-item list-group-item-action list-group-item-danger">
	            		<%= departure.getName() %>
	            		</a>
	            		<br>
                		<br>
	            		<%}%>
	            	<%}else{ %>
	            	
	            	<%for(DtTouristicDepartureWS departure : activityToShow.getDepartures()){%>
	            		<a href="<%= request.getContextPath() %>/showDeparture?id=<%=departure.getId()%>" class="list-group-item list-group-item-action list-group-item-danger">
	            		<%= departure.getName() %>
	            		</a>
	            		<br>
                		<br>
                		<%} %>
	            	<%}%>
	            <%}%>
                </ul>
                
                <%if(!activityToShow.getCategories().isEmpty()){ %>
                <br>
                <h5 class="card-text">Categorias: </h5>
            	<ul class="list-group">
            	<%for(DtCategoryWS category : activityToShow.getCategories()){%>
            		<li class="list-group-item list-group-item-warning"><%= category.getName() %></li>
            		<%}%>
            	<%}%>
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
</body>
</html>