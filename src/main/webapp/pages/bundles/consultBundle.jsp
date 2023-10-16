<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <jsp:include page="../../templates/header.jsp"/>
    <h1> Consultar Paquetes</h1>
    <div class="row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Disfrutar Rocha</h5>
                    <p class="card-text">Actividades para hacer en familia y disfrutar arte y gastronomÃ­a</p>
                    <a href="#" class="btn btn-primary">Ver mÃ¡s</a>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Un dÃ­a en Colonia</h5>
                    <p class="card-text">Paseos por el casco histÃ³rico y se puede terminar con Almuerzo en la Plaza de Toros</p>
                    <a href="#" class="btn btn-primary">Ver mÃ¡s</a>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Valle Del Lunarejo</h5>
                    <p class="card-text">Visite un Ã¡rea protegida con un paisaje natural hermoso</p>
                    <a href="#" class="btn btn-primary">Ver mÃ¡s</a>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../../templates/footer.jsp" />
</body>

</html>