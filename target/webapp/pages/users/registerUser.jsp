<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
<title>Turismo.UY</title>
<link rel="stylesheet" href="assets/styles/bootstrap4.5.2.min.css">
<link rel="stylesheet" href="assets/styles/main.css">
</head>

<body>
<div class="">
	<main class="form-signin w-50 m-auto container-fluid">
	<h1 class="h3 mb-3 fw-normal pt-3">Registro de usuario</h1>
	
	<!-- action="<%= request.getContextPath() %>/register" -->
	<form action="<%= request.getContextPath() %>/register" method="post"
				enctype="multipart/form-data" accept-charset="UTF-8"
				onsubmit="return validation()">
	
		<span> Tipo de usuario: </span>
		
        <select name="userType" id="userType" onchange="showFields()" class="form-select form-select-lg mb-3" required>
            <option value="nothing" selected> - </option>
            <option value="tourist"> Turista </option>
            <option value="provider"> Proveedor </option>
        </select>

		<div class="input-group">
	        <span class="input-group-text"> Nombre: </span>
	        <input class="form-control" name="firstName" id="firstName" type="text"  required/>
        </div>
        <br>


		<div class="input-group">
			<span class="input-group-text"> Apellido: </span>
	        <input class="form-control" name="lastName" id="lastName" type="text" required/>		
		</div>
        <br>


        <div class="input-group">
			<span class="input-group-text"> Nombre de usuario: </span>
	        <input class="form-control" name="nickname" id="nickname" type="text" required/>		
		</div>
        <br>


		<div class="input-group">
			<span class="input-group-text"> Fecha de nacimiento: </span>
	        <input class="form-control" name="birthDate"  id="birthDate" type="date" required/>		
		</div>
        <br>
		
		<div class="input-group">
			<span class="input-group-text"> E-Mail: </span>
	        <input class="form-control" name="email" id="email" type="email" required/>		
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
		        <input class="form-control" name="web" id="web" type="text"/>
		        
	        </div>
		</div>

        <br>
        
		<div id="touristCountryDIV" style="display: none;">
			<span> Seleccione su pais:</span> <select name="touristCountry" id="touristCountry">
						<option value="" selected> Selección </option>
						<option value="AF">Afganistán</option>
						<option value="AL">Albania</option>
						<option value="DE">Alemania</option>
						<option value="AD">Andorra</option>
						<option value="AO">Angola</option>
						<option value="AI">Anguilla</option>
						<option value="AQ">Antártida</option>
						<option value="AG">Antigua y Barbuda</option>
						<option value="AN">Antillas Holandesas</option>
						<option value="SA">Arabia Saudí</option>
						<option value="DZ">Argelia</option>
						<option value="AR">Argentina</option>
						<option value="AM">Armenia</option>
						<option value="AW">Aruba</option>
						<option value="AU">Australia</option>
						<option value="AT">Austria</option>
						<option value="AZ">Azerbaiyán</option>
						<option value="BS">Bahamas</option>
						<option value="BH">Bahrein</option>
						<option value="BD">Bangladesh</option>
						<option value="BB">Barbados</option>
						<option value="BE">Bélgica</option>
						<option value="BZ">Belice</option>
						<option value="BJ">Benin</option>
						<option value="BM">Bermudas</option>
						<option value="BY">Bielorrusia</option>
						<option value="MM">Birmania</option>
						<option value="BO">Bolivia</option>
						<option value="BA">Bosnia y Herzegovina</option>
						<option value="BW">Botswana</option>
						<option value="BR">Brasil</option>
						<option value="BN">Brunei</option>
						<option value="BG">Bulgaria</option>
						<option value="BF">Burkina Faso</option>
						<option value="BI">Burundi</option>
						<option value="BT">Bután</option>
						<option value="CV">Cabo Verde</option>
						<option value="KH">Camboya</option>
						<option value="CM">Camerún</option>
						<option value="CA">Canadá</option>
						<option value="TD">Chad</option>
						<option value="CL">Chile</option>
						<option value="CN">China</option>
						<option value="CY">Chipre</option>
						<option value="VA">Ciudad del Vaticano (Santa Sede)</option>
						<option value="CO">Colombia</option>
						<option value="KM">Comores</option>
						<option value="CG">Congo</option>
						<option value="CD">Congo, República Democrática del</option>
						<option value="KR">Corea</option>
						<option value="KP">Corea del Norte</option>
						<option value="CI">Costa de Marfíl</option>
						<option value="CR">Costa Rica</option>
						<option value="HR">Croacia (Hrvatska)</option>
						<option value="CU">Cuba</option>
						<option value="DK">Dinamarca</option>
						<option value="DJ">Djibouti</option>
						<option value="DM">Dominica</option>
						<option value="EC">Ecuador</option>
						<option value="EG">Egipto</option>
						<option value="SV">El Salvador</option>
						<option value="AE">Emiratos Árabes Unidos</option>
						<option value="ER">Eritrea</option>
						<option value="SI">Eslovenia</option>
						<option value="ES">España</option>
						<option value="US">Estados Unidos</option>
						<option value="EE">Estonia</option>
						<option value="ET">Etiopía</option>
						<option value="FJ">Fiji</option>
						<option value="PH">Filipinas</option>
						<option value="FI">Finlandia</option>
						<option value="FR">Francia</option>
						<option value="GA">Gabón</option>
						<option value="GM">Gambia</option>
						<option value="GE">Georgia</option>
						<option value="GH">Ghana</option>
						<option value="GI">Gibraltar</option>
						<option value="GD">Granada</option>
						<option value="GR">Grecia</option>
						<option value="GL">Groenlandia</option>
						<option value="GP">Guadalupe</option>
						<option value="GU">Guam</option>
						<option value="GT">Guatemala</option>
						<option value="GY">Guayana</option>
						<option value="GF">Guayana Francesa</option>
						<option value="GN">Guinea</option>
						<option value="GQ">Guinea Ecuatorial</option>
						<option value="GW">Guinea-Bissau</option>
						<option value="HT">Haití</option>
						<option value="HN">Honduras</option>
						<option value="HU">Hungría</option>
						<option value="IN">India</option>
						<option value="ID">Indonesia</option>
						<option value="IQ">Irak</option>
						<option value="IR">Irán</option>
						<option value="IE">Irlanda</option>
						<option value="BV">Isla Bouvet</option>
						<option value="CX">Isla de Christmas</option>
						<option value="IS">Islandia</option>
						<option value="KY">Islas Caimán</option>
						<option value="CK">Islas Cook</option>
						<option value="CC">Islas de Cocos o Keeling</option>
						<option value="FO">Islas Faroe</option>
						<option value="HM">Islas Heard y McDonald</option>
						<option value="FK">Islas Malvinas</option>
						<option value="MP">Islas Marianas del Norte</option>
						<option value="MH">Islas Marshall</option>
						<option value="UM">Islas menores de Estados Unidos</option>
						<option value="PW">Islas Palau</option>
						<option value="SB">Islas Salomón</option>
						<option value="SJ">Islas Svalbard y Jan Mayen</option>
						<option value="TK">Islas Tokelau</option>
						<option value="TC">Islas Turks y Caicos</option>
						<option value="VI">Islas Vírgenes (EEUU)</option>
						<option value="VG">Islas Vírgenes (Reino Unido)</option>
						<option value="WF">Islas Wallis y Futuna</option>
						<option value="IL">Israel</option>
						<option value="IT">Italia</option>
						<option value="JM">Jamaica</option>
						<option value="JP">Japón</option>
						<option value="JO">Jordania</option>
						<option value="KZ">Kazajistán</option>
						<option value="KE">Kenia</option>
						<option value="KG">Kirguizistán</option>
						<option value="KI">Kiribati</option>
						<option value="KW">Kuwait</option>
						<option value="LA">Laos</option>
						<option value="LS">Lesotho</option>
						<option value="LV">Letonia</option>
						<option value="LB">Líbano</option>
						<option value="LR">Liberia</option>
						<option value="LY">Libia</option>
						<option value="LI">Liechtenstein</option>
						<option value="LT">Lituania</option>
						<option value="LU">Luxemburgo</option>
						<option value="MK">Macedonia, Ex-República Yugoslava de</option>
						<option value="MG">Madagascar</option>
						<option value="MY">Malasia</option>
						<option value="MW">Malawi</option>
						<option value="MV">Maldivas</option>
						<option value="ML">Malí</option>
						<option value="MT">Malta</option>
						<option value="MA">Marruecos</option>
						<option value="MQ">Martinica</option>
						<option value="MU">Mauricio</option>
						<option value="MR">Mauritania</option>
						<option value="YT">Mayotte</option>
						<option value="MX">México</option>
						<option value="FM">Micronesia</option>
						<option value="MD">Moldavia</option>
						<option value="MC">Mónaco</option>
						<option value="MN">Mongolia</option>
						<option value="MS">Montserrat</option>
						<option value="MZ">Mozambique</option>
						<option value="NA">Namibia</option>
						<option value="NR">Nauru</option>
						<option value="NP">Nepal</option>
						<option value="NI">Nicaragua</option>
						<option value="NE">Níger</option>
						<option value="NG">Nigeria</option>
						<option value="NU">Niue</option>
						<option value="NF">Norfolk</option>
						<option value="NO">Noruega</option>
						<option value="NC">Nueva Caledonia</option>
						<option value="NZ">Nueva Zelanda</option>
						<option value="OM">Omán</option>
						<option value="NL">Países Bajos</option>
						<option value="PA">Panamá</option>
						<option value="PG">Papúa Nueva Guinea</option>
						<option value="PK">Paquistán</option>
						<option value="PY">Paraguay</option>
						<option value="PE">Perú</option>
						<option value="PN">Pitcairn</option>
						<option value="PF">Polinesia Francesa</option>
						<option value="PL">Polonia</option>
						<option value="PT">Portugal</option>
						<option value="PR">Puerto Rico</option>
						<option value="QA">Qatar</option>
						<option value="UK">Reino Unido</option>
						<option value="CF">República Centroafricana</option>
						<option value="CZ">República Checa</option>
						<option value="ZA">República de Sudáfrica</option>
						<option value="DO">República Dominicana</option>
						<option value="SK">República Eslovaca</option>
						<option value="RE">Reunión</option>
						<option value="RW">Ruanda</option>
						<option value="RO">Rumania</option>
						<option value="RU">Rusia</option>
						<option value="EH">Sahara Occidental</option>
						<option value="KN">Saint Kitts y Nevis</option>
						<option value="WS">Samoa</option>
						<option value="AS">Samoa Americana</option>
						<option value="SM">San Marino</option>
						<option value="VC">San Vicente y Granadinas</option>
						<option value="SH">Santa Helena</option>
						<option value="LC">Santa Lucía</option>
						<option value="ST">Santo Tomé y Príncipe</option>
						<option value="SN">Senegal</option>
						<option value="SC">Seychelles</option>
						<option value="SL">Sierra Leona</option>
						<option value="SG">Singapur</option>
						<option value="SY">Siria</option>
						<option value="SO">Somalia</option>
						<option value="LK">Sri Lanka</option>
						<option value="PM">St Pierre y Miquelon</option>
						<option value="SZ">Suazilandia</option>
						<option value="SD">Sudán</option>
						<option value="SE">Suecia</option>
						<option value="CH">Suiza</option>
						<option value="SR">Surinam</option>
						<option value="TH">Tailandia</option>
						<option value="TW">Taiwán</option>
						<option value="TZ">Tanzania</option>
						<option value="TJ">Tayikistán</option>
						<option value="TF">Territorios franceses del Sur</option>
						<option value="TP">Timor Oriental</option>
						<option value="TG">Togo</option>
						<option value="TO">Tonga</option>
						<option value="TT">Trinidad y Tobago</option>
						<option value="TN">Túnez</option>
						<option value="TM">Turkmenistán</option>
						<option value="TR">Turquía</option>
						<option value="TV">Tuvalu</option>
						<option value="UA">Ucrania</option>
						<option value="UG">Uganda</option>
						<option value="UY" >Uruguay</option>
						<option value="UZ">Uzbekistán</option>
						<option value="VU">Vanuatu</option>
						<option value="VE">Venezuela</option>
						<option value="VN">Vietnam</option>
						<option value="YE">Yemen</option>
						<option value="YU">Yugoslavia</option>
						<option value="ZM">Zambia</option>
						<option value="ZW">Zimbabue</option>
					</select>
		</div>
		
		<br>
			
		<label>Sube una foto de perfil:</label> 
		<input type="file" id="image"> 
		
		<br>
		
		<input class="w-100 btn btn-lg btn-primary" type="submit" value="Crear usuario"/>
        <br>
        
	</form>
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

				
			}

		</script>
	</div>
</body>
</html>
	