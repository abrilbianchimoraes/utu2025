#!/bin/bash

read -p "Ingresa el nombre del archivo que contiene los números: " archivo

if [ ! -f "$archivo" ]; then
    echo "El archivo '$archivo' no existe."
    exit 1
fi

sort -n "$archivo"
