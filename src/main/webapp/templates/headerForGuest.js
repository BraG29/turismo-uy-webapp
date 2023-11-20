if(userDevice == "mobile"){
	console.log("estoy en header guest mobile");
	document.write(`
	<style>
	@keyframes jello {
		11.1% {
			transform: none
		}
		22.2% {
			transform: skewX(-12.5deg) skewY(-12.5deg)
		}
		33.3% {
			transform: skewX(6.25deg) skewY(6.25deg)
		}
		44.4% {
			transform: skewX(-3.125deg) skewY(-3.125deg)
		}
		55.5% {
			transform: skewX(1.5625deg) skewY(1.5625deg)
		}
		66.6% {
			transform: skewX(-0.78125deg) skewY(-0.78125deg)
		}
		77.7% {
			transform: skewX(0.390625deg) skewY(0.390625deg)
		}
		88.8% {
			transform: skewX(-0.1953125deg) skewY(-0.1953125deg)
		}
		100% {
			transform: none
		}
		}

		.jello_logo {
		animation: jello 2.5s infinite;
		transform-origin: center;
		animation-delay: 1s;
		}

		.center_logo {
		display: inline-block;
		}

		.jello_logo {
		animation: jello 2.5s infinite;
		transform-origin: center;
		}

		.center_logo {
		display: inline-block;
		}
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light mobile">
	<ul class="nav justify-content-left" >
		 <li class="nav-item" > 
			 <div class="nav nav-item justify-content-left" style="margin: auto;  margin-left: 1em; margin-right: 1em;">
					<a href="${contextPath}">
				       	<img class="ml-auto center_logo jello_logo" src="assets/images/logoTurismoUY.png"  width="150px">
				    </a>
			  	</div>
			</li>
		</ul>
		
    
   
  <div class="container-fluid" style="justify-content: end;">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="width: min-content; float: right; display: block;">
      
		<li class="nav-item">
			<a class="nav-link" href=" ${contextPath}/login ">
				<button class="btn btn-outline-success">
					&nbsp;Iniciar Sesión&nbsp;
				</button>
			</a>
		</li>
      
        <li class="nav-item">
                <a class="nav-link" href="${contextPath}/consultActivity?redirectTo=activity">
                    <button class="btn btn-outline-success">
                        &nbsp;Actividades&nbsp;
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
            
       
      </ul>
    </div>
  </div>
</nav>

`);
}else{
	console.log("estoy en header guest normal");
	document.write(`
	<style>
	@keyframes jello {
		11.1% {
			transform: none
		}
		22.2% {
			transform: skewX(-12.5deg) skewY(-12.5deg)
		}
		33.3% {
			transform: skewX(6.25deg) skewY(6.25deg)
		}
		44.4% {
			transform: skewX(-3.125deg) skewY(-3.125deg)
		}
		55.5% {
			transform: skewX(1.5625deg) skewY(1.5625deg)
		}
		66.6% {
			transform: skewX(-0.78125deg) skewY(-0.78125deg)
		}
		77.7% {
			transform: skewX(0.390625deg) skewY(0.390625deg)
		}
		88.8% {
			transform: skewX(-0.1953125deg) skewY(-0.1953125deg)
		}
		100% {
			transform: none
		}
		}

		.jello_logo {
		animation: jello 2.5s infinite;
		transform-origin: center;
		animation-delay: 1s;
		}

		.center_logo {
		display: inline-block;
		}

		.jello_logo {
		animation: jello 2.5s infinite;
		transform-origin: center;
		}

		.center_logo {
		display: inline-block;
		}
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light mobile">
	<ul class="nav justify-content-center">
		 <li class="nav-item" > 
			 <div class="nav nav-item justify-content-center" style="margin: auto;  margin-left: 1em; margin-right: 1em;">
					<a href="${contextPath}">
				       	<img class="ml-auto center_logo jello_logo" src="assets/images/logoTurismoUY.png"  width="150px">
				    </a>
			  	</div>
			</li>
		</ul>
		
    
   
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
		<li class="nav-item">
			<a class="nav-link" href=" ${contextPath}/login ">
				<button class="btn btn-outline-success">
					&nbsp;Iniciar Sesión&nbsp;
				</button>
			</a>
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
        
        	<li class="nav-item">
				<div class="input-group mb-3">
				  <input id="searchText" name"searchText" type="text" class="form-control" placeholder="Buscar Actividad o Paquete" aria-label="Recipient's username" aria-describedby="basic-addon2">
				  <div class="input-group-append">
				    <button class="btn btn-outline-success" type="button">Buscar</button>
				  </div>
				</div>   
            </li>
        
      </ul>
    </div>
  </div>
</nav>

`);
}


