#!/bin/bash

if [ ! -f /etc/sudoers ]; then
    echo "El archivo /etc/sudoers no existe."
    exit 1
fi

usuario=$(whoami)

if grep -q "^$usuario" /etc/sudoers; then
    echo "El usuario '$usuario' está en el archivo sudoers."
else
    echo "El usuario '$usuario' NO está en el archivo sudoers."
fi
