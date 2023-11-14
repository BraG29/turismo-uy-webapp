#!/bin/bash

# Verificar si se proporciona un valor como argumento
if [ $# -eq 0 ]; then
    echo "Por favor, proporciona un valor para la variable wsdlURL."
else
	# Definir la variable de entorno wsdlURL con el valor pasado como parámetro
	export wsdlURL="$1"

	echo "La variable wsdlURL se ha definido como: $wsdlURL"
fi
