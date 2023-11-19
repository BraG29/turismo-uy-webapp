<%@page import="java.util.ArrayList"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicBundleWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtTouristicActivityWS"%>
<%@page import="uy.turismo.webapp.ws.controller.DtBaseEntityWS"%>
<%@page import="java.util.List"%>
<%@page import="uy.turismo.webapp.ws.controller.PublisherService"%>
<%@page import="uy.turismo.webapp.ws.controller.Publisher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="assets/styles/main.css">
    <script src="assets/scripts/jquery3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
    <script src="assets/scripts/clock.js" type="text/javascript"></script>
    <link rel="icon" href="assets/images/star.ico" type="image/png">


	<meta charset="UTF-8">
	
	<title>Resultados de Busqueda</title>
</head>

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

<body>




</body>
</html>