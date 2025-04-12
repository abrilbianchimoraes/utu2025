#!/bin/bash

agregar_usuario() {

    read -p "Ingresa el nombre del usuario a agregar: " nombre_usuario

    nombre_usuario=$(echo "$nombre_usuario" | tr '[:upper:]' '[:lower:]')

    if id "$nombre_usuario" &>/dev/null; then
        echo "El usuario '$nombre_usuario' ya existe en el sistema."
        return
    fi

    read -p "Ingresa el nombre del grupo: " grupo

    if ! getent group "$grupo" > /dev/null; then
        echo "El grupo '$grupo' no existe."
        return
    fi

    sudo useradd -m -g "$grupo" "$nombre_usuario"

    if [ $? -eq 0 ]; then
        echo "El usuario '$nombre_usuario' ha sido creado y agregado al grupo '$grupo'."
    else
        echo "Hubo un error al crear el usuario."
    fi
}

eliminar_usuario() {
    read -p "Ingresa el nombre del usuario a eliminar: " nombre_usuario

    if ! id "$nombre_usuario" &>/dev/null; then
        echo "El usuario '$nombre_usuario' no existe en el sistema."
        return
    fi

    sudo userdel -r "$nombre_usuario"

    if [ $? -eq 0 ]; then
        echo "El usuario '$nombre_usuario' ha sido eliminado."
    else
        echo "Hubo un error al eliminar el usuario."
    fi
}

mostrar_menu() {
    echo "Selecciona una opción:"
    echo "1. Agregar un nuevo usuario"
    echo "2. Buscar y eliminar un usuario"
    echo "3. Salir"
    read -p "Ingresa tu opción: " opcion

    case $opcion in
        1)
            agregar_usuario
            ;;
        2)
            eliminar_usuario
            ;;
        3)
            echo "Saliendo del script."
            exit 0
            ;;
        *)
            echo "Opción inválida. Por favor, elige una opción válida."
            ;;
    esac
}

while true; do
    mostrar_menu
done
