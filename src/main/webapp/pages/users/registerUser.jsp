<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
    <!-- Agregar enlaces a los estilos de Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Registro de Usuario</h1>
        <form id="user-registration-form">
            <!-- Email -->
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" placeholder="Correo Electrónico" required>
            </div>
            
            <!-- Nickname -->
            <div class="form-group">
                <label for="nickname">Nickname</label>
                <input type="text" class="form-control" id="nickname" placeholder="Nombre de usuario" required>
            </div>
            
            <!-- Contraseña -->
            <div class="form-group">
                <label for="password">Contraseña</label>
                <input type="password" class="form-control" id="password" placeholder="Contraseña" required>
            </div>
            
            <!-- Confirmar Contraseña -->
            <div class="form-group">
                <label for="confirm-password">Confirmar Contraseña</label>
                <input type="password" class="form-control" id="confirm-password" placeholder="Confirmar Contraseña" required>
            </div>
            
            <!-- Nombre -->
            <div class="form-group">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" placeholder="Nombre" required>
            </div>
            
            <!-- Apellido -->
            <div class="form-group">
                <label for="apellido">Apellido</label>
                <input type="text" class="form-control" id="apellido" placeholder="Apellido" required>
            </div>
            
            <!-- Fecha de Nacimiento -->
            <div class="form-group">
                <label for="fecha-nacimiento">Fecha de Nacimiento</label>
                <input type="date" class="form-control" id="fecha-nacimiento" required>
            </div>
            
            <!-- Imagen -->
            <div class="form-group">
                <label for="imagen">Imagen de Perfil</label>
                <input type="file" class="form-control-file" id="imagen">
            </div>
            
            <!-- Tipo de Usuario (Proveedor o Turista) -->
            <div class="form-check">
                <input class="form-check-input" type="radio" name="tipo-usuario" id="proveedor" value="proveedor">
                <label class="form-check-label" for="proveedor">
                    Proveedor
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="tipo-usuario" id="turista" value="turista">
                <label class="form-check-label" for="turista">
                    Turista
                </label>
            </div>
            
            <!-- Descripción y Página Web (solo para Proveedores) -->
            <div class="form-group" id="proveedor-info" style="display: none;">
                <label for="descripcion">Descripción (Proveedor)</label>
                <textarea class="form-control" id="descripcion" rows="3"></textarea>
            </div>
            
            <div class="form-group" id="proveedor-info" style="display: none;">
                <label for="pagina-web">Página Web (Proveedor)</label>
                <input type="text" class="form-control" id="pagina-web" placeholder="URL de la Página Web">
            </div>
            
            <!-- Nacionalidad (solo para Turistas) -->
            <div class="form-group" id="turista-info" style="display: none;">
                <label for="nacionalidad">Nacionalidad (Turista)</label>
                <input type="text" class="form-control" id="nacionalidad" placeholder="Nacionalidad">
            </div>
            
            <!-- Mensaje de error para contraseñas no coincidentes -->
            <div class="alert alert-danger" id="password-mismatch" style="display: none;">
                Las contraseñas no coinciden.
            </div>
            
            <!-- Botón de Registro -->
            <button type="submit" class="btn btn-primary">Registrarse</button>
        </form>
    </div>

    <!-- Agregar enlaces a los scripts de Bootstrap JS (jQuery y Popper.js deben estar incluidos también) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    
    <script>
        // Validar contraseñas coincidentes al enviar el formulario
        document.getElementById('user-registration-form').addEventListener('submit', function(event) {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirm-password').value;
            if (password !== confirmPassword) {
                event.preventDefault(); // Evitar que se envíe el formulario
                document.getElementById('password-mismatch').style.display = 'block';
            }
        });
        
        // Mostrar u ocultar campos de proveedor y turista según el tipo de usuario seleccionado
        var proveedorRadio = document.getElementById('proveedor');
        var turistaRadio = document.getElementById('turista');
        var proveedorInfo = document.getElementById('proveedor-info');
        var turistaInfo = document.getElementById('turista-info');
        
        proveedorRadio.addEventListener('change', function() {
            proveedorInfo.style.display = 'block';
            turistaInfo.style.display = 'none';
        });
        
        turistaRadio.addEventListener('change', function() {
            proveedorInfo.style.display = 'none';
            turistaInfo.style.display = 'block';
        });
    </script>
</body>
</html>
