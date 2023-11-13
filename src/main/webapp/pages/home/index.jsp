<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<% 	String userAgent = request.getHeader("user-agent");
	System.out.println(userAgent);
	
	if(userAgent.contains("Mobile")){

		session.setAttribute("userDevice", "mobile");
	}else{
		session.removeAttribute("userDevice");
	};
	//esta implementación es MUY fea ya que solo se checkea en esta página y hay que recargar para que se muestren los cambios.
	//TODO: encontrar forma de que se checke más frecuentemente y sin recargar plox.
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="assets/styles/main.css">
    <script src="assets/scripts/jquery3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="assets/scripts/clock.js" type="text/javascript"></script>
    
    <link rel="icon" href="assets/images/star.ico" type="image/png">
    <title>Turismo.UY</title>
    
    
</head>


<style>
	.mobile{
		display: flex;
		justify-content: center;
	}
	.cuadrado {
		width: 20%;
		background-color: #ececec;
		margin: 0.5%;
		text-align: center;
		padding: 0.4em;
		font-size: 1em;
		box-shadow: 0 10px 16px 0 rgba(244, 244, 244, 0.2),0 6px 20px 0 rgba(89, 88, 88, 0.31) !important;
		border-radius: 0.5em;
	  }
	  
	@media (max-width: 700px){
		.mobile{
			display: block;
			justify-content: center;
			}
			
		.cuadrado{
			width:auto;
			background-color: #ececec;
			margin: 0.5%;
			text-align: center;
			padding: 0.4em;
			font-size: 1em;
			box-shadow: 0 10px 16px 0 rgba(244, 244, 244, 0.2),0 6px 20px 0 rgba(89, 88, 88, 0.31) !important;
			border-radius: 0.5em;
			margin: 3em;
		}
		
		body{
			margin-bottom: 100px;
		}
	}
	
	
	
</style>

<body onload="currentTime()">
		<%String userDevice = (String) session.getAttribute("userDevice");
		if(userDevice != null){%>
			<script type="text/javascript"> console.log("userDevice es efectivamente, mobile"); </script>
			<script type="text/javascript"> console.log("<%=userDevice %>"); </script>
			
		<%}else{%>
			<script type="text/javascript"> console.log("NO MOBILE NONONONO"); </script>
			<script type="text/javascript"> console.log("<%=userDevice %>"); </script>
			<%}%>
		
		
 		
    	
		<jsp:include page="../../templates/header.jsp" />   
		
		 <h1  style=" text-align: center;">  <em> <b style="text-shadow: 0.15em 0.15em 0.24em ;"> Laboratorio de programación de aplicaciones. Tarea 2  </b> </em> </h1>
		
		<br>
		 
        <div class="mobile">
        
	        <div class="cuadrado">   
	        <h4> <b>  Acerca del sitio</b></h4>
	        <p style=" text-align: left;"> Turismo.UY es una plataforma que ofrece un servicio de gestión social de actividades turísticas.</p>
	        <h3>¿Qué queremos lograr con esto? </h3>
	        <p style=" text-align: left;"> Brindarle a los usuarios mayor comodidad a la hora de planificar y gestionar sus
	        viajes en Uruguay.
	        </p>
	        </div>
	        		
	        		
			<div class="cuadrado">
			<h4><b>¿Que ofrecemos?</b></h4>
			<p style=" text-align: left;"> 
			Brindamos un extenso catalogo de
	        <a href="<%=request.getContextPath()%>/consultActivity?redirectTo=activity">
	        actividades turisticas
	        </a> 
	        a lo largo y ancho del país, desde actividades en las costas más bellas del país
	        hasta disfrutar la gastronomia del interior del pais.
	        También contamos con interesantes 
	        <a href="<%= request.getContextPath() %>/bundleList">
	        paquetes promocionales
	        </a>
	        , para la familia.
			</p>	
			</div>
	        
	        <div class="cuadrado">
			<h4><b>Registrate</b></h4>
			<p style=" text-align: left;"> 
			Comienza a viajar con nosotros como turista, o trabaja con nosotros, como proveedor
			, comienza tu negocio
			o potencia el que ya tienes.
			Registrate <a href="<%= request.getContextPath() %>/register"><b> aquí </b></a>para empezar.
			</p>	
			</div>
	        
	        
			<div class="cuadrado" >
			<h4><b> Equipo de desarrollo:</b></h4>
			<ul style=" text-align: left;">
				<li class="mobile">  Braian Granero </li>
				
				<li>  Eugenio Perdomo </li>
				
				<li>  Martín Antúnez </li>
				
				<li>  Kevin Viera </li>
				
				<li>  Lucas Techera </li>
			</ul>
			</div>
        </div>
        
  
		<jsp:include page="../../templates/footer.jsp" />
		
		<style>
		
		</style>
</body>
</html>