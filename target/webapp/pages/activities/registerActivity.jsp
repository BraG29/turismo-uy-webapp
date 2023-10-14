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
	    
	    <form action="<%= request.getContextPath() %>/registerActivity" method="post">
	    
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
	    
	    <div>
             <span> Seleccione el departamento de la actividad:</span>
             <select id="department" class="form-select" aria-label="Default select example" required>
	  
	  		<option value="artigas"> Artigas </option>
	  		<option value="artigas"> Canelones </option>
	  		<option value="artigas"> Cerro Largo </option>
	  		<option value="artigas"> Colonia </option>
	  		<option value="artigas"> Durazno </option>
	  		<option value="artigas"> Flores </option>
	  		<option value="artigas"> Florida </option>
	  		<option value="artigas"> Lavalleja </option>
	  		<option value="artigas" selected> Maldonado </option>
	  		<option value="artigas"> Montevideo </option>
	  		<option value="artigas"> Paysandú </option>
	  		<option value="artigas"> Río Negro </option>
	  		<option value="artigas"> Rivera </option>
	  		<option value="artigas"> Rocha </option>
	  		<option value="artigas"> Salto </option>
	  		<option value="artigas"> San José </option>
	  		<option value="artigas"> Soriano </option>
	  		<option value="artigas"> Tacuarembó </option>
	  		<option value="artigas"> Treinta y tres </option>
	  		
			</select>
        </div>
	    <br>
	    
	     <div class="input-group">
	     	<span class="input-group-text">Ciudad:</span>
	        <input id="city" type="text" class="form-control" placeholder="Ej: Mercedes" required>
	        
	    </div>
	    <br>
	    
	     <div>
	     <h3> Listar categorias (ver como cargar para seleccionar mas de una)</h1>
	     	<span >Seleccione categoría/s:</span>
             <select id="categories" class="form-select" aria-label="Ej: Recorridos" required>
	  			<option value="gastronomy"> Gastronomía </option>
	  			<option value="Beaches" selected> Playas </option>
			</select>
          </div>
          <br>
          
          <label for="imagen">Selecciona una imagen:</label>
        	<input type="file" id="imagen" name="imagen">
        	<br>
        	
             <input  href="login.html" class="w-100 btn btn-lg btn-primary" type="submit" value="Crear actividad"/>
             
	    </form>
	  </main>  
     
     <script src="../../templates/footer.js"></script>
</body>

</html>