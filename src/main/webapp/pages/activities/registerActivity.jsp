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

<body onload="currentTime()">
	<jsp:include page="../../templates/header.jsp"/>
	<main class="form-signin w-50 m-auto container-fluid">

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
	        <input id="duration" type="number" class="form-control" placeholder="Ej: 3" name="duration" required>
	        
	    </div>
	    <br>
	    
	     <div class="input-group">
	     	<span class="input-group-text">Costo:</span>
	        <input id="cost" type="number" class="form-control" placeholder="Ej: $500" name="cost" required>
	        
	    </div>
	    <br>
	    
	     <div class="input-group">
	     	<span class="input-group-text">Fecha de creación:</span>
	        <input id="uploadDate" type="date" class="form-control" placeholder="Ej: 10/10/2023" name="uploadDate" required>
	        
	    </div>
	    <br>
	    
	    <div>
             <span> Seleccione el departamento de la actividad:</span>
             <select id="department" class="form-select" aria-label="Default select example" name="department" required>
	  
	  		<option value="1"> Canelones </option>
	  		<option value="2"> Maldonado </option>
	  		<option value="3"> Rocha </option>
	  		<option value="4"> Treinta y Tres </option>
	  		<option value="5" selected> Cerro Largo </option>
	  		<option value="6"> Rivera </option>
	  		<option value="7"> Artigas </option>
	  		<option value="8"> Salto </option>
	  		<option value="9" > Paysandú </option>
	  		<option value="10"> Rió Negro </option>
	  		<option value="11"> Soriano </option>
	  		<option value="12"> Colonia </option>
	  		<option value="13"> San José </option>
	  		<option value="14"> Flores </option>
	  		<option value="15"> Florida </option>
	  		<option value="16"> Lavalleja </option>
	  		<option value="17"> Durazno </option>
	  		<option value="18"> Tacuarembó </option>
	  		<option value="19"> Montevideo </option>
	  		
	  		
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
        	<input type="file" accept="image/*" id="imagen" name="imagen">
        	<br>
        	
             <input  href="login.html" class="w-100 btn btn-lg btn-primary" type="submit" value="Crear actividad"/>
             
	    </form>
	  </main>  
     
     <jsp:include page="../../templates/footer.jsp" />
</body>

</html>