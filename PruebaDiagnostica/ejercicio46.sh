#!/bin/bash
echo "Ingresa el nombre del archivo:"
read archivo

if [ ! -f "$archivo" ]; then
    echo "El archivo no existe."
    exit 1
fi

echo "Las líneas que comienzan con la letra 'a' son:"
grep -i "^a" "$archivo"
