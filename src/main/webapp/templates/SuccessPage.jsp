<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Incluye el enlace a Bootstrap -->
   <link href="assets/scripts/bootstrap5.2.3.bundle.min.js" rel="stylesheet">
    
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--
 -->
</head>
<body>
    <div class="modal fade" id="miPopup" tabindex="-1" role="dialog" aria-labelledby="miPopupLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="miPopupLabel">Título de tu Popup</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Contenido de tu popup aquí -->
                    
                    <% 
                    String successType = (String) request.getAttribute("successType");
            		
            		String success = (String) request.getAttribute("successMessage");

                	switch(successType) {
        			
	    				case "User":%>
	    					<span><%= success %></span>
	    					<a href="<%= request.getContextPath() %>/register">
	    						<button> Ver perfil </button>
	    					</a>
    					<%break;
    					
    					case "Purchase": %>
    					<span><%= success %></span>
	    					<a href="<%= request.getContextPath() %>/bundleList">
	    						<button> Volver al listado de paquetes </button>
	    					</a>
				 <%	break;
                	}%>
    				
    				
                   
                    <p>Este es el contenido de tu popup.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
 
    <script src="assets/scripts/jquery3.5.1.min.js"></script>
    <script src="assets/scripts/bootstrap5.2.3.bundle.min.js"></script>
 
</body>
</html>