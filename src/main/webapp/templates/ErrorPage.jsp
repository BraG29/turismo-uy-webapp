<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Incluye el enlace a Bootstrap -->
    <link href="ruta/a/bootstrap.min.css" rel="stylesheet">
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
                    String errorType = request.getParameter("errorType");  
                    
                    String error = request.getParameter("error");

                	switch(errorType) {
        			
	    				case "User":%>
	    					<span>Error: <%= error %></span>
	    					<a href="<%= request.getContextPath() %>/register">
	    					<button> Volver al registro </button>
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

    <script src="ruta/a/jquery.min.js"></script>
    <script src="ruta/a/bootstrap.min.js"></script>
</body>
</html>