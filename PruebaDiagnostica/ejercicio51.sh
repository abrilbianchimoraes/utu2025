#!/bin/bash

archivo="/etc/passwd"

if [ ! -f "$archivo" ]; then
    echo "El archivo '$archivo' no existe."
    exit 1
fi

usuario=$(whoami)

count=$(grep -c "^$usuario" "$archivo")

if [ $count -gt 0 ]; then
    echo "El nombre de usuario '$usuario' aparece $count veces en el archivo $archivo."
else
    echo "El nombre de usuario '$usuario' no aparece en el archivo $archivo."
fi
