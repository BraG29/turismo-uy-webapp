<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Turismo.UY</title>
    
    
</head>


<style>
	.cuadrado {
	  width: 400px; /* Define el ancho de cada cuadrado */
	  height: 550px; /* Define la altura de cada cuadrado */
	  background-color: #ccc; /* Color de fondo de los cuadrados */
	  margin: 20px; /* Espacio entre los cuadrados */
	  float: left; /* Hace que los cuadrados se coloquen uno al lado del otro */
	  text-align: center; /* Centra el contenido del div */
	  padding: 10px; /* Espacio interno dentro del cuadrado para el contenido */
	  font-size: 25px;
	  border: 2px solid darkgreen;
	  box-shadow: 0 10px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19) !important;
	  border-radius: 0.5em;
	  
	}

</style>

<body onload="currentTime()">
    
		<jsp:include page="../../templates/header.jsp" />   
		
		 <h1  style=" text-align: center;">  <em> <b style="text-shadow: 0.15em 0.15em 0.24em ;"> Laboratorio de programación de aplicaciones. Tarea 2  </b> </em> </h1>
		
		<br>
		 
        <div style="justify-content: center; display: flex;">
        
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
	        
	        
			<div class="cuadrado">
			<h4><b> Equipo de desarrollo:</b></h4>
			<ul style=" text-align: left;">
				<li>  Braian Granero </li>
				
				<li>  Eugenio Perdomo </li>
				
				<li>  Martín Antúnez </li>
				
				<li>  Kevin Viera </li>
				
				<li>  Lucas Techera </li>
			</ul>
			</div>
        </div>
        
  
		<jsp:include page="../../templates/footer.jsp" />

</body>
</html>