<%@page import="uy.turismo.webapp.ws.controller.DtDepartmentWS"%>
<%@page import="uy.turismo.webapp.functions.Functions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uy.turismo.webapp.ws.controller.ActivityState"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicActivityWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtCategoryWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtProviderWS"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%

	String userType = (String) session.getAttribute("userType");
	
	List<DtTouristicActivityWS> activitiesStated = (List<DtTouristicActivityWS>) session.getAttribute("activityStated");
	List<DtTouristicActivityWS> activitiesToPrint = new ArrayList<DtTouristicActivityWS>();

	Map<Long, String> activityImages = (Map<Long, String>) session.getAttribute("activityImages");
	
	List<DtCategoryWS> categories = (List<DtCategoryWS>) session.getAttribute("categories");
	
	List<DtDepartmentWS> departments = (List<DtDepartmentWS>) session.getAttribute("departments");
	
	String pruebaControl = (String) request.getAttribute("control");
	if(pruebaControl != null){
		switch (pruebaControl) {
		
		case "department":{
			Long idDepartment = Long.parseLong(request.getParameter("department"));
			HashMap<Long, List<DtTouristicActivityWS>> filteredByDepartment = (HashMap<Long, List<DtTouristicActivityWS>>) session.getAttribute("filteredByDepartment");
			activitiesToPrint = filteredByDepartment.get(idDepartment); 
			break;}
			
		case "category":{
			Long idCategory = Long.parseLong(request.getParameter("categories"));
			HashMap<Long, List<DtTouristicActivityWS>> filteredByCategory = (HashMap<Long, List<DtTouristicActivityWS>>) session.getAttribute("filteredByCategory");
			activitiesToPrint = filteredByCategory.get(idCategory); 
			break;}
			
		default:
			System.out.println("nada");
			break;
		}
	}else{
		
		activitiesToPrint = activitiesStated;
	}
	
	
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="assets/styles/main.css">
    <script src="assets/scripts/jquery3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="assets/scripts/clock.js" type="text/javascript"></script>
 	<link rel="icon" href="assets/images/star.ico" type="image/png">
	<title>Consultar Actividad</title>
	
	<style>
    /* CSS to extend the left panel background */
    .left-panel {
      min-height: 100vh; /* Set the minimum height to 100% of the viewport height */
    }
    
    @media (max-width: 700px){
    .left-panel {
      min-height: 50vh; /* Set the minimum height to 100% of the viewport height */
    }
    }
    
  </style>
</head>

<body onload="currentTime()" >

	<jsp:include page="../../templates/header.jsp" />
	<div class="container-fluid">
		<div class="row">
			<!-- Left Panel -->
			<div class="col-md-3 bg-light p-3 left-panel">
				<h4>Filtros</h4>
				<div class="form-group">
				
					<form action="" method="get">
						<label for="selectOptions">Seleccione una opción:</label>
						<select class="form-control" id="selectOptions" name="selectControl">
							<option value="option1">-</option>
							<option value="option2">Departamento</option>
							<option value="option3">Categoria</option>
						</select>
						<% 
							String redirectTo = (String) request.getAttribute("redirectTo");
						%>
						
						<input type="text" id="redirectTo" name="redirectTo" value="<%= redirectTo %>" style="display: none;">
						
						
						<br>
						<button type="submit" class="btn btn-primary">Buscar actividad</button>
					
				</div>
					
		<div id="comboBoxContainer">
					<!-- Second ComboBox (Initially Hidden) -->
					<div class="form-group" id="department" style="display: none;">
						<label for="selectOptions2">Departamentos:</label>
						<select class="form-control" id="selectOptions2" name="department">
					  		<% for(DtDepartmentWS department : departments){%>
             					<option value=<%=department.getId()%>> <%= department.getName() %></option>
             				<%}%>
						</select>
					</div>
					<!-- Third ComboBox (Initially Hidden) -->
					<div class="form-group" id="categories" style="display: none;">
					
						<label for="selectOptions3">Categorias:</label>
						<select id="selectOptions3" class="form-control" name="categories">
            				<% for(DtCategoryWS category : categories){%>
             					<option value=<%=category.getId()%>> <%= category.getName() %></option>
             				<%}%>
						</select>
						</form>
						
					</div>
					<%if(userType != null){ 
							switch (redirectTo) { 
								 case "activity":
								 	if(userType.equals("provider")){%>
								 	<br>
										<a href="<%= request.getContextPath() %>/registerActivity" method="get">
											<button class="btn btn-primary" >Dar de alta Actividad</button>
										</a>
										<br>
									<%}
									break;
									
								case "departure":
									if(userType.equals("provider")){%>
									<br>
										<a href="<%= request.getContextPath() %>/registerDeparture" method="get">
											<button class="btn btn-primary" >Dar de alta Salida Turística</button>
										</a>
										<br>
									<%}
									break;
							 }%>
						<% } %>
				</div>
				
			</div>
			<!-- Center Area -->
			<div class="col-md-9">
				<div class="row">
					<!-- Small Boxes -->
						<% for(DtTouristicActivityWS activity : activitiesToPrint){%>
							<div class="col-md-3">
								<div class="card" style="align-items: center; padding: 0.3em; background-color: aliceblue; margin-bottom: 1em;">
									<%if(activity.getImage() != null){ %>
									<img id="showedImage" src="<%=activityImages.get(activity.getId())%>" class="card-img-top" style="border-radius: 5%; margin: auto" alt="No hay imagen disponible">
									<% }else{%>
									<img id="showedImage" src="assets/images/noImage.jpg" class="card-img-top" style="border-radius: 5%; margin: auto" alt="No hay imagen disponible">
									<% }%>
									<div class="card-body">
									<%
										
							
										if(redirectTo.equalsIgnoreCase("activity")){%>
										<a href="<%= request.getContextPath() %>/showActivity?activityId=<%= activity.getId()%> ">
											<h5 class="card-title"> <%= activity.getName() %> </h5>
										</a>
										<%}else if(redirectTo.equalsIgnoreCase("departure")){ %>
										<a href="<%= request.getContextPath() %>/consultdeparture?activityId=<%= activity.getId()%>">
											<h5 class="card-title"> <%= activity.getName() %> </h5>
										</a>
										<%} %>
										<p class="card-text"> <%= activity.getDescription() %></p>
										
										<%if("tourist".equals(userType)){
											
											List<DtTouristicActivityWS> favActivities = (List<DtTouristicActivityWS>) session.getAttribute("favActivities");
											boolean isFavorite = false;
											
											for (DtTouristicActivityWS favActivity : favActivities) {
										    	if (favActivity.getId() == activity.getId()) {
										        	isFavorite = true;
										            break;
										    	}
											}	
										    if(isFavorite){%>
										    	<img id="FavouriteImage" src="assets/images/star.ico" style="height: 24px; margin: auto" alt="No hay imagen disponible">
											<%}
										}%>
									</div>
								</div>
							</div>
						<%}%>
					<!-- Add more small boxes as needed -->

				</div>
			</div>
		</div>
	</div>
	    <br>
        <br>
        <br>
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