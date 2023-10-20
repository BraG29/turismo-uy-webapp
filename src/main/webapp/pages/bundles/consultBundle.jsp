<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="uy.turismo.servidorcentral.logic.controller.ControllerFactory"%>
<%@page import="uy.turismo.servidorcentral.logic.controller.IController"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtTouristicBundle"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtCategory"%>
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

    <%  IController controller = ControllerFactory.getIController();
    
    Long idBundle = (Long) request.getAttribute("idBundle"); //id que me viene desde el servlet
    
    DtTouristicBundle bundle = controller.getTouristicBundleData(idBundle);

    String name = bundle.getName(); %>

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
    List<DtTouristicActivity> activities = bundle.getActivities(); //hacerle for each para nombres e imagenes
    
    List<DtCategory> categories = bundle.getCategories(); //hacerle for each para nombres.
    
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
       
	    <img style="width:25em;  border-radius: 5%;" class="imageStyle"  width="250" height="250" src="data:image/<%= format %>;base64,<%= base64Image %>" alt="Foto de perfil">
	
	    <p class="card-text"> Descripción: <%=description%></p>
	    
		    <%
		    if(validity > 1){   //cuando el periodo de validez es mayor a uno muestro "dias" caso contrario muestro "dia" 
		    %>
		    
	    <p class="card-text"> Validez: <%=validity%> dias</p>
	    
	    
	    <%	} else{ %>
	    	
	    	<p class="card-text"> Validez: <%=validity%> dia</p>
	    	
	     <%	} %>
	    
	    <p class="card-text"> Descuento: <%=discount%> % </p>
	    
	    
	    <p class="card-text"> Fecha de alta: <%=uploadDateStr%> </p>
	    
	    
	    <p class="card-text"> Categorias:</p>
	    
	    <ul>
	    <% 
	    for (DtCategory category: categories){
	    %>
	    	<li>
	    		<span> <%=category.getName()%>  </span>	
	    	</li> 
	    <% 
	    }
	    %>   
	    </ul>
	    
	    <%
	    
	    //si el usuario es un turista, mostrar el boton.
	    //al presionar el boton desplegar el formulario con la cantidad de turistas.
	    //modificar el boton para mostrar el precio.
	    
	    %>
	    
	    
	    <button class="w-100 btn btn-lg btn-primary"> Comprar </button>
	    
	    <form>
	    
	    <div>
	    <span> Nº Turistas: </span>
	    <input   name="touristAmount" id="touristAmount" type="number" placeholder="Ej: 10"/>
	    </div>
	   
	    </form>
	    
	    
     </div>
    
    	<div class="divActivity">
    	
    		<h4 class="card-text">Actividades del paquete:</h4>
    			<ul class="list-group custom-list">
								<%
								//for each de actividades.
								
								for (DtTouristicActivity activity : activities) {
									
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
											<%= activity.getName() %></div>
											<div class="image">
												<img style="width:25em;  border-radius: 5%; margin-left: 3%;" width="250" height="250" src="data:image/<%= activityFormat %>;base64,<%= base64ActivityImage%>" alt="Foto de perfil">
											</div>
										
									</div>
								</li>
								<%
									}//if imagen actividad de paquete
								}//for imagen actividad de paquete
								%>

    <%
    
	}  //if de la imagen paquete. %> 
    	
    		</ul>
    	</div>
    
</div>   
   
    
    <jsp:include page="../../templates/footer.jsp" />
    
</body>

</html>