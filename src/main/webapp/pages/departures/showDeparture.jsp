<%@page import="java.awt.image.BufferedImage"%>
<%@ page import="java.io.ByteArrayOutputStream"%>
<%@ page import="java.util.Base64"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@page import="uy.turismo.webapp.functions.Functions"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtCategory"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtTouristicDeparture"%>
<%@page  import="uy.turismo.servidorcentral.logic.datatypes.DtDepartment"%>
<%@page import="uy.turismo.servidorcentral.logic.controller.ControllerFactory"%>
<%@page import="uy.turismo.servidorcentral.logic.controller.IController"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	
	//departureProfile
	
	IController controller = ControllerFactory.getIController();

	Long departureId = (Long) request.getAttribute("departureId"); //id que me viene desde el servlet
	
	DtTouristicDeparture departure  = controller.getTouristicDepartureData(departureId);
	

	String name = departure.getName();
	
	String place = departure.getPlace();
	
	Integer touristAmount = departure.getMaxTourist();
	
	LocalDate uploadDate = departure.getUploadDate();
	
	LocalDateTime departureDate = departure.getDepartureDateTime();
	
	
	BufferedImage departureImage = departure.getImage();
    
	ByteArrayOutputStream baos = new ByteArrayOutputStream();
    String format = "jpeg"; // Formato predeterminado es JPEG

    // Determina el formato de la imagen
    if (departureImage.getTransparency() == BufferedImage.OPAQUE) {
        format = "png";
    }

    ImageIO.write(departureImage, format, baos);
    byte[] bytes = baos.toByteArray();
    String base64Image = Base64.getEncoder().encodeToString(bytes);
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=name%></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
     <style>
     
		 .image {
            width:25em;
            border-radius: 5%;
        }

		
    </style>
</head>
<body onload="currentTime()">
<jsp:include page="../../templates/header.jsp" />
    
			    
			  <!--   <div style="align-items: center;">
					<div class="card text-center" style="width: 18rem; border: solid 0; text-align: left; margin-left: 40% ">
					  		<img class="image" src="data:image/<%= format %>;base64,<%= base64Image %>" alt="Foto de perfil">
						  	<div class="card-body">
							   	<p class="card-text"> Lugar: <%=place%></p>
								<p class="card-text"> Cupos disponibles: <%=touristAmount%></p>
								<p class="card-text"> Fecha de salida: <%=departureDate%></p>
						  </div>
					</div>
			    </div> -->
			    
			    
		    <div class="card text-center">
		    
				  <div class="card-header">
				   <h2> <%= name %> </h2>
				  </div>
				  
				  <div class="card-body">
				    <img class="image" src="data:image/<%= format %>;base64,<%= base64Image %>" alt="Foto de perfil">
				    <p class="card-text"> Lugar: <%=place%></p>
					<p class="card-text"> Cupos disponibles: <%=touristAmount%></p>
					<p class="card-text"> Fecha de salida: <%=departureDate%></p>
				  </div>
			</div>
	
	
		
	
    
<jsp:include page="../../templates/footer.jsp" />
    <!-- Add Bootstrap JS and jQuery scripts (optional) -->

</body>
</html>

