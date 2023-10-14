
document.write(`
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">            
        <ul class="nav justify-content-center">
            <li class="nav-item">
                <a class="nav-link" href=" ${contextPath}/login ">
                    <button class="btn btn-outline-success">
                        &nbsp;Iniciar Sesión&nbsp;
                    </button>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="pages/home/index.html">
                    <button class="btn btn-outline-success">
                        &nbsp;Página Principal&nbsp;
                    </button>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="pages/activities/consultActivity.jsp">
                    <button class="btn btn-outline-success">
                        &nbsp;Actividades&nbsp;
                    </button>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../../pages/bundles/consultBundle.html">
                    <button class="btn btn-outline-success">
                        &nbsp;Paquetes&nbsp;
                    </button>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../../pages/departures/consultDeparture.html">
                    <button class="btn btn-outline-success">
                        &nbsp;Salidas Turísticas&nbsp;
                    </button>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../../pages/users/consultUser.html">
                    <button class="btn btn-outline-success">
                        Usuarios
                    </button>
                </a>
            </li>
        </ul>
    </div>
</nav>
`);