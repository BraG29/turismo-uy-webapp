<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="uy.turismo.webapp.ws.DtUserWSArray"%>
<%@page import="uy.turismo.webapp.ws.DtUserWS"%>
<%@page import="uy.turismo.webapp.ws.Publisher"%>
<%@page import="uy.turismo.webapp.ws.PublisherService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.io.InputStream"%>
<%@page import="java.util.List" %>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@page import="uy.turismo.webapp.functions.Functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/styles/bootstrap4.5.2.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/styles/main.css">
<script src="assets/scripts/jquery3.5.1.min.js"></script>
<script src="assets/scripts/bootstrap4.5.2.min.js"></script>
<script src="assets/scripts/bootstrap5.2.3.bundle.min.js"></script>
<script src="assets/scripts/clock.js" type="text/javascript"></script>
<link rel="icon" href="assets/images/star.ico" type="image/png">

<title> Lista de usuarios </title>

<style>
	 .user-list {
            list-style: none;
            padding: 0;
        }

        .user-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .user-image {
            border-radius: 5%;
			margin: auto;
			width: 300px;
			height: 300px;
			
            
        }

        .user-nickname {
            font-weight: bold;
        }
		
		 .user-info {
            display: flex;
            flex-direction: column;
        }
        
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .sea-lo-que-sea{
        
        }
</style>

</head>
<body onload="currentTime()">

<jsp:include page="../../templates/header.jsp" />



<main class="container-fluid">
<div class="row">
<h1> Usuarios registrados en la plataforma: </h1>			
			<% 
				PublisherService service = new PublisherService();
				Publisher controller = service.getPublisherPort();
			
				List<DtUserWS> usersList = controller.getListUser().getItem();
						
			
				for(DtUserWS user : usersList){
					
					BufferedImage userImage = null;
				
					try{
			           	InputStream inptuStream = new ByteArrayInputStream(user.getImage());
						userImage = ImageIO.read(inptuStream);
							
							 
						
					}catch(Exception e){
						e.printStackTrace();
					}
						
				
					if(userImage != null){
						/* ByteArrayOutputStream baos = new ByteArrayOutputStream();
				        String format = "jpeg"; // Formato predeterminado es JPEG
		
				        // Determina el formato de la imagen
				        if (userImage.getTransparency() == BufferedImage.OPAQUE) {
				            format = "png";
				        }
		
				        ImageIO.write(userImage, format, baos);
				        byte[] bytes = baos.toByteArray();
				        String base64Image = Base64.getEncoder().encodeToString(bytes);	 */
				        
				        String imagePath = Functions.saveImage(
                                userImage, 
                                user.getNickname(), 
                                getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
                                "user/");
			

			%>
			
			
			 
		<div class="col-3">
			<div class="card" style="align-items: center; padding: 0.3em; background-color: aliceblue; margin-bottom: 1em;">
				<img src="<%= imagePath %>" class="user-image" alt="No se encontró la imagen.">
					<div class="card-body">
					<div class="user-info">
					<span class="user-nickname"> Nombre de usuario:
						<a href="<%= request.getContextPath() %>/profile?id=<%=user.getId()%>">
						<%= user.getNickname()%>  
						</a>
					</span>			
					<span> Correo electrónico: <%= user.getEmail() %> </span>		 
					 </div>	
				</div>
			</div>
		</div>

			
	
			<% }else{ %>
			
			
			<div class="col-3">
			<div class="card" style="align-items: center; padding: 0.3em; background-color: aliceblue; margin-bottom: 1em;">
				<img src="assets/images/noImage.jpg" class="user-image" alt="">
					<div class="card-body">
					<div class="user-info">
					<span class="user-nickname"> Nombre de usuario:
						<a href="<%= request.getContextPath() %>/profile?id=<%=user.getId()%>">
						<%= user.getNickname()%>  
						</a>
					</span>			
					<span> Correo electrónico: <%= user.getEmail() %> </span>		 
					 </div>	
				</div>
			</div>
		</div>
			 		
			<%		
					} //else
			
				} //for
			%>
			<hr>
			</div>
		</main>


<jsp:include page="../../templates/footer.jsp" />



</body>
</html>