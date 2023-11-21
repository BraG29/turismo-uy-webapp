<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="uy.turismo.webapp.functions.Functions"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicBundleWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicActivityWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtBaseEntityWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtCategoryWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtDepartmentWS"%>
<%@page import="uy.turismo.webapp.ws.controller.PublisherService"%>
<%@page import="uy.turismo.webapp.ws.controller.Publisher"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%
        PublisherService service = new PublisherService();
        Publisher controller = service.getPublisherPort();

        String searchText = (String) request.getAttribute("searchText");

        List<DtBaseEntityWS> results = controller.filterByString(searchText).getItem();

        List<DtTouristicActivityWS> activities = new ArrayList<DtTouristicActivityWS>();
        List<DtTouristicBundleWS> bundles = new ArrayList<DtTouristicBundleWS>();
        Map<Long, String> activityImages = new HashMap<Long, String>();
        Map<Long, String> bundleImages = new HashMap<Long, String>();

        for (DtBaseEntityWS result : results) {

            if (result instanceof DtTouristicActivityWS) {

                DtTouristicActivityWS resultActivity = (DtTouristicActivityWS) result;
                activities.add(resultActivity);

                BufferedImage activityImage = Functions.convertArrayToBI(resultActivity.getImage());

                String activityImagePath = Functions.saveImage(
                        activityImage,
                        resultActivity.getName(),
                        getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
                        "activity/");
                activityImages.put(resultActivity.getId(), activityImagePath);
            }

            if (result instanceof DtTouristicBundleWS) {

                bundles.add((DtTouristicBundleWS) result);

                DtTouristicBundleWS resultBundle = (DtTouristicBundleWS) result;

                BufferedImage bundleImage = Functions.convertArrayToBI(resultBundle.getImage());

                String bundleImagePath = Functions.saveImage(
                        bundleImage,
                        resultBundle.getName(),
                        getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
                        "bundle/");

                bundleImages.put(resultBundle.getId(), bundleImagePath);
            }
        }

        List<DtCategoryWS> categories = new ArrayList<DtCategoryWS>();
        List<DtDepartmentWS> departments = new ArrayList<DtDepartmentWS>();

        Map<Long, List<DtTouristicActivityWS>> filteredByDepartment = new HashMap<Long, List<DtTouristicActivityWS>>();
        Map<Long, List<DtTouristicActivityWS>> filteredByCategory = new HashMap<Long, List<DtTouristicActivityWS>>();

        for (DtTouristicActivityWS activity : activities) {

            Long departmentKey = activity.getDepartment().getId();

            if (!filteredByDepartment.containsKey(departmentKey)) {
                List<DtTouristicActivityWS> activityListDepartment = new ArrayList<DtTouristicActivityWS>();
                activityListDepartment.add(activity);

                filteredByDepartment.put(departmentKey, activityListDepartment);
                departments.add(activity.getDepartment());
            } else {
                ((List<DtTouristicActivityWS>) filteredByDepartment.get(departmentKey)).add(activity);
            }

            for (DtCategoryWS category : activity.getCategories()) {

                Long categoryKey = category.getId();

                if (!filteredByCategory.containsKey(categoryKey)) {
                    List<DtTouristicActivityWS> activityListCategory = new ArrayList<DtTouristicActivityWS>();

                    activityListCategory.add(activity);
                    filteredByCategory.put(categoryKey, activityListCategory);

                    categories.add(category);
                } else {
                    ((List<DtTouristicActivityWS>) filteredByCategory.get(categoryKey)).add(activity);
                }
            }
        }
    %>

    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="assets/styles/main.css">
    <script src="assets/scripts/jquery3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
            integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <script src="assets/scripts/clock.js" type="text/javascript"></script>
    <link rel="icon" href="assets/images/star.ico" type="image/png">

    <title> Resultado de busqueda</title>

    <style>
        .user-list {
            list-style: none;
            padding: 0;
        }

        .user-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .user-image {
            border-radius: 5%;
            margin: auto;
            width: 300px;
            height: 300px;
        }

        .user-nickname {
            font-weight: bold;
        }

        .user-info {
            display: flex;
            flex-direction: column;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .sea-lo-que-sea {

        }
    </style>

</head>

<jsp:include page="../../templates/header.jsp" />

<main class="container-fluid">
    <h2> Resultado de: "<%=searchText%>"</h2>

    <div style="width: 25%;">
        <span> Seleccione el departamento:</span>
        <select id="departmentCombobox" class="form-select" aria-label="Default select example" name="department"
                onchange="filterCards()">
            <option value="-1"> - Todas los departamentos - </option>
            <% for (DtDepartmentWS department : departments) { %>
                <option value="<%= department.getId() %>"><%= department.getName() %></option>
            <% } %>
        </select>
    </div>
    <br>
    <div style="width: 25%;">
        <span>Seleccione una categoria: </span>
        <select id="categoryCombobox" class="form-select" aria-label="Ej: Rocha" name="categoryId"
                onchange="filterCards()">
            <option value="-1"> - Todas las categorias - </option>
            <% for (DtCategoryWS category : categories) { %>
                <option value="<%= category.getId() %>"><%= category.getName() %></option>
            <% } %>
        </select>
    </div>
    <br>
    <div style="width: 25%;">
        <span> Ordenar:</span>
        <select id="orderCombobox" class="form-select" aria-label="Default select example" name="department"
                onchange="orderCards()">
            <option value="0">Alfabeticamente</option>
            <option value="1">Fecha</option>
        </select>
    </div>

    <!-- Cards will be dynamically added here based on selection -->
    <div class="row" id="cardContainer">
        <% for (DtTouristicActivityWS activity : activities) { %>
            <div class="card border-primary mb-3 user-item" style="max-width: 18rem; margin: 1em;padding: 0; height: fit-content;"
            <%List<Long> categoryIds = new ArrayList<Long>();
            for(DtCategoryWS category : activity.getCategories()){
            	categoryIds.add(category.getId());
            }%>
                 data-department-id="<%= activity.getDepartment().getId() %>"
                 data-category-ids="<%= categoryIds %>">
                <div class="card-header bg-primary text-light" style="width: 100%; text-align: center;">Actividad Turística
                </div>
                <img class="card-img-top" src="<%= activityImages.get(activity.getId()) %>" alt="Card image cap">
                <div class="card-body text-dark">
                    <h5 class="card-title"><%= activity.getName() %></h5>
                    <p class="card-text"> <%= activity.getDescription() %></p>
                    <p class="card-text"> <%= activity.getUploadDate() %></p>
                    <p class="card-department" data-department-id="<%= activity.getDepartment().getId() %>"></p>
                    <p class="card-categories" data-category-ids="<%= categoryIds %>"></p>
                    <p class="card-date" data-date="<%= activity.getUploadDate() %>"></p>
                </div>
            </div>
        <% } %>

        <% for (DtTouristicBundleWS bundle : bundles) { %>
            <div class="card border-success mb-3 user-item"
                 style="max-width: 18rem; margin: 1em;padding: 0; height: fit-content;"
                <%List<Long> categoryIds = new ArrayList<Long>();
	            for(DtCategoryWS category : bundle.getCategories()){
	            	categoryIds.add(category.getId());
	            } %>
                 data-category-ids="<%= categoryIds %>">
                <div class="card-header bg-success text-light" style="width: 100%; text-align: center;">Paquete Turístico
                </div>
                <img class="card-img-top" src="<%= bundleImages.get(bundle.getId()) %>" alt="Card image cap">
                <div class="card-body text-dark">
                    <h5 class="card-title"><%= bundle.getName() %></h5>
                    <p class="card-text"> <%= bundle.getUploadDate() %></p>
                    <p class="card-categories" data-category-ids="<%= categoryIds %>"></p>
                    <p class="card-date" data-date="<%= bundle.getUploadDate() %>"></p>
                </div>
            </div>
        <% } %>
               <br>
		        <br>
		        <br>
		        <br>
		        <br>
		        <br>
    </div>
</main>

<jsp:include page="../../templates/footer.jsp" />

<!-- Add this script at the end of your HTML, after including jQuery -->
<script src="assets/scripts/jquery3.5.1.min.js"></script>
<script>
    $(document).ready(function () {
        const department = document.getElementById("departmentCombobox");
        const category = document.getElementById("categoryCombobox");
        const orderCombobox = document.getElementById("orderCombobox");

        var defaultIndex = -1;

        function filterCards() {
            $(".user-item").each(function () {
                var selectedDepartment = department.value;
                var selectedCategory = category.value;
                var activityDepartment = $(this).data("department-id");
                var activityCategories = $(this).data("category-ids");
                var selectedCategoryId = selectedCategory !== defaultIndex ? parseInt(selectedCategory) : defaultIndex;
                if (
                    (selectedDepartment == activityDepartment || selectedDepartment == defaultIndex) &&
                    (selectedCategory == defaultIndex || activityCategories.includes(selectedCategoryId))
                ) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }

        function orderCards() {
            var cards = $(".user-item").toArray();

            cards.sort(function (a, b) {
                var aText, bText;

                if (orderCombobox.value === "0") {
                    // Order alphabetically by name
                    aText = $(a).find(".card-title").text().toLowerCase();
                    bText = $(b).find(".card-title").text().toLowerCase();
                } else {
                    // Order by date (assuming the date is a valid string)
                    aText = $(a).find(".card-date").data("date") || "";
                    bText = $(b).find(".card-date").data("date") || "";
                }

                return aText.localeCompare(bText);
            });

            $("#cardContainer").empty().append(cards);
        }

        // Initial filtering and ordering when the page loads
        filterCards();
        orderCards();

        // Event listeners for comboboxes
        department.addEventListener("change", filterCards);
        category.addEventListener("change", filterCards);
        orderCombobox.addEventListener("change", orderCards);
    });
</script>
</body>
</html>
