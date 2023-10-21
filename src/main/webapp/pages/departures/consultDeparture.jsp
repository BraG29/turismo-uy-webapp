<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtDepartment"%>
<%@page import="uy.turismo.webapp.functions.Functions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uy.turismos.servidorcentral.logic.enums.ActivityState"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtCategory"%>
<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtProvider"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>


<%
String userType = (String) session.getAttribute("userType");
List<DtTouristicDeparture> departuresToPrint = new ArrayList<DtTouristicDeparture>();
Map<Long, String> activityImages = (Map<Long, String>) session.getAttribute("activityImages");	
List<DtDepartment> departments = (List<DtDepartment>) session.getAttribute("departments");	
List<DtCategory> categories = (List<DtCategory>) session.getAttribute("categories");	
List<DtTouristicActivity> activities = (List<DtTouristicActivity>) session.getAttribute("activities");
String pruebaControl = (String) request.getAttribute("control");
if(pruebaControl != null){
    switch (pruebaControl) {		
        case "department":{
            Long idDepartment = Long.parseLong(request.getParameter("department"));
            HashMap<Long, List<DtTouristicActivity>> filteredByDepartment = (HashMap<Long, List<DtTouristicActivity>>) session.getAttribute("filteredByDepartment");
            departuresToPrint = filteredByDepartment.get(idDepartment); 
            break;
        }			
        case "category":{
            Long idCategory = Long.parseLong(request.getParameter("categories"));
            HashMap<Long, List<DtTouristicActivity>> filteredByCategory = (HashMap<Long, List<DtTouristicActivity>>) session.getAttribute("filteredByCategory");
            departuresToPrint = filteredByCategory.get(idCategory); 
            break;
        }
        case "activity":{
            Long idActivity = Long.parseLong(request.getParameter("activities"));
            HashMap<Long, List<DtTouristicActivity>> filteredByActivity = (HashMap<Long, List<DtTouristicActivity>>) session.getAttribute("filteredByActivity");
            departuresToPrint = filteredByActivity.get(idActivity); 
            break;
        }
        default:
            System.out.println("No hay Salidas turísticas");
            break;
    }
}
%>

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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body onload="currentTime()">
    <jsp:include page="../../templates/header.jsp"/>
    <h1>Página de consultas de las Salidas turísticas</h1>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 bg-light p-3 left-panel">
				<h4>Opciones de filtrado</h4>
				<div class="form-group">
					<form action="" method="get">
						<label for="selectOptions">Seleccione una opción:</label>
						<select class="form-control" id="selectOptions" name="selectControl">
							<option value="option1">-</option>
							<option value="option2">Departamento</option>
							<option value="option3">Categoria</option>
							<option value="option4">Actividad Turística</option>
						</select>
						<%if(userType != null){
							if(userType.equals("provider")){ %>
								<a href="<%= request.getContextPath() %>/registerDeparture" method="get"> Registrar una salida turística</a>
							<%}
						}%>
						<button type="submit" class="btn btn-primary">Buscar Salida</button>
				</div>
					
		        <div id="comboBoxContainer">
					<div class="form-group" id="department" style="display: none;">
						<label for="selectOptions2">Departamentos:</label>
						<select class="form-control" id="selectOptions2" name="department">
					  		<% for(DtDepartment department : departments){%>
             					<option value=<%=department.getId()%>> <%= department.getName() %></option>
             				<%}%>
						</select>
					</div>
					<div class="form-group" id="categories" style="display: none;">					
						<label for="selectOptions3">Categorias:</label>
						<select id="selectOptions3" class="form-control" name="categories">
            				<% for(DtCategory category : categories){%>
             					<option value=<%=category.getId()%>> <%= category.getName() %></option>
             				<%}%>
						</select>
                    <div class="form-group" id="activities" style="display: none;">					
						<label for="selectOptions4">Actividades Turísticas:</label>
						<select id="selectOptions4" class="form-control" name="activities">
            				<% for(DtTouristicActivity activity : activities){%>
             					<option value=<%=activity.getId()%>> <%= category.getName() %></option>
             				<%}%>
						</select>
                    </form>
                </div>
				</div>
			</div>

			<div class="col-md-9">
				<div class="row">
                    <% for(DtTouristicDeparture departure : departuresToPrint){ %>
                        <div class="col-md-3">
                            <div class="card" style="align-items: center;">
                                <img src="<%=departureImages.get(departure.getId())%>" class="card-img-top" style="width:15em; margin-top: 1em; margin-left: 3%; border-radius: 5%; ">
                                <div class="card-body">
                                    <a href="<%= request.getContextPath() %>/showDeparture?departureId=<%= departure.getId()%> ">
                                        <h5 class="card-title"> <%= departure.getName() %> </h5>
                                    </a>
                                    <p class="card-text"> <%= departure.getDescription() %></p>
                                </div>
                            </div>
                        </div>
                        <%if(userType != null){
							if(userType.equals("turist")){ %>
								<a href="<%= request.getContextPath() %>/inscriptionDeparture?departureId=<%= departure.getId()%> "> Registrar una salida turística</a>
							<%}
						}%>
                    <%}%>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../templates/footer.jsp" />

	<script>
		const selectOptions = document.getElementById("selectOptions");
		const department = document.getElementById("department");
		const categories = document.getElementById("categories");
		const activities = document.getElementById("activities");

		selectOptions.addEventListener("change", function () {
			const selectedOption = selectOptions.value;

			if (selectedOption === "option1") {
				department.style.display = "none";
				categories.style.display = "none";
				activities.style.display = "none";
			} else if (selectedOption === "option2") {
				department.style.display = "block";
				categories.style.display = "none";
				activities.style.display = "none";
			} else if (selectedOption === "option3") {
				department.style.display = "none";
				categories.style.display = "block";
				activities.style.display = "none";
			} else if (selectedOption === "option4") {
				department.style.display = "none";
				categories.style.display = "block"; 
				activities.style.display = "none";
			}
		});
	</script>
</body>

</html>