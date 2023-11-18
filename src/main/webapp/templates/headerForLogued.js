if(userDevice == "mobile"){
	console.log("estoy en header Logged mobile");
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

  <div class="container-fluid" style="margin-top: 0.5em;">
  <div class="media">
        <div class="media-body">
            <div class="mt-0 mb-1">
            	<a href="${contextPath}/profile?id=${userId}" style="font-size: 1.25em; text-decoration: none;">
	                <img class="ml-3" src="${userImage}" alt="Usuario Generico" style="height: 64px; width: 64px; border-radius: 5em; box-shadow: 0 10px 16px 0 rgba(244, 244, 244, 0.2),0px 0px 12px 0 rgba(0, 0, 0, 0.90) !important; margin-right: 0.5em ">
	                 <span> ${userName} </span> 
                 </a>
            </div>
        </div>
    </div>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      
    </button>
    
    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
    
      <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="width: min-content; float: right; display: block; ">
        <li class="nav-item" style="float: right;margin-left: 0.5em;">
                <a class="nav-link" href="${contextPath}/consultActivity?redirectTo=activity">
                    <button class="btn btn-outline-success">
                        &nbsp;Actividades&nbsp;
                    </button>
                </a>
            </li>
            
            
            <li class="nav-item" style="float: right;margin-left: 0.5em;">
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
	console.log("estoy en header Logged normal");
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

  <div class="container-fluid" style="margin-top: 0.5em;">
  <div class="media">
        <div class="media-body">
            <div class="mt-0 mb-1">
	            <a href="${contextPath}/profile?id=${userId}" style="text-decoration: none; display: flex;">
	            	<img class="ml-3" src="${userImage}" alt="Usuario Generico" style="height: 64px; width: 64px; border-radius: 5em; box-shadow: 0 10px 16px 0 rgba(244, 244, 244, 0.2),0px 0px 12px 0 rgba(0, 0, 0, 0.90) !important; margin-right: 0.5em;">
	                <span style="font-size: 1.25rem; margin: auto;"> ${userName} </span> 
                </a>
            </div>
        </div>
    </div>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      
    </button>
    
    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0" >
        <li class="nav-item" style="float: right;margin-left: 0.5em;">
                <a class="nav-link" href="${contextPath}/consultActivity?redirectTo=activity">
                    <button class="btn btn-outline-success">
                        &nbsp;Actividades&nbsp;
                    </button>
                </a>
            </li>
            
            <li class="nav-item" style="float: right;margin-left: 0.5em;">
                <a class="nav-link" href="${contextPath}/bundleList">
                    <button class="btn btn-outline-success">
                        &nbsp;Paquetes&nbsp;
                    </button>
                </a>
            </li>
            
            <li class="nav-item" style="float: right;margin-left: 0.5em;">
                <a class="nav-link" href="${contextPath}/consultActivity?redirectTo=departure">
                    <button class="btn btn-outline-success">
                        &nbsp;Salidas Turísticas&nbsp;
                    </button>
                </a>
            </li>
            
            <li class="nav-item" style="float: right;margin-left: 0.5em;">
                <a class="nav-link" href="${contextPath}/userList">
                    <button class="btn btn-outline-success">
                        &nbsp;Usuarios&nbsp;
                    </button>
                </a>
            </li>
       
       
      </ul>
    </div>
  </div>
</nav>
`);
}

