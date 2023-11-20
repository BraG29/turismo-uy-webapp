<%@page import="java.util.ArrayList"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicBundleWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicActivityWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtBaseEntityWS"%>
<%@page import="java.util.List"%>
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
	
	
	for(DtBaseEntityWS result : results){
		if(result instanceof DtTouristicActivityWS){
			activities.add((DtTouristicActivityWS) result);
		}
		if(result instanceof DtTouristicBundleWS){
			bundles.add((DtTouristicBundleWS) result);
			
		}
	}
	
	System.out.println();
	

%>
	<!-- Add Bootstrap CSS link -->
	<link rel="stylesheet" href="assets/styles/main.css">
	<script src="assets/scripts/jquery3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="assets/scripts/clock.js" type="text/javascript"></script>
	<link rel="icon" href="assets/images/star.ico" type="image/png">

<title> Resultado de busqueda </title>

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
        
        .sea-lo-que-sea{
        
        }
</style>

</head>



<body onload="currentTime()">

<jsp:include page="../../templates/header.jsp" />

<main class="container-fluid">
	<div class="row">
	
	<h1> Resultado de: "<%=searchText%>"</h1>			
				
				
		
		<!-- <div class="card-deck">
	  <div class="card">
	    <img class="card-img-top" src="..." alt="Card image cap">
	    <div class="card-body">
	      <h5 class="card-title">Card title</h5>
	      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	    </div>
	    <div class="card-footer">
	      <small class="text-muted">Last updated 3 mins ago</small>
	    </div>
	  </div>
	  <div class="card">
	    <img class="card-img-top" src="..." alt="Card image cap">
	    <div class="card-body">
	      <h5 class="card-title">Card title</h5>
	      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
	    </div>
	    <div class="card-footer">
	      <small class="text-muted">Last updated 3 mins ago</small>
	    </div>
	  </div>
	  <div class="card">
	    <img class="card-img-top" src="..." alt="Card image cap">
	    <div class="card-body">
	      <h5 class="card-title">Card title</h5>
	      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
	    </div>
	    <div class="card-footer">
	      <small class="text-muted">Last updated 3 mins ago</small>
	    </div>
	  </div>
	</div> -->
	
	
	 
		<div class="card border-dark mb-3" style="max-width: 18rem;">
	  <div class="card-header">Header</div>
	  <div class="card-body text-dark">
	    <h5 class="card-title">Dark card title</h5>
	    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	  </div>
	</div>
	 
	
</main>


<jsp:include page="../../templates/footer.jsp" />



</body>
</html>

