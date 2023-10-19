<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtCategory"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtProvider"%>
<%@page import="java.util.List"%>
<%
	List<DtProvider> providers = (List<DtProvider>) request.getAttribute("providers");
	List<DtCategory> categories = (List<DtCategory>) request.getAttribute("categories");
	List<DtTouristicActivity> activitiesStated = (List<DtTouristicActivity>) request.getAttribute("activitiesStated");
	Map<Long, String> activityImages = (Map<Long, String>) request.getAttribute("activityImages");
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="assets/scripts/jquery3.5.1.min.js"></script>
	<script src="assets/scripts/bootstrap4.5.2.min.js"></script>
	<script src="assets/scripts/bootstrap5.2.3.bundle.min.js"></script>
	<script src="assets/scripts/clock.js" type="text/javascript"></script>
 	<link rel="icon" href="assets/images/star.ico" type="image/png">
	<title>Image Boxes with ComboBox</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<style>
    /* CSS to extend the left panel background */
    .left-panel {
      min-height: 100vh; /* Set the minimum height to 100% of the viewport height */
    }
    
  </style>
</head>

<body>
	<jsp:include page="../../templates/header.jsp" />

	<div class="container-fluid">
		<div class="row">
			<!-- Left Panel -->
			<div class="col-md-3 bg-light p-3 left-panel">
				<h4>Filter Options</h4>
				<div class="form-group">
					<label for="selectOptions">Select an Option:</label>
					<select class="form-control" id="selectOptions">
						<option value="option1">-</option>
						<option value="option2">Departamento</option>
						<option value="option3">Categoria</option>
					</select>
					<a href="<%= request.getContextPath() %>/registerActivity" method="get"> Hacia registrar Actividad</a>
					
					<form action="" method="get">	
						<button type="submit" class="btn btn-primary">Buscar actividad</button>
					</form>
					
				</div>

				<div id="comboBoxContainer">
					<!-- Second ComboBox (Initially Hidden) -->
					<div class="form-group" id="department" style="display: none;">
						<label for="selectOptions2">Departamentos:</label>
						<select class="form-control" id="selectOptions2">
					  		<option value="1"> Canelones </option>
					  		<option value="2"> Maldonado </option>
					  		<option value="3"> Rocha </option>
					  		<option value="4"> Treinta y Tres </option>
					  		<option value="5"> Cerro Largo </option>
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
					<!-- Third ComboBox (Initially Hidden) -->
					<div class="form-group" id="categories" style="display: none;">
						<label for="selectOptions3">Categorias:</label>
						<select id="selectOptions3" class="form-control" aria-label="Ej: Recorridos" name="categories">
            				<% for(DtCategory category : categories){%>
             					<option value=<%=category.getId()%>> <%= category.getName() %></option>
             				<%}%>
						</select>
						
					</div>
				</div>
			</div>
			<!-- Center Area -->
			<div class="col-md-9">
				<div class="row">
					<!-- Small Boxes -->
					<% for(DtTouristicActivity activity : activitiesStated){%>
					<div class="col-md-3">
						<div class="card" style="align-items: center;">
							<img src="<%=activityImages.get(activity.getId())%>" class="card-img-top" style="width:15em; margin-top: 1em; border-radius: 5%;">
							<div class="card-body">
								<h5 class="card-title"> <%= activity.getName() %> </h5>
								<p class="card-text"> <%= activity.getDescription() %></p>
								<!-- -------------------------------------------------------------------- -->
							</div>
						</div>
					</div>
					<%}%>
					<!-- Add more small boxes as needed -->

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../templates/footer.jsp" />

	<script>
		// JavaScript to show/hide additional ComboBoxes based on the selection
		const selectOptions = document.getElementById("selectOptions");
		const department = document.getElementById("department");
		const categories = document.getElementById("categories");

		selectOptions.addEventListener("change", function () {
			const selectedOption = selectOptions.value;

			if (selectedOption === "option1") {
				department.style.display = "none";
				categories.style.display = "none";
			} else if (selectedOption === "option2") {
				department.style.display = "block";
				categories.style.display = "none";
			} else if (selectedOption === "option3") {
				department.style.display = "none";
				categories.style.display = "block";
			}
		});
	</script>
</body>
</html>