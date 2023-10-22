<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
<title>Registro usuarios</title>
<link rel="stylesheet" href="assets/styles/bootstrap4.5.2.min.css">
<link rel="stylesheet" href="assets/styles/main.css">

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="assets/scripts/jquery3.5.1.min.js"></script>
<script src="assets/scripts/bootstrap4.5.2.min.js"></script>
<script src="assets/scripts/bootstrap5.2.3.bundle.min.js"></script>
<script src="assets/scripts/clock.js" type="text/javascript"></script>
<link rel="icon" href="assets/images/star.ico" type="image/png">
</head>

<body>
<div class="">
	<main class="form-signin w-50 m-auto container-fluid">
	<h1 class="h3 mb-3 fw-normal pt-3">Registro de usuario</h1>
	<!-- enctype="multipart/form-data"  -->
	<form action="<%= request.getContextPath() %>/register" method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return validation()">
	
		<span> Tipo de usuario: </span>
		
        <select name="userType" id="userType" onchange="showFields()" class="form-select form-select-lg mb-3" required>
            <option value="nothing" selected> - </option>
            <option value="tourist"> Turista </option>
            <option value="provider"> Proveedor </option>
        </select>


		<div class="input-group">
	        <span class="input-group-text"> Nombre: </span>
	        <input class="form-control" name="firstName" id="firstName" type="text" placeholder="Ej: Fernando" required/>
        </div>
        <br>


		<div class="input-group">
			<span class="input-group-text"> Apellido: </span>
	        <input class="form-control" name="lastName" id="lastName" type="text" placeholder="Ej: Torres" required/>		
		</div>
        <br>


        <div class="input-group">
			<span class="input-group-text"> Nombre de usuario: </span>
	        <input class="form-control" name="nickname" id="nickname" type="text" placeholder="Ej: FerTorr123" required/>		
		</div>
        <br>


		<div class="input-group">
			<span class="input-group-text"> Fecha de nacimiento: </span>
	        <input class="form-control" name="birthDate"  id="birthDate" type="date" placeholder="Ej: 2022/12/10" required/>		
		</div>
        <br>
		
		<div class="input-group">
			<span class="input-group-text"> E-Mail: </span>
	        <input class="form-control" name="email" id="email" type="email" placeholder="Ej: FerTor@gmail.com" required/>		
		</div>
        <br>
		
		<div class="input-group">
		<span class="input-group-text">Contraseña: </span>
	        <input class="form-control" name="password" id="password" type="password" required/>		
		</div>
        <br>
        
        
        <div class="input-group">
			<span class="input-group-text">Confirmar contraseña: </span>
	        <input class="form-control" name="confirmPassword" id="confirmPassword" type="password" required/>		
		</div>
        
        <br>
         
		<div id = "providerData" class="input-group" style="display: none;">
			<div class="input-group">
		        <span class="input-group-text">Descripción: </span>
		        <input class="form-control" name="description" id="description" type="text"/>
		        </div>			
			<br>
			<div class="input-group">
		         <span class="input-group-text">Página web: </span>
		        <input class="form-control" name="web" id="web" placeholder="Ej: www.ejemplo.com" type="text"/>
		        
	        </div>
		</div>

        <br>
        
		<div id="touristCountryDIV" style="display: none;">
			<span> Seleccione su pais:</span> <select name="touristCountry" id="touristCountry">
						<option value="" selected> Selección </option>
						<option value="Afganistán">Afganistán</option>
						<option value="Albsdania">Albsdania</option>
						<option value="Alemania">Alemania</option>
						<option value="Andorra">Andorra</option>
						<option value="Angsdola">Angsdola</option>
						<option value="Anguilla">Anguilla</option>
						<option value="Antsdártida">Antsdártida</option>
						<option value="Antigsdua y Barbuda">Antigsdua y Barbuda</option>
						<option value="Antillas Holandesas">Antillas Holandesas</option>
						<option value="Arabia Saudí">Arabia Saudí</option>
						<option value="Argesdlia">Argesdlia</option>
						<option value="Argentina">Argentina</option>
						<option value="Armenia">Armenia</option>
						<option value="Arubsda">Arubsda</option>
						<option value="Australia">Australia</option>
						<option value="Austsdria">Austsdria</option>
						<option value="Azerbaiyán">Azerbaiyán</option>
						<option value="Bahamas">Bahamas</option>
						<option value="Bahrein">Bahrein</option>
						<option value="Bangladesh">Bangladesh</option>
						<option value="Barbados">Barbados</option>
						<option value="Bélgica">Bélgica</option>
						<option value="Belice">Belice</option>
						<option value="Benin">Benin</option>
						<option value="Bermudas">Bermudas</option>
						<option value="Bielorrusia">Bielorrusia</option>
						<option value="Birmania">Birmania</option>
						<option value="Bolivia">Bolivia</option>
						<option value="Bosnia y Herzegovina">Bosnia y Herzegovina</option>
						<option value="Botswana">Botswana</option>
						<option value="Brasil">Brasil</option>
						<option value="Brunei">Brunei</option>
						<option value="Bulgaria">Bulgaria</option>
						<option value="Burkina Faso">Burkina Faso</option>
						<option value="Burundi">Burundi</option>
						<option value="Bután">Bután</option>
						<option value="Cabo Verde">Cabo Verde</option>
						<option value="Camboya">Camboya</option>
						<option value="Camerún">Camerún</option>
						<option value="Canadá">Canadá</option>
						<option value="Chad">Chad</option>
						<option value="Chile">Chile</option>
						<option value="China">China</option>
						<option value="Chipre">Chipre</option>
						<option value="Ciudad del Vaticano (Santa Sede)">Ciudad del Vaticano (Santa Sede)</option>
						<option value="Colombia">Colombia</option>
						<option value="Comores">Comores</option>
						<option value="Congo">Congo</option>
						<option value="Congo, República Democrática del">Congo, República Democrática del</option>
						<option value="Corea">Corea</option>
						<option value="Corea del Norte">Corea del Norte</option>
						<option value="Costa de Marfíl">Costa de Marfíl</option>
						<option value="Costa Rica">Costa Rica</option>
						<option value="Croacia (Hrvatska)">Croacia (Hrvatska)</option>
						<option value="Cuba">Cuba</option>
						<option value="Dinamarca">Dinamarca</option>
						<option value="Djibouti">Djibouti</option>
						<option value="Dominica">Dominica</option>
						<option value="Ecuador">Ecuador</option>
						<option value="Egipto">Egipto</option>
						<option value="El Salvador">El Salvador</option>
						<option value="Emiratos Árabes Unidos">Emiratos Árabes Unidos</option>
						<option value="Eritrea">Eritrea</option>
						<option value="Eslovenia">Eslovenia</option>
						<option value="España">España</option>
						<option value="Estados Unidos">Estados Unidos</option>
						<option value="Estonia">Estonia</option>
						<option value="Etiopía">Etiopía</option>
						<option value="Fiji">Fiji</option>
						<option value="Filipinas">Filipinas</option>
						<option value="Finlandia">Finlandia</option>
						<option value="Francia">Francia</option>
						<option value="Gabón">Gabón</option>
						<option value="Gambia">Gambia</option>
						<option value="Georgia">Georgia</option>
						<option value="Ghana">Ghana</option>
						<option value="Gibraltar">Gibraltar</option>
						<option value="Granada">Granada</option>
						<option value="Grecia">Grecia</option>
						<option value="Groenlandia">Groenlandia</option>
						<option value="Guadalupe">Guadalupe</option>
						<option value="Guam">Guam</option>
						<option value="Guatemala">Guatemala</option>
						<option value="Guayana">Guayana</option>
						<option value="Guayana Francesa">Guayana Francesa</option>
						<option value="Guinea">Guinea</option>
						<option value="Guinea Ecuatorial">Guinea Ecuatorial</option>
						<option value="Guinea-Bissau">Guinea-Bissau</option>
						<option value="Haití">Haití</option>
						<option value="Honduras">Honduras</option>
						<option value="Hungría">Hungría</option>
						<option value="India">India</option>
						<option value="Indonesia">Indonesia</option>
						<option value="Irak">Irak</option>
						<option value="Irán">Irán</option>
						<option value="Irlanda">Irlanda</option>
						<option value="Isla Bouvet">Isla Bouvet</option>
						<option value="Isla de Christmas">Isla de Christmas</option>
						<option value="Islandia">Islandia</option>
						<option value="Islas Caimán">Islas Caimán</option>
						<option value="Islas Cook">Islas Cook</option>
						<option value="Islas de Cocos o Keeling">Islas de Cocos o Keeling</option>
						<option value="Islas Faroe">Islas Faroe</option>
						<option value="Islas Heard y McDonald">Islas Heard y McDonald</option>
						<option value="Islas Malvinas">Islas Malvinas</option>
						<option value="Islas Marianas del Norte">Islas Marianas del Norte</option>
						<option value="Islas Marshall">Islas Marshall</option>
						<option value="Islas menores de Estados Unidos">Islas menores de Estados Unidos</option>
						<option value="Islas Palau">Islas Palau</option>
						<option value="Islas Salomón">Islas Salomón</option>
						<option value="Islas Svalbard y Jan Mayen">Islas Svalbard y Jan Mayen</option>
						<option value="Islas Tokelau">Islas Tokelau</option>
						<option value="Islas Turks y Caicos">Islas Turks y Caicos</option>
						<option value="Islas Vírgenes (EEUU)">Islas Vírgenes (EEUU)</option>
						<option value="Islas Vírgenes (Reino Unido)">Islas Vírgenes (Reino Unido)</option>
						<option value="Islas Wallis y Futuna">Islas Wallis y Futuna</option>
						<option value="Israel">Israel</option>
						<option value="Italia">Italia</option>
						<option value="Jamaica">Jamaica</option>
						<option value="Japón">Japón</option>
						<option value="Jordania">Jordania</option>
						<option value="Kazajistán">Kazajistán</option>
						<option value="Kenia">Kenia</option>
						<option value="Kirguizistán">Kirguizistán</option>
						<option value="Kiribati">Kiribati</option>
						<option value="Kuwait">Kuwait</option>
						<option value="Laos">Laos</option>
						<option value="Lesotho">Lesotho</option>
						<option value="Letonia">Letonia</option>
						<option value="Líbano">Líbano</option>
						<option value="Liberia">Liberia</option>
						<option value="Libia">Libia</option>
						<option value="Liechtenstein">Liechtenstein</option>
						<option value="Lituania">Lituania</option>
						<option value="Luxemburgo">Luxemburgo</option>
						<option value="Macedonia, Ex-República Yugoslava de">Macedonia, Ex-República Yugoslava de</option>
						<option value="Madagascar">Madagascar</option>
						<option value="Malasia">Malasia</option>
						<option value="Malawi">Malawi</option>
						<option value="Maldivas">Maldivas</option>
						<option value="Malí">Malí</option>
						<option value="Malta">Malta</option>
						<option value="Marruecos">Marruecos</option>
						<option value="Martinica">Martinica</option>
						<option value="Mauricio">Mauricio</option>
						<option value="Mauritania">Mauritania</option>
						<option value="Mayotte">Mayotte</option>
						<option value="México">México</option>
						<option value="Micronesia">Micronesia</option>
						<option value="Moldavia">Moldavia</option>
						<option value="Mónaco">Mónaco</option>
						<option value="Mongolia">Mongolia</option>
						<option value="Montserrat">Montserrat</option>
						<option value="Mozambique">Mozambique</option>
						<option value="Namibia">Namibia</option>
						<option value="Nauru">Nauru</option>
						<option value="Nepal">Nepal</option>
						<option value="Nicaragua">Nicaragua</option>
						<option value="Níger">Níger</option>
						<option value="Nigeria">Nigeria</option>
						<option value="Niue">Niue</option>
						<option value="Norfolk">Norfolk</option>
						<option value="Noruega">Noruega</option>
						<option value="Nueva Caledonia">Nueva Caledonia</option>
						<option value="Nueva Zelanda">Nueva Zelanda</option>
						<option value="Omán">Omán</option>
						<option value="Países Bajos">Países Bajos</option>
						<option value="Panamá">Panamá</option>
						<option value="Papúa Nueva Guinea">Papúa Nueva Guinea</option>
						<option value="Paquistán">Paquistán</option>
						<option value="Paraguay">Paraguay</option>
						<option value="Perú">Perú</option>
						<option value="Pitcairn">Pitcairn</option>
						<option value="Polinesia Francesa">Polinesia Francesa</option>
						<option value="Polonia">Polonia</option>
						<option value="Portugal">Portugal</option>
						<option value="Puerto Rico">Puerto Rico</option>
						<option value="Qatar">Qatar</option>
						<option value="Reino Unido">Reino Unido</option>
						<option value="República Centroafricana">República Centroafricana</option>
						<option value="República Checa">República Checa</option>
						<option value="República de Sudáfrica">República de Sudáfrica</option>
						<option value="República Dominicana">República Dominicana</option>
						<option value="República Eslovaca">República Eslovaca</option>
						<option value="Reunión">Reunión</option>
						<option value="Ruanda">Ruanda</option>
						<option value="Rumania">Rumania</option>
						<option value="Rusia">Rusia</option>
						<option value="Sahara Occidental">Sahara Occidental</option>
						<option value="Saint Kitts y Nevis">Saint Kitts y Nevis</option>
						<option value="Samoa">Samoa</option>
						<option value="Samoa Americana">Samoa Americana</option>
						<option value="San Marino">San Marino</option>
						<option value="San Vicente y Granadinas">San Vicente y Granadinas</option>
						<option value="Santa Helena">Santa Helena</option>
						<option value="Santa Lucía">Santa Lucía</option>
						<option value="Santo Tomé y Príncipe">Santo Tomé y Príncipe</option>
						<option value="Senegal">Senegal</option>
						<option value="Seychelles">Seychelles</option>
						<option value="Sierra Leona">Sierra Leona</option>
						<option value="Singapur">Singapur</option>
						<option value="Siria">Siria</option>
						<option value="Somalia">Somalia</option>
						<option value="Sri Lanka">Sri Lanka</option>
						<option value="St Pierre y Miquelon">St Pierre y Miquelon</option>
						<option value="Suazilandia">Suazilandia</option>
						<option value="Sudán">Sudán</option>
						<option value="Suecia">Suecia</option>
						<option value="Suiza">Suiza</option>
						<option value="Surinam">Surinam</option>
						<option value="Tailandia">Tailandia</option>
						<option value="Taiwán">Taiwán</option>
						<option value="Tanzania">Tanzania</option>
						<option value="Tayikistán">Tayikistán</option>
						<option value="Territorios franceses del Sur">Territorios franceses del Sur</option>
						<option value="Timor Oriental">Timor Oriental</option>
						<option value="Togo">Togo</option>
						<option value="Tonga">Tonga</option>
						<option value="Trinidad y Tobago">Trinidad y Tobago</option>
						<option value="Túnez">Túnez</option>
						<option value="Turkmenistán">Turkmenistán</option>
						<option value="Turquía">Turquía</option>
						<option value="Tuvalu">Tuvalu</option>
						<option value="Ucrania">Ucrania</option>
						<option value="Uganda">Uganda</option>
						<option value="Uruguay" >Uruguay</option>
						<option value="Uzbekistán">Uzbekistán</option>
						<option value="Vanuatu">Vanuatu</option>
						<option value="Venezuela">Venezuela</option>
						<option value="Vietnam">Vietnam</option>
						<option value="Yemen">Yemen</option>
						<option value="Yugoslavia">Yugoslavia</option>
						<option value="Zambia">Zambia</option>
						<option value="Zimbabue">Zimbabue</option>
					</select>
		</div>
		
		<br>
		
			<label>Sube una foto de perfil:</label> 
			<input type="file" accept="image/*" id="image" name="image"/>
			
		
		<br>
		
		<input class="w-100 btn btn-lg btn-primary" type="submit" value="Crear usuario"/>
        <br>
        
	</form>
	
	<a href="<%= request.getContextPath() %>/login">¿Ya tienes cuenta? <b>Inicia
				sesión</b></a>
	
	</main>
	
		<script>
			//funcionando
			function showFields() {
				var userType = document.getElementById("userType").value;
				var providerDataVar = document.getElementById("providerData");
				var touristDataVar = document.getElementById("touristCountryDIV");

				if (userType  === "provider") {// Si tipo de usuario es provedor ocultar campos de turista
					providerDataVar.style.display = "block";
					touristDataVar.style.display = "none";
				} else if (userType  === "tourist") {// Si tipo de usuario es turista ocultar campos de provedor
					providerDataVar.style.display = "none";
					touristDataVar.style.display = "block";
				} else {//ocultar ambos campos
					providerDataVar.style.display = "none";
					touristDataVar.style.display = "none";
				}
			}

			function validation() {
				var password = document.getElementById("password").value;
				var confirm_password = document
						.getElementById("confirmPassword").value;
				
						//control de confirmacion de contraseña funcionando
				if (password !== confirm_password) {

					alert("Las contraseñas no coinciden intente nuevamente");
					return false;
				}
				
				//control de usuario, elegir Provedor o Turista. //funcionando
				var typeUser = document.getElementById("userType").value;

				if(typeUser === "nothing"){ 
					alert("Seleccione un usuario");
					return false;
				}

				//control campo vacio: si el usuario proveedor deja su campo obligatorio vacío.
				
				if(typeUser === "provider"){
					var providerDescription = document.getElementById("description").value;
					if(providerDescription === ""){
						alert("Debes proporcionar una descripcíon");
						return false;
					}
				} 

				//control campo vacio turista: si el usuario turista no selecciona un pais.
				if(typeUser === "tourist"){ 
					var touristCtry = document.getElementById("touristCountry").value;
					if(touristCtry === ""){
						alert("Debes seleccionar un país");
						return false;
					}
				}
				return true;
				alert("Usuario creado correctamente");

				
			}

		</script>
	</div>
	
	
	
</body>
</html>
