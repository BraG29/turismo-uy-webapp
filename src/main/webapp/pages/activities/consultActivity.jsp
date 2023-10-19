<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtDepartment"%>
<%@page import="uy.turismo.webapp.functions.Functions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uy.turismos.servidorcentral.logic.enums.ActivityState"%>
<%@page import="uy.turismo.servidorcentral.logic.controller.ControllerFactory"%>
<%@page import="uy.turismo.servidorcentral.logic.controller.IController"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtCategory"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtProvider"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%
	List<DtTouristicActivity> activitiesStated = (List<DtTouristicActivity>) session.getAttribute("activityStated");
	List<DtTouristicActivity> activitiesToPrint = new ArrayList<DtTouristicActivity>();

	Map<Long, String> activityImages = (Map<Long, String>) session.getAttribute("activityImages");
	
	List<DtCategory> categories = (List<DtCategory>) session.getAttribute("categories");
	
	List<DtDepartment> departments = (List<DtDepartment>) session.getAttribute("departments");
	
	String pruebaControl = (String) request.getAttribute("control");
	if(pruebaControl != null){
		switch (pruebaControl) {
		
		case "department":{
			Long idDepartment = Long.parseLong(request.getParameter("department"));
			HashMap<Long, List<DtTouristicActivity>> filteredByDepartment = (HashMap<Long, List<DtTouristicActivity>>) session.getAttribute("filteredByDepartment");
			activitiesToPrint = filteredByDepartment.get(idDepartment); 
			break;}
			
		case "category":{
			Long idCategory = Long.parseLong(request.getParameter("categories"));
			HashMap<Long, List<DtTouristicActivity>> filteredByCategory = (HashMap<Long, List<DtTouristicActivity>>) session.getAttribute("filteredByCategory");
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
					<form action="" method="get">
						<label for="selectOptions">Select an Option:</label>
						<select class="form-control" id="selectOptions" name="selectControl">
							<option value="option1">-</option>
							<option value="option2">Departamento</option>
							<option value="option3">Categoria</option>
						</select>
						<a href="<%= request.getContextPath() %>/registerActivity" method="get"> Hacia registrar Actividad</a>
						<button type="submit" class="btn btn-primary">Buscar actividad</button>
					
				</div>
					
		<div id="comboBoxContainer">
					<!-- Second ComboBox (Initially Hidden) -->
					<div class="form-group" id="department" style="display: none;">
						<label for="selectOptions2">Departamentos:</label>
						<select class="form-control" id="selectOptions2" name="department">
					  		<% for(DtDepartment department : departments){%>
             					<option value=<%=department.getId()%>> <%= department.getName() %></option>
             				<%}%>
						</select>
					</div>
					<!-- Third ComboBox (Initially Hidden) -->
					<div class="form-group" id="categories" style="display: none;">
					
						<label for="selectOptions3">Categorias:</label>
						<select id="selectOptions3" class="form-control" name="categories">
            				<% for(DtCategory category : categories){%>
             					<option value=<%=category.getId()%>> <%= category.getName() %></option>
             				<%}%>
						</select>
						</form>
						
					</div>
				</div>
			</div>
			<!-- Center Area -->
			<div class="col-md-9">
				<div class="row">
					<!-- Small Boxes -->
						<% for(DtTouristicActivity activity : activitiesToPrint){%>
							<div class="col-md-3">
								<div class="card" style="align-items: center;">
									<img src="<%=activityImages.get(activity.getId())%>" class="card-img-top" style="width:15em; margin-top: 1em; margin-left: 3%; border-radius: 5%; ">
									<div class="card-body">
										<a href="<%= request.getContextPath() %>/showActivity?activityId="<%= activity.getId()%> >
											<h5 class="card-title"> <%= activity.getName() %> </h5>
										</a>
										<p class="card-text"> <%= activity.getDescription() %></p>
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