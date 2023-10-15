<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../assets/styles/bootstrap4.5.2.min.css">
    <link rel="stylesheet" href="../../assets/styles/main.css">
    <script src="../../assets/scripts/jquery3.5.1.min.js"></script>
    <script src="../../assets/scripts/bootstrap4.5.2.min.js"></script>
    <script src="../../assets/scripts/bootstrap5.2.3.bundle.min.js"></script>
    <script src="../../assets/scripts/clock.js" type="text/javascript"></script>
    <link rel="icon" href="../../assets/images/star.ico" type="image/png">
    <title>Turismo.UY</title>
</head>

<body onload="currentTime()">
	<main class="form-signin w-50 m-auto container-fluid">
        <jsp:include page="../../templates/header.jsp"/>
	    <h1> Registrar salida</h1>
	    
	    <form action="" method="post">
    		<div class="input-group">
                    <span class="input-group-text"> Nombre: </span>
                    <input id="username" type="text" class="form-control" placeholder="Ej: Recorrida rambla" required>
             </div> 
	    	
	    	<br>
	    	
	    	<div class="input-group">
                    <span class="input-group-text"> Cupos (personas): </span>
                    <input id="maxTourist" type="number" class="form-control" placeholder="Ej: 20" required>
             </div>
            
            <br>
            
            <div class="input-group">
                    <span class="input-group-text"> Nombre: </span>
                    <input id="username" type="text" class="form-control" placeholder="Ej: Recorrida rambla" required>
             </div>
             
             <br>
             
	    	<div class="input-group">
                    <span class="input-group-text">Horario de salida: </span>
                    <input id="departureSchedule" type="datetime-local" class="form-control" placeholder="Ej: 10/10/2023 - 15:00" required>
             </div>
	    
	    	<br>
	    
	   		 <div class="input-group">
                    <span class="input-group-text">Lugar: </span>
                    <input id="place" type="text" class="form-control" placeholder="Ej: Club deportivo union" required>
             </div>
	    
	    	<br>
	    
	       <div class="input-group">
	     	<span class="input-group-text">Fecha de creación:</span>
	        <input id="uploadDate" type="date" class="form-control" placeholder="Ej: 10/10/2023" required>
	    	</div>
	    	<br>
	    
	     	<label for="imagen">Selecciona una imagen:</label>
        	<input type="file" id="imagen" name="imagen">
 			
 			<br>
 			
 			<input class="w-100 btn btn-lg btn-primary" type="submit" value="Crear salida"/>
 			
	    </form>
    </main>
    <jsp:include page="../../templates/footer.jsp" />    
</body>

</html>