<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Centered Card with Bootstrap</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <style>
     	.custom-list-group {
            background-color: #c7ecee; /* Slight sky-blue background color */
            padding: 0; /* Remove default padding */
        }
        .list-group-item {
        	background-color: #c7ecee;
            padding: 1px 10px; /* Adjust spacing between list items */
        }
        .list-item-pink {
        	background-color: #ffc0cb;
            padding: 1px 10px; /* Adjust spacing between list items */
        }
        .list-item-yellow {
    		background-color: #ffffcc; /* Slight yellow background color */
		}
        
        p{
    		line-height: 0.8; /* You can adjust the value as needed for tighter or looser spacing */
		}
    </style>
</head>
<body>
    <div class="container mt-5">
     
        <div class="row">
            <div class="col-md-8 offset-md-2" style="margin-left: -28%;">
                <div class="card">
                	<h5 class="card-title">Card Title</h5>
                    <img src="assets/images/activity/Quemar el arbol aureo.png" class="card-img-top" alt="Image" style="width:25em;  border-radius: 5%; margin-left: 3%;" >
                    <div class="card-body">
                        <p class="card-text">Descripción: </p>
                        <p class="card-text">Departamento: </p>
                        <p class="card-text">Ciudad: </p>
                        <p class="card-text">Fecha de alta: </p>
                        <p class="card-text">Duración:  HRs</p>
                        <p class="card-text">Costo por turista: </p> 
                        <p class="card-text">Proveedor:</p>
                    </div>
                </div>
            </div>
            <div  class="col-md-4">
            	<h5 class="card-text">Paquetes: </h5>
            	<ul class="list-group custom-list-group">
            		<li class="list-group-item">Item 1</li>
                    <li class="list-group-item">Item 2</li>
                    <li class="list-group-item">Item 3</li>
                </ul>
                <br>
                <br>
                
                <h5 class="card-text">Salidas: </h5>
            	<ul class="list-group custom-list-group">
            		<li class="list-group-item list-item-pink">Item 1</li>
                    <li class="list-group-item list-item-pink">Item 2</li>
                    <li class="list-group-item list-item-pink">Item 3</li>
                </ul>
                <br>
                <br>
                
                <h5 class="card-text">Categorias: </h5>
            	<ul class="list-group custom-list-group">
            		<li class="list-group-item list-item-yellow">Item 1</li>
                    <li class="list-group-item list-item-yellow">Item 2</li>
                    <li class="list-group-item list-item-yellow">Item 3</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Add Bootstrap JS and jQuery scripts (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

