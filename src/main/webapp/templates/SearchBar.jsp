<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
 	<link rel="stylesheet" href="assets/styles/main.css">
    <script src="assets/scripts/jquery3.5.1.min.js"></script>
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" 
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" 
		crossorigin="anonymous"></script>
		
	<link rel="stylesheet" 
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" 
		crossorigin="anonymous">
</head>


<body>
		<div class="input-group">
		  <input id="searchText" name="searchText" type="text" class="form-control" 
		  placeholder="Actividad o Paquete"/>
		  <!-- <div class="input-group-append"> -->
		    <button class="btn btn-outline-success" onclick="search()">Buscar</button>
		  <!-- </div> -->
		</div> 
</body>

<script>
	function search(){
		var searchText = document.getElementById("searchText").value;
		var contextPath = '<%= request.getContextPath() %>';
		
		// Construye la URL con los parámetros.
		var url = 
			contextPath + "/searchBar?searchText=" + searchText;
		
		// Realiza la solicitud GET.
		console.log("prueba de que estoy llegando a SearchBar");
		console.log(url);
		fetch(url);
	}
</script>