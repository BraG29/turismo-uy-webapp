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
    <script src="../../assets/scripts/clock.js" type="text/javascript"></script>
    <link rel="icon" href="../../assets/images/star.ico" type="image/png">
    <title>Turismo.UY</title>
</head>

<body onload="currentTime()">

	<main class="form-signin w-50 m-auto container-fluid">
	    <div class="">
	        <script src="../../templates/header.js"></script>
	        <h1> Registrar actividad</h1>      
	        <script src="../../templates/footer.js"></script>
	    </div>
	    
	    <form method="post">
	    
	    <div class="input-group">
	     	<span class="input-group-text">Nombre:</span>
	        <input id="activityName" type="text" class="form-control" placeholder="Ej: Degusta" required>
	        
	    </div>
	    <br>
	    
	     <div class="input-group">
	     	<span class="input-group-text">Descripción:</span>
	        <input id="description" type="text" class="form-control" placeholder="Ej: Degusta comidas" required>
	        
	    </div>
	    <br>
	    
	     <div class="input-group">
	     	<span class="input-group-text">Duración (hrs):</span>
	        <input id="duration" type="number" class="form-control" placeholder="Ej: 3" required>
	        
	    </div>
	    <br>
	    
	     <div class="input-group">
	     	<span class="input-group-text">Costo:</span>
	        <input id="cost" type="number" class="form-control" placeholder="Ej: $500" required>
	        
	    </div>
	    <br>
	    
	     <div class="input-group">
	     	<span class="input-group-text">Fecha de creación:</span>
	        <input id="uploadDate" type="date" class="form-control" placeholder="Ej: 10/10/2023" required>
	        
	    </div>
	    <br>
	    
	     <div class="input-group">
	     	<span class="input-group-text">Ciudad:</span>
	        <input id="department" type="text" class="form-control" placeholder="Ej: Mercedes" required>
	        
	    </div>
	    <br>
	    
	     <div class="input-group">
	     	<span class="input-group-text">Departamento:</span>
	        <input id="firstName" type="text" class="form-control" placeholder="Ej: Florida" required>
	        
	    </div>
	    <br>
	    
	     <div>
             <select id="categories" class="form-select" aria-label="Ej: Recorridos">
	  			<option value="gastronomy"> Gastronomía </option>
	  			<option value="Beaches" selected> Playas </option>
			</select>
          </div>
          <br>
          
          <label for="imagen">Selecciona una imagen:</label>
        	<input type="file" id="imagen" name="imagen">
        	<br>
          
          <button class="w-100 btn btn-lg btn-primary" type="submit">Crear actividad</button>   
	    </form>
	  </main>  
     
     <script src="../../templates/footer.js"></script>
</body>

</html>