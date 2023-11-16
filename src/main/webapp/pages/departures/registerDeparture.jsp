<%@page import="uy.turismo.webapp.ws.controller.DtTouristicActivityWS"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.List" %>
<% 
	List<DtTouristicActivityWS> activitiesStated = (List<DtTouristicActivityWS>) request.getAttribute("activitiesStated");

%>
<!DOCTYPE html>
<html lang="en">

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
	<title>Registrar Salida</title>
</head>

<style>
	@media (max-width: 700px){
		.mobile{
			width: 100% !important;
		}
	}
</style>

<body onload="currentTime()">
	<jsp:include page="../../templates/header.jsp" />
	
	<main class="form-signin w-50 m-auto container-fluid mobile">
	<h1 class="h3 mb-3 fw-normal pt-3">Registro de salida</h1>
		<form action="<%= request.getContextPath() %>/registerDeparture" enctype="multipart/form-data" method="post" onsubmit="return validateForm()">
			<div>
				<div class="input-group">
				
	                <label class="input-group-text" for="nameDeparture"> Nombre de la Salida Turística: </label>
	                <input id="username" type="text" name="nameDeparture" class="form-control" placeholder="Ej: Recorrida rambla" required>
	            </div>
	            <br>
				<span> Seleccione el departamento de la actividad:</span>
				<select id="departmentCombobox" class="form-select" aria-label="Default select example" name="department" required>
					<option value="1"> Canelones </option>
					<option value="2"> Maldonado </option>
					<option value="3"> Rocha </option>
					<option value="4"> Treinta y Tres </option>
					<option value="5" selected> Cerro Largo </option>
					<option value="6"> Rivera </option>
					<option value="7"> Artigas </option>
					<option value="8"> Salto </option>
					<option value="9"> Paysandú </option>
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


			<div>
				<span>Seleccione una actividad: </span>

				<select id="activitiesCombobox" class="form-select" aria-label="Ej: Rocha" name="activityId" onclick="selectActivity()" required>
             			<option value="-"> - </option>
             			
				</select >
			</div>

			<br>
            
      
            <div class="input-group">
                <label class="input-group-text" for="startingDate">Fecha que comienza: </label>
                <input id="departureSchedule" type="datetime-local" name="startingDate" class="form-control" placeholder="Ej: 10/10/2023 - 15:00 PM" required>
            </div>
            <br>
            <div class="input-group">
                <label class="input-group-text" for="maxTourists"> Cupos máximos de personas: </label>
                <input id="maxTourist" type="number" name="maxTourists" class="form-control" min="1" step="1" placeholder="Ej: 20" required>
            </div>
            <br>
            <div class="input-group">
                <label class="input-group-text" for="place">Lugar: </label>
                <input id="place" type="text" name="place" class="form-control" placeholder="Ej: Club deportivo union" required>
            </div>
			<br>
			<label for="imagen">Selecciona una imagen:</label>
			<input type="file" accept="image/*" id="imagen" name="image">
			<br>
			<br>
			
			<div id="liveAlertPlaceholder"></div>
			<button type="submit" class="w-100 btn btn-lg btn-primary" id="liveAlertBtn" " >Crear Salida Turística</button>

		</form>
	</main>
	<jsp:include page="../../templates/footer.jsp" />
</body>

<script>

	
	
	function selectActivity(){
			//document.addEventListener("DOMContentLoaded", function () {
				
				console.log("entre al SelectActivity");
				
			var departmentCombobox = document.getElementById("departmentCombobox");
			var activitiesCombobox = document.getElementById("activitiesCombobox");
			
			departmentCombobox.addEventListener("change", function () {
				
				activitiesCombobox.innerHTML = ""; // Clear previous options
				var selectedDepartment = departmentCombobox.value;
				var activitiesFound = false;
				
				<% for(DtTouristicActivityWS activity : activitiesStated) { %>
					// Check if the activity's department matches the selected department
					console.log("entre al for");
					if ("<%= activity.getDepartment().getId() %>" === selectedDepartment) {
						
						var option = document.createElement("option");
						
						option.text = "<%= activity.getName() %>";
						option.value = "<%= activity.getId() %>";
						
						activitiesCombobox.appendChild(option);
						
						activitiesFound = true;
						console.log("entre al if");
					}
				<% } %>
				
				if(!activitiesFound){
					var option = document.createElement("option");
					option.text = "No hay actividades para este departamento.";
					option.value = "-";
					
					activitiesCombobox.appendChild(option);
					console.log("entre al no activityFound");
				}
			});
		//});
	}
	selectActivity();
	
	function validateForm() {
		 // Get the input value
		  var inputValue = document.getElementById("activitiesCombobox").value;

		  // Check the condition (e.g., incorrect value)
		  if (inputValue === "-") {
		    alert("Actividad incorrecta.");
		    return false; // Prevent form submission
		  }

		  // If the condition is not met, allow form submission
		  return true;
	}
	
	
</script>



</html>