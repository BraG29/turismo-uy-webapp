if(userDevice == "mobile"){
	console.log("estoy en header guest mobile");
	document.write(`
<nav class="navbar navbar-expand-lg navbar-light bg-light mobile">
	<ul class="nav justify-content-left" >
		 <li class="nav-item" > 
			 <div class="nav nav-item justify-content-left" style="margin: auto;  margin-left: 1em; margin-right: 1em;">
					<a href="${contextPath}">
				       	<img class="ml-auto" src="assets/images/logoTurismoUY.png" alt="Usuario Generico" width="150px">
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
<nav class="navbar navbar-expand-lg navbar-light bg-light mobile">
	<ul class="nav justify-content-center">
		 <li class="nav-item" > 
			 <div class="nav nav-item justify-content-center" style="margin: auto;  margin-left: 1em; margin-right: 1em;">
					<a href="${contextPath}">
				       	<img class="ml-auto" src="assets/images/logoTurismoUY.png" alt="Usuario Generico" width="150px">
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


