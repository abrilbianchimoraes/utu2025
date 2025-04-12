#!/bin/bash
read -p "Ingresa un número: " numero

if [ "$numero" -gt 50 ]; then
    echo "El número ingresado es mayor a 50. Por favor, ingresa un número menor o igual a 50."
    exit 1
fi

for ((i=numero; i<=50; i++))
do
    echo "$i"
done
