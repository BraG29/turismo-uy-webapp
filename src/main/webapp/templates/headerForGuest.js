
document.write(`
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">            
        <ul class="nav justify-content-center">
         <li class="nav-item" style="margin: auto; margin-left: 1em;" > 
		       	<a href="${contextPath}">
		        	<img class="ml-auto" src="assets/images/logoTurismoUY.png" alt="Usuario Generico" width="150px">
		       </a>
	        </li>
            <li class="nav-item">
                <a class="nav-link" href=" ${contextPath}/login ">
                    <button class="btn btn-outline-success">
                        &nbsp;Iniciar Sesión&nbsp;
                    </button>
                </a>
            </li>

            </li>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/consultActivity?redirectTo=activity">
                    <button class="btn btn-outline-success">
                        &nbsp;Actividades&nbsp;
                    </button>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/bundleList">
                    <button class="btn btn-outline-success">
                        &nbsp;Paquetes&nbsp;
                    </button>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/consultActivity?redirectTo=departure">
                    <button class="btn btn-outline-success">
                        &nbsp;Salidas Turísticas&nbsp;
                    </button>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/userList">
                    <button class="btn btn-outline-success">
                        &nbsp;Usuarios&nbsp;
                    </button>
                </a>
            </li>
        </ul>
    </div>
</nav>
`);