<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.List" %>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtUser"%>
<%@page import="uy.turismo.servidorcentral.logic.controller.ControllerFactory"%>
<%@page import="uy.turismo.servidorcentral.logic.controller.IController"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@page import="uy.turismo.webapp.functions.Functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Consulta de usuario</title>
<link rel="stylesheet" href="../../assets/styles/UserListStyle.css">

</head>
<body>

<h1> Usuarios registrados en la plataforma: </h1>

<div>
	<table>
	
	<tr>
	
	<th> Id </th>
	
	<th> Nickname </th>
	
	<th> Email </th>
	
	
	</tr>
	
			<% 
				IController controller = ControllerFactory.getIController();
			
			
				List<DtUser> usersList = controller.getListUser();
			
				for(DtUser user : usersList){
				
				String imagePath = Functions.saveImage(
		        		user.getImage(),
		        		user.getNickname(),
		        		(InputStream) request.getAttribute("stream"),
		        		"user/");
				
				Long id = user.getId();
					
				String nickname = user.getNickname();
					
				String email = user.getEmail();
			
			%>
	
			<tr> 
			
				<td> <%= id %> </td>
				
				<td> <a href="<%= request.getContextPath() %>/profile?id=<%=id%>">
			<%= nickname%>  
			</a>  </td>
				
				
				<td> <%= email %> </td>

				<td> <img src="<%=imagePath%>" alt="Foto de perfil"> </td>
			
			</tr>

			<%		
				} //for
			%>
	</table>
</div>	

</body>
</html>