#!/bin/bash

read -p "Ingresa el nombre del usuario a agregar: " nombre_usuario

nombre_usuario=$(echo "$nombre_usuario" | tr '[:upper:]' '[:lower:]')

if id "$nombre_usuario" &>/dev/null; then
    echo "El usuario '$nombre_usuario' ya existe en el sistema."
    exit 1
fi

read -p "Ingresa el nombre del grupo: " grupo

if ! getent group "$grupo" > /dev/null; then
    echo "El grupo '$grupo' no existe."
    exit 1
fi

sudo useradd -m -g "$grupo" "$nombre_usuario_
