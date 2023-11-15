# Estructura

### Carpeta de controladores (Servlets) y logica
src/main/java/uy.turismo.webapp

### Crpeta de vistas, archivos JS y CSS 
src/main/webapp/

# Instalación tomcat9

`sudo apt update`

`sudo apt upgrade`

`sudo apt install tomcat9` 

`sudo systemctl start tomcat9`

Ir al navegador y entrar a https://localhost:8080

Si todo funciona ejecutar los siguientes comandos: 

`cd /usr/share/tomcat9`

`sudo ln -s /var/lib/tomcat9/conf conf`

`sudo ln -s /var/log/tomcat9 log`

`sudo ln -s /etc/tomcat9/policy.d/03catalina.policy conf/catalina.policy`

`sudo chmod -R a+rwx /usr/share/tomcat9/conf`

# Configuración de IP del WS en el Cliente
## Para ejecutar en Enlipse:
Ir a Run Configurations > Tomcat9 > Enviroment
Crear una nueva variable de entorno con nombre "wsdlURL" y valor la URL hacia el archivo .wsdl del WS ejemplo: http://192.169.1.3:8181/controller?wsdl

## Para ejecutar en deploy: 
Abrir una terminal en la carpeta raiz del proyecto y ejecutar el script `defWSDLURL.sh` pasandole como parametro el URL de la siguiente manera:
`. defWSDLURL.sh http://192.169.1.3:8181/controller?wsdl`
