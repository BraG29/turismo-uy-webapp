<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="uy.turismo.webapp.ws.Controller"%>
<%@page import="uy.turismo.webapp.ws.ControllerService"%>
<%@page import="uy.turismo.webapp.ws.DtTouristicBundle"%>
<%@page import="uy.turismo.webapp.ws.DtTouristicActivity"%>
<%@page import="uy.turismo.webapp.ws.DtCategory"%>
<%@page import="uy.turismo.webapp.ws.DtUser"%>
<%@page import="uy.turismo.webapp.ws.DtTourist"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page import="java.io.ByteArrayOutputStream"%>
<%@ page import="java.util.Base64"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@page import="uy.turismo.webapp.functions.Functions"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/styles/bootstrap4.5.2.min.css">
    <link rel="stylesheet" href="assets/styles/main.css">
    <script src="assets/scripts/jquery3.5.1.min.js"></script>
    <script src="assets/scripts/bootstrap4.5.2.min.js"></script>
    <script src="assets/scripts/bootstrap5.2.3.bundle.min.js"></script>
    <script src="assets/scripts/clock.js" type="text/javascript"></script>
    <link rel="icon" href="assets/images/star.ico" type="image/png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
	
    <style>
    
    .container::after{
    	content: "";
    	text-align: center;
    	display: table;
    	clear: both;
    }
    
    .divBundle{
    	
    	width: 40%;
    	float: left;
    	margin: 3%;
    	border: 1px solid #ccc;
    	padding: 10px;
    }
    
    .divActivity{
    	text-align: centre;
    	width: 30em;
    	float: left;
    	margin: 3%;
    	border: 1px solid #ccc;
    	padding: 10px;
    }
    
    .imageStyle{
    	display: block; /* Convierte la imagen en un elemento de bloque */
    	margin: 0 auto; /* Establece un margen izquierdo y derecho automático para centrar horizontalmente */
   	 	position: relative; /* Cambia la posición para usar "absolute" en los elementos secundarios */
    	
    }
    
    h2{
    text-align: center;
    }
    
    </style>

    <%
    ControllerService service = new ControllerService();
    	Controller controller = service.getControllerPort();
        
        Long idBundle = (Long) request.getAttribute("idBundle"); //id que me viene desde el servlet
        
        DtTouristicBundleWS bundle = controller.getTouristicBundleData(idBundle);

        String name = bundle.getName(); 
    	Long userInSession = (Long) session.getAttribute("userId");    
        
    	String usrType = (String) session.getAttribute("userType");
    %>

    <title><%= name %></title>
    
</head>

<body onload="currentTime()">

    <jsp:include page="../../templates/header.jsp"/>
    
    <h2> <%= name %> </h2>
    
    <%
        String description = bundle.getDescription();
                    
                    Integer validity = bundle.getValidityPeriod();
                    
                    Double discount = bundle.getDiscount();
                    
                    //perro truco con la fecha
                    
                    LocalDate uploadDate = bundle.getUploadDate();
                    
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                    
                    String uploadDateStr = uploadDate.format(formatter);
                    
                    //fin del perro truco con la fecha.  
                    List<DtTouristicActivityWS> activities = bundle.getActivities(); //hacerle for each para nombres e imagenes
                    
                    List<DtCategoryWS> categories = bundle.getCategories(); //hacerle for each para nombres.
                    		
                    Double price = bundle.getPrice();
                    		
                    //procesamiento de imagenes del paquete.		
                    BufferedImage bundleImage = bundle.getImage();
                    
                        if(bundleImage != null){
                        	
                        

                        ByteArrayOutputStream baos = new ByteArrayOutputStream();
                        String format = "jpeg"; // Formato predeterminado es JPEG

                        // Determina el formato de la imagen
                        
                        
                        if (bundleImage.getTransparency() == BufferedImage.OPAQUE) {
                            format = "png";
                        }

                        ImageIO.write(bundleImage, format, baos);
                        byte[] bytes = baos.toByteArray();
                        String base64Image = Base64.getEncoder().encodeToString(bytes);
        %>
<div class="container">
       
    <div class="divBundle">
       
	    <img style="width:25em;  border-radius: 5%;" class="imageStyle"  width="250" height="250" src="data:image/<%=format%>;base64,<%=base64Image%>" alt="Foto de perfil">
	
	    <p class="card-text"> Descripción: <%=description%></p>
	    
		    <%
	    		    if(validity > 1){   //cuando el periodo de validez es mayor a uno muestro "dias" caso contrario muestro "dia"
	    		    %>
		    
	    <p class="card-text"> Validez: <%=validity%> dias</p>
	    
	    
	    <%
	    	    	    } else{
	    	    	    %>
	    	
	    	<p class="card-text"> Validez: <%=validity%> dia</p>
	    	
	     <%
	    		     }
	    		     %>
	    
	    <p class="card-text"> Descuento: <%=discount%>% </p>
	    
	    
	    <p class="card-text"> Fecha de alta: <%=uploadDateStr%> </p>
	    
	    
	    <p class="card-text"> Categorias:</p>
	    
	    <ul>
	    <%
	    for (DtCategoryWS category: categories){
	    %>
	    	<li>
	    		<span> <%=category.getName()%>  </span>	
	    	</li> 
	    <%
 	    }
 	    %>   
	    </ul>	   
	    <%
	   	    if(userInSession != null && usrType.equals("tourist")){
	   	    	   	    	   	    	    	
	   	    	   	    	   	    		DtTouristWS touristData = (DtTouristWS) controller.getUserData(userInSession);
	   	    %>
	    
	    <br>
	    
	    <button id="showForm" name="showForm" class="w-100 btn btn-lg btn-primary"> Detalles de compra</button>	    
	    <br>
	    <br>
	    <div>
	    	<form action="<%=request.getContextPath()%>/bundleProfile" method="post" id="purchaseForm" style="display: none;">
	    
		    	<div>
			    <span> Nº Turistas: </span>
			    <input  name="touristAmount" id="touristAmount" type="number" min="1"  placeholder="Ej: 10"/>
			    </div>
				
			    <button type="button" id="calculatePrice" style="display: none;"> Calcular precio </button>
		   		
		   		<br>
		   		
		   		
		   		<input type="number" id="validity" name="validity" value="<%=validity%>" style="display: none;">
		   		<input type="hidden" id="uploadDate" name="uploadDate" value="<%=uploadDateStr%>" style="display: none;">
		   		<input type="number" id="priceToServlet" name="priceToServlet" value="" style="display: none;">
		   		<input type="text" id="bundleId" name="bundleId" value="<%=bundle.getId()%>" style="display: none;">
		   		<input type="text" id="touristId" name="touristId" value="<%=touristData.getId()%>" style="display: none;">
		   		
		   		 <span>Comprar por:</span><button type="submit" id="calculatedPrice" name="calculatedPrice" class="w-100 btn btn-lg btn-primary"> $0</button>
	   		 </form>    
	    </div>
	    
	    <%
	    	    }//if userInSession
	    	    %>
     
     </div>
    
    	<div class="divActivity">
    	
    		<h4 class="card-text">Actividades del paquete:</h4>
    			<ul class="list-group custom-list">
								<%
								//for each de actividades.
																										
																										for (DtTouristicActivityWS activity : activities) {
																											
																											BufferedImage activityImage = activity.getImage();
																											//procesar imagenes de la actividad
																											if(activityImage != null){	
																											ByteArrayOutputStream activityBaos = new ByteArrayOutputStream();
																										        String activityFormat = "jpeg"; // Formato predeterminado es JPEG
																										
																										        // Determina el formato de la imagen
																										        if (activityImage.getTransparency() == BufferedImage.OPAQUE) {
																										            activityFormat = "png";
																										        }
																										
																										        ImageIO.write(activity.getImage(), activityFormat, activityBaos);
																										        byte[] activityBytes = activityBaos.toByteArray();
																										        String base64ActivityImage = Base64.getEncoder().encodeToString(activityBytes);
								%>
									<li class="list-group-item">
									<div class="media">
											<div class="media-body">
											<span> Nombre: </span>
											<a href="<%=request.getContextPath()%>/showActivity?activityId=<%=activity.getId()%> ">
											 <%=activity.getName()%>
											</a>
											</div>
											<div class="image">
												<img style="width:25em;  border-radius: 5%; margin-left: 3%;" width="250" height="250" src="data:image/<%=activityFormat%>;base64,<%=base64ActivityImage%>" alt="Foto de perfil">
											</div>
										
									</div>
								</li>
									<%
									} else {//if imagen
									%>
										 
										<li class="list-group-item">
									<div class="media">
											<div class="media-body">
											<span> Nombre: </span>
											<%=activity.getName()%></div>
											<div class="image">
												<p> No se pudo encontrar la imagen </p>
											</div>
									</div>
								</li> 
			 
								<%
 			 								}//else imagen.
 			 								 			 								 			 														}//for imagen actividad de paquete
 			 								%>
    		</ul>
    	</div>

    	<%
    	} else{
    	%>
    	    <div class="divBundle">
       
	   <p> No se pudo encontrar la imagen.</p>
	
	    <p class="card-text"> Descripción: <%=description%></p>
	    
		    <%
	    		    if(validity > 1){   //cuando el periodo de validez es mayor a uno muestro "dias" caso contrario muestro "dia"
	    		    %>
		    
	    <p class="card-text"> Validez: <%=validity%> dias</p>
	    
	    
	    <%
	    	    	    } else{
	    	    	    %>
	    	
	    	<p class="card-text"> Validez: <%=validity%> dia</p>
	    	
	     <%
	    		     }
	    		     %>
	    
	    <p class="card-text"> Descuento: <%=discount%>% </p>
	    
	    
	    <p class="card-text"> Fecha de alta: <%=uploadDateStr%> </p>
	    
	    
	    <p class="card-text"> Categorias:</p>
	    
	    <ul>
	    <%
	    for (DtCategoryWS category: categories){
	    %>
	    	<li>
	    		<span> <%=category.getName()%>  </span>	
	    	</li> 
	    <%
 	    }
 	    %>   
	    </ul>	   
	    <%
	   	    if(userInSession != null && usrType.equals("tourist")){
	   	    	   	    	    	
	   	    	   	    		DtTouristWS touristData = (DtTouristWS) controller.getUserData(userInSession);
	   	    %>
	    
	    <br>
	    
	    <button id="showForm" name="showForm" class="w-100 btn btn-lg btn-primary"> Detalles de compra</button>	    
	    <br>
	    <br>
	    <div>
	    	<form action="<%=request.getContextPath()%>/bundleProfile" method="post" id="purchaseForm" style="display: none;">
	    
		    	<div>
			    <span> Nº Turistas: </span>
			    <input  name="touristAmount" id="touristAmount" type="number" min="1"  placeholder="Ej: 10"/>
			    </div>
				
			    <button type="button" id="calculatePrice" style="display: none;"> Calcular precio </button>
		   		
		   		<br>
		   		
		   		
		   		<input type="number" id="validity" name="validity" value="<%=validity%>" style="display: none;">
		   		<input type="hidden" id="uploadDate" name="uploadDate" value="<%=uploadDateStr%>" >
		   		<input type="number" id="priceToServlet" name="priceToServlet" value="" style="display: none;">
		   		<input type="text" id="bundleId" name="bundleId" value="<%=bundle.getId()%>" style="display: none;">
		   		<input type="text" id="touristId" name="touristId" value="<%=touristData.getId()%>" style="display: none;">
		   		
		   		 <span>Comprar por:</span><button type="submit" id="calculatedPrice" name="calculatedPrice" class="w-100 btn btn-lg btn-primary"> $0</button>
	   		 </form>    
	    </div>
	    
	    <%
	    	    }//if userInSession
	    	    %>
     
     </div>
    
    	<div class="divActivity">
    	
    		<h4 class="card-text">Actividades del paquete:</h4>
    			<ul class="list-group custom-list">
								<%
								//for each de actividades.
														
														for (DtTouristicActivityWS activity : activities) {
															
															BufferedImage activityImage = activity.getImage();
															//procesar imagenes de la actividad
																if(activityImage != null){
																	
																
																ByteArrayOutputStream activityBaos = new ByteArrayOutputStream();
														        String activityFormat = "jpeg"; // Formato predeterminado es JPEG
														
														        // Determina el formato de la imagen
														        if (activityImage.getTransparency() == BufferedImage.OPAQUE) {
														            activityFormat = "png";
														        }
														
														        ImageIO.write(activity.getImage(), activityFormat, activityBaos);
														        byte[] activityBytes = activityBaos.toByteArray();
														        String base64ActivityImage = Base64.getEncoder().encodeToString(activityBytes);
								%>
									<li class="list-group-item">
									<div class="media">
											<div class="media-body">
											<span> Nombre: </span>
											<a href="<%= request.getContextPath() %>/showActivity?activityId=<%= activity.getId()%> ">
											 <%= activity.getName() %>
											</a>
											</div>
											<div class="image">
												<img style="width:25em;  border-radius: 5%; margin-left: 3%;" width="250" height="250" src="data:image/<%= activityFormat %>;base64,<%= base64ActivityImage%>" alt="Foto de perfil">
											</div>
										
									</div>
								</li>
								<%
									} else {//if imagen
										 %>
										<li class="list-group-item">
									<div class="media">
											<div class="media-body">
											<span> Nombre: </span>
											<%= activity.getName() %></div>
											<div class="image">
												<p> No se pudo encontrar la imagen </p>
											</div>
									</div>
								</li> 
										 
										 
								<%	}//else
								}//for imagen actividad de paquete
								%>
    		</ul>
    	</div>
    	
    	<%} %>
    
</div>   
   
    
    <jsp:include page="../../templates/footer.jsp" />
    
    <script>
    
    	var btnShowForm = document.getElementById("showForm");
    	var purchaseForm = document.getElementById("purchaseForm");
    	
    	//btn listener
    	btnShowForm.addEventListener("click", function(){
    		purchaseForm.style.display = "block";
    	});
    	

    	var inputTouristAmount = document.getElementById("touristAmount");
    	var btnCalculatePrice = document.getElementById("calculatePrice");
    	var spanCalculatedPrice = document.getElementById("calculatedPrice");
    	
    	btnCalculatePrice.addEventListener("click", function(){
    		var amount = parseInt(inputTouristAmount.value);
    		
    		if(isNaN(amount) || amount < 1){
    			alert("La cantidad ingresada debe ser mayor o igual a 1.");
    		} else{
    			
    			var priceJs = amount * <%=price%>;

    			if(priceJs !== null){
    			spanCalculatedPrice.textContent = "$" + priceJs;
    			document.getElementById("priceToServlet").value = priceJs;
    				
    			}
    		}
    		
    	});
    	
    	//recalcular al cambiar cantidad.
    	inputTouristAmount.addEventListener("input", function(){
    		btnCalculatePrice.click();
    	});
    	
	
    </script>

</body>

</html>