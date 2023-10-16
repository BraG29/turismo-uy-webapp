<!--
%@ // page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
%@ // page import="java.util.List"%>
%@ // page import="uy.turismo.servidorcentral.logic.datatypes.DtDepartment"%>
%@ // page import="uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity"%>
%@ // page import="uy.turismo.servidorcentral.logic.datatypes.DtTouristicDeparture"%>
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
</head>

<body onload="currentTime()">
    <main class="form-signin w-50 m-auto container-fluid">
        <jsp:include page="../../templates/header.jsp" />
        <h1> Registrar salida</h1>
        <!--departamento
        “Confirmada”
        nombre de la salida
        fecha/hora/lugar
        cantidad máxima
        imagen.
        fecha actual.-->
        
        
        <!-- 
        
        <form action="getActivityForDeparture" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
            <div class="input-group">
                <label class="input-group-text" for="department"> Departamento</label>
                <select id="department" class="form-select" aria-label="Default select example" name="department">
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
            <button class="btn btn-lg btn-success" type="submit">Buscar en el Departamento</button>
        </form>
        <br>
        <hr>
        <form action="registerDeparture" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
            <div class="form-check">
                % //List<?> varActConfirmadas = (List<?>) request.getAttribute("actividadesAsociadas"); %>
                % //for ( Object index: varActConfirmadas ) { %>

                    <script type="text/javascript">
                        var myObject = %= //the string output by the JSON library %>;
                    </script>

                 // Esto de actividades/actividad tiene que ir a alguna parte para rescatar el nombre
                 // Luego hay que usar la variable ahí abajo en el label
                 // Luego esa se utiliza en el registerDeparture como un valor simple de String
                 // Ver como popular la lista 
                 // Ver como llegar hasta el registro con los datos que tenemos en este form
                 // Hay que acordarse que estas son las actividades confirmadas en un departamento
                 // Primero se lista, luego podemos hacer las confirmadas

                    %//String laActividad = request.getContextPath()%>/actividades?actividad=%=//((DtTouristicActivity)index).getNombre()%>
                    <input class="form-check-input" type="radio" name="nameActivity" id="nameActivity" value="%=//laActividad %>">
                    <label class="form-check-label" for="nameActivity">
                        %=//laActividad %>
                    </label>
                %// } %>
            </div>
            <br>
            <div class="input-group">
                <label class="input-group-text" for="nameDeparture"> Nombre de la Salida Turística: </label>
                <input id="username" type="text" name="nameDeparture" class="form-control" placeholder="Ej: Recorrida rambla" required>
            </div>
            <br>
            <div class="input-group">
                <label class="input-group-text" for="startingDate">Fecha que comienza: </label>
                <input id="departureSchedule" type="date" name="startingDate" class="form-control" placeholder="Ej: 10/10/2023 - 15:00 PM" required>
            </div>
            <br>
            <div class="input-group">
                <label class="input-group-text" for="hour"> Hora de comiemzo: </label>
                <input id="hour" type="number" name="hour" class="form-control" min="0" step="1" max="23" placeholder="Ej: 15" required>
            </div>
            <br>
            <div class="input-group">
                <label class="input-group-text" for="maxTourists"> Cupos máximos de personas: </label>
                <input id="maxTourist" type="number" name="maxTourists" class="form-control" min="1" step="1" placeholder="Ej: 20" required>
            </div>
            <br>
            <div class="input-group">
                <label class="input-group-text" for="place">Lugar: </label>
                <input id="place" type="text" name="place" class="form-control" placeholder="Ej: Club deportivo union" required>
            </div>
            <br>
            <div class="input-group">
                <label class="input-group-text" for="image">Selecciona una imagen:</label>
                <input type="file" accept="image/*" id="image" name="image" required>
            </div>
            <br>
            <button class="w-100 btn btn-lg btn-primary" type="submit">Registrar Salida</button>
        </form>
    </main>
    <jsp:include page="../../templates/footer.jsp" />
</body>

</html>
 -->