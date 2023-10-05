document.write(`
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="media">
    <div class="media-body">
        <div class="mt-0 mb-1">
            <img class="ml-3" src="../../assets/images/generic_user.png" alt="Usuario Generico"
                width="48px">
            <span>Nombre del Usuario</span>
        </div>
    </div>
</div>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav me-right col-md-4 offset-md-4 mb-2">
        <li class="nav-item">
            <a class="nav-link" href="../../pages/home/index.html">&nbsp;Página Principal&nbsp;</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../../pages/activities/consultActivity.html">&nbsp;Consultar Actividades&nbsp;</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../../pages/bundles/consultBundle.html">&nbsp;Consultar Paquetes&nbsp;</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../../pages/departures/consultDeparture.html">&nbsp;Salidas Turísticas&nbsp;</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../../pages/users/consultUser.html">Consultar Usuarios</a>
        </li>
    </ul>
</div>
</nav>
`);