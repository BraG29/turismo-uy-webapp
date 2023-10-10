# Estructura

### Carpeta de controladores (Servlets) y logica
src/main/java/uy.turismo.webapp

### Crpeta de vistas, archivos JS y CSS 
src/main/webapp/

#Instalación tomcat9

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
