#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Por favor ingresa el archivo como parámetro."
    exit 1
fi

archivo="$1"

if [ ! -f "$archivo" ]; then
    echo "El archivo '$archivo' no existe."
    exit 1
fi

usuario=$(whoami)

if grep -q "^$usuario" "$archivo"; then
    echo "El usuario '$usuario' está en el archivo '$archivo'."
else
    echo "El usuario '$usuario' NO está en el archivo '$archivo'."
fi
