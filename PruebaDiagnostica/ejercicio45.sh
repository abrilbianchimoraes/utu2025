#!/bin/bash
echo "Ingresa el nombre del archivo:"
read archivo

if [ ! -f "$archivo" ]; then
    echo "El archivo no existe."
    exit 1
fi

echo "Ingresa la palabra clave a buscar:"
read palabra_clave

echo "a. Coincidencias de la palabra clave en el archivo:"
grep "$palabra_clave" "$archivo"

echo "b. Número de veces que se repite la palabra clave:"
grep -o "$palabra_clave" "$archivo" | wc -l

echo "c. Líneas que no contienen la palabra clave:"
grep -v "$palabra_clave" "$archivo"

echo "d. Líneas donde aparece la palabra clave:"
grep -n "$palabra_clave" "$archivo"
