#!/bin/bash

mvn package

cp target/turismo-uy-webapp.war /var/lib/tomcat9/webapps/

systemctl restart tomcat9.service
systemctl status tomcat9.service
