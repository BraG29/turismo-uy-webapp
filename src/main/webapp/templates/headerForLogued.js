
document.write(`
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<ul class="nav justify-content-center">
		 <li class="nav-item" > 
			 <div class="nav nav-item justify-content-center" style="margin: auto;  margin-left: 1em; margin-right: 1em;">
					<a href="${contextPath}">
				       	<img class="ml-auto" src="assets/images/logoTurismoUY.png" alt="Usuario Generico" width="150px">
				    </a>
			  	</div>
			</li>
		</ul>
		
    <div class="media">
        <div class="media-body">
            <div class="mt-0 mb-1">
                <img class="ml-3" src="${userImage}" alt="Usuario Generico"
                    width="48px">
                <a href="${contextPath}/profile?id=${userId}"> <span> ${userName} </span> </a>
            </div>
        </div>
    </div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">            
        <ul class="nav justify-content-center">
	        <li class="nav-item" style="margin-left:1em;" > 
		       
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
    </div>
</nav>
`);