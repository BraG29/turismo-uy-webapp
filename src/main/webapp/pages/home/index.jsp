<%@page import="uy.turismo.servidorcentral.logic.datatypes.DtUser"%>
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
    <script src="assets/scripts/clock.js" type="text/javascript"></script>
    <link rel="icon" href="assets/images/star.ico" type="image/png">
    <title>Turismo.UY</title>
</head>


<body onload="currentTime()">
    <div class="">
    
		<jsp:include page="../../templates/header.jsp" />
		
        <h1> Página Principal</h1>
        <div class="dropdown">
            <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                Lista de departamentos
            </button>
            <ul class="dropdown-menu">
                <li class="list-group-item">Artigas</li>
                <li class="list-group-item">Canelones</li>
                <li class="list-group-item">Cerro Largo</li>
                <li class="list-group-item">Colonia</li>
                <li class="list-group-item">Durazno</li>
                <li class="list-group-item">Flores</li>
                <li class="list-group-item">Florida</li>
                <li class="list-group-item">Lavalleja</li>
                <li class="list-group-item">Maldonado</li>
                <li class="list-group-item">Montevideo</li>
                <li class="list-group-item">Paysandú</li>
                <li class="list-group-item">Río Negro</li>
                <li class="list-group-item">Rivera</li>
                <li class="list-group-item">Rocha</li>
                <li class="list-group-item">Salto</li>
                <li class="list-group-item">San José</li>
                <li class="list-group-item">Soriano</li>
                <li class="list-group-item">Tacuarembó</li>
                <li class="list-group-item">Treinta y Tres</li>
            </ul>
        </div>
        

        <script src="templates/footer.js"></script>
    </div>
</body>

</html>