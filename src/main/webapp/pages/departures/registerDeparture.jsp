<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

            <form action="registerDeparture" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
                <div class="input-group">
                    <label class="input-group-text" for="nombre"> Nombre: </label>
                    <input id="username" type="text" name="nombre" class="form-control" placeholder="Ej: Recorrida rambla" required>
                </div>
                <br>
                <div class="input-group">
                    <label class="input-group-text" for="cuposmaximos"> Cupos máximos de personas: </label>
                    <input id="maxTourist" type="number" name="cuposmaximos" class="form-control" min="1" step="1" placeholder="Ej: 20" required>
                </div>
                <br>
                <div class="input-group">
                    <label class="input-group-text" for="horariosalida">Horario de salida: </label>
                    <input id="departureSchedule" type="datetime-local" name="horariosalida" class="form-control" placeholder="Ej: 10/10/2023 - 15:00 PM" required>
                </div>
                <br>
                <div class="input-group">
                    <label class="input-group-text" for="lugar">Lugar: </label>
                    <input id="place" type="text" name="lugar" class="form-control" placeholder="Ej: Club deportivo union" required>
                </div>
                <br>
                <div class="input-group">
                    <label class="input-group-text" for="fechacreacion">Fecha de creación:</label>
                    <input id="uploadDate" type="date" name="fechacreacion" class="form-control" placeholder="Ej: 10/10/2023" required>
                </div>
                <br>
                <div class="input-group">
                    <label class="input-group-text" for="imagen">Selecciona una imagen:</label>
                    <input type="file" accept="image/*" id="imagen" name="imagen">
                </div>
                <br>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Registrar Salida</button>
            </form>
        </main>
        <jsp:include page="../../templates/footer.jsp" />
    </body>

    </html>