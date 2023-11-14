<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.List" %>
<%@page import="uy.turismo.webapp.ws.controller.Publisher"%>
<%@page import="uy.turismo.webapp.ws.controller.PublisherService"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicBundleWS" %>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@page import="uy.turismo.webapp.functions.Functions" %>


<!DOCTYPE html>
<html>
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

<title>Paquetes turisticos</title>

<style>
	.bundle-list {
            list-style: none;
            padding: 0;
        }
     .bundle-image {
      width: 300px; /* Ajusta el tamaño de la imagen según tus necesidades */
      height: 300px;
      margin-right: 30px;
  }
  .bundle-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
   .bundle-name{
            font-weight: bold;
        }
		
		 .bundle-info {
            display: flex;
            flex-direction: column;
        }

</style>

</head>
<body onload="currentTime()">
<jsp:include page="../../templates/header.jsp" />

<div class="">

<main class="form-signin w-50 m-auto container-fluid">
<h1> Lista de paquetes turisticos:</h1>
	<ul class="bundle-list"> 
		
		<li>
		
		<%
						PublisherService service = new PublisherService();
						Publisher controller = service.getPublisherPort();
						
						List<DtTouristicBundleWS> bundles = controller.getListTouristicBundle().getItem();
						
						
						for(DtTouristicBundleWS bundle : bundles){
						
					
							byte[] image = bundle.getImage();  
					
					if(image != null){
						 BufferedImage bundleImage = Functions.convertArrayToBI(image);
					        
					        String imagePath = Functions.saveImage(
					        		bundleImage, 
		                         	bundle.getName(), 
		                         	getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
		                         	"bundle/");
				%>
		
		<li class="bundle-item">
			<img style="width:25em;  border-radius: 5%;" class="bundle-image" src="<%= imagePath %>" alt="Foto de perfil">			
			<div class="bundle-info">
			<span class="bundle-name"> Nombre:
				<a href="<%= request.getContextPath() %>/bundleProfile?id=<%=bundle.getId()%>">
				<%= bundle.getName() %>
				</a>
			</span>				 
			 </div>
			 </li> 
			

		<% }else{ %>
		<li class="user-item">
			<img style="width:25em;  border-radius: 5%;" class="bundle-image"  alt="No se encontro la imagen">
			<span class="bundle-name"> Nombre:
				<a href="<%= request.getContextPath() %>/bundleProfile?id=<%=bundle.getId()%>">
				<%= bundle.getName()%>  
				</a>
			</span>	
		
		</li>
		
		<%
		
			} //if
		} //for
		
		%>
		
		
	</ul>
	</main>
</div>

<jsp:include page="../../templates/footer.jsp" />

</body>
</html>