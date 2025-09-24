#!/bin/bash

USER=""
PASSWORD=""
MOTOR_DB=""
DB_SELECCIONADA=""

ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[1;33m'
AZUL='\033[0;34m'
CYAN='\033[0;36m'
GRIS='\033[0;90m'
RESET='\033[0m'

mostrar_banner() {
    clear
    echo -e "${CYAN}"
cat << "EOF"
███████╗██████╗ ██████╗ ███████╗    ████████╗██╗   ██╗██╗  ██╗
██╔════╝██╔══██╗██╔══██╗██╔════╝    ╚══██╔══╝██║   ██║╚██╗██╔╝
███████╗██████╔╝██║  ██║█████╗         ██║   ██║   ██║ ╚███╔╝
╚════██║██╔══██╗██║  ██║██╔══╝         ██║   ██║   ██║ ██╔██╗
███████║██║  ██║██████╔╝███████╗       ██║   ╚██████╔╝██╔╝ ██╗
╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝       ╚═╝    ╚═════╝ ╚═╝  ╚═╝
           Gestor de Bases de Datos en Terminal
EOF
    echo -e "${RESET}\n"
}

animacion_carga() {
    local duracion=$1
    local mensaje=$2
    echo -n -e "${AMARILLO}$mensaje ${RESET}"
    local caracteres="/-\|"
    for (( i=0; i<$duracion; i++ )); do
        echo -n -e "${AMARILLO}${caracteres:$((i % ${#caracteres})):1}\b${RESET}"
        sleep 0.1
    done
    echo ""
}

encabezado() {
    clear
    mostrar_banner
    if [[ -n "$DB_SELECCIONADA" ]]; then
        echo -e "${VERDE}Conectado a: ${CYAN}$MOTOR_DB ${GRIS}| Usuario: ${CYAN}$USER ${GRIS}| Base de Datos: ${CYAN}$DB_SELECCIONADA${RESET}"
    else
        echo -e "${VERDE}Conectado a: ${CYAN}$MOTOR_DB ${GRIS}| Usuario: ${CYAN}$USER${RESET}"
    fi
    echo -e "${GRIS}------------------------------------------------------------------${RESET}"
}

ejecutar_sql() {
    local comando_sql=$1
    local mostrar_salida=${2:-true}
    local resultado

    resultado=$($MOTOR_DB -u "$USER" -p"$PASSWORD" -e "$comando_sql" 2>&1)

    if [[ $? -ne 0 ]]; then
        echo -e "${ROJO}Error:${RESET}\n$resultado"
        return 1
    fi

    if [[ "$mostrar_salida" == true ]]; then
        echo -e "${VERDE}Resultado:${RESET}\n$resultado"
    fi
    return 0
}

login() {
    mostrar_banner
    echo -e "${AMARILLO}Bienvenido a SGBD-Tux. Inicie sesión.${RESET}"
    while true; do
        read -p "Motor (mysql/mariadb): " MOTOR_DB
        if [[ "$MOTOR_DB" == "mysql" || "$MOTOR_DB" == "mariadb" ]]; then
            break
        else
            echo -e "${ROJO}Motor no válido.${RESET}"
        fi
    done
    read -p "Usuario de $MOTOR_DB: " USER
    read -sp "Contraseña: " PASSWORD
    echo ""
    if ! ejecutar_sql "SHOW STATUS;" false; then
        echo -e "${ROJO}Fallo en la conexión.${RESET}"
        exit 1
    fi
    animacion_carga 15 "Estableciendo conexión segura..."
}

menu_gestion_bd() {
    while true; do
        encabezado
        echo -e "${AZUL}--- Gestión de Bases de Datos ---${RESET}"
        echo "1. Listar Bases de Datos"
        echo "2. Crear Nueva Base de Datos"
        echo "3. Seleccionar una Base de Datos"
        echo "4. Eliminar una Base de Datos"
        echo "5. Volver"
        read -p "Opción: " opcion

        case $opcion in
            1) ejecutar_sql "SHOW DATABASES;";;
            2) read -p "Nombre: " nombre_bd
               ejecutar_sql "CREATE DATABASE IF NOT EXISTS \`$nombre_bd\`;" ;;
            3) ejecutar_sql "SHOW DATABASES;"
               read -p "Usar BD: " DB_SELECCIONADA
               if ejecutar_sql "USE \`$DB_SELECCIONADA\`;" false; then
                   echo -e "${VERDE}Usando '$DB_SELECCIONADA'.${RESET}"
                   menu_gestion_tablas
               else DB_SELECCIONADA=""; fi ;;
            4) ejecutar_sql "SHOW DATABASES;"
               read -p "Eliminar BD: " nombre_bd
               read -p "Confirmar (s/n): " confirmacion
               [[ "$confirmacion" == "s" ]] && ejecutar_sql "DROP DATABASE \`$nombre_bd\`;" ;;
            5) return;;
            *) echo -e "${ROJO}Opción no válida.${RESET}";;
        esac
        read -p "Enter para continuar..."
    done
}

menu_gestion_tablas() {
    while true; do
        encabezado
        echo -e "${AZUL}--- Tablas en '$DB_SELECCIONADA' ---${RESET}"
        echo "1. Listar Tablas"
        echo "2. Crear Tabla"
        echo "3. Describir Tabla"
        echo "4. Gestionar Registros"
        echo "5. Eliminar Tabla"
        echo "6. Volver"
        read -p "Opción: " opcion

        case $opcion in
            1) ejecutar_sql "USE \`$DB_SELECCIONADA\`; SHOW TABLES;";;
            2) read -p "Nombre: " nombre_tabla
               read -p "Columnas: " columnas
               ejecutar_sql "USE \`$DB_SELECCIONADA\`; CREATE TABLE \`$nombre_tabla\` ($columnas);" ;;
            3) ejecutar_sql "USE \`$DB_SELECCIONADA\`; SHOW TABLES;"
               read -p "Tabla: " nombre_tabla
               ejecutar_sql "USE \`$DB_SELECCIONADA\`; DESCRIBE \`$nombre_tabla\`;" ;;
            4) ejecutar_sql "USE \`$DB_SELECCIONADA\`; SHOW TABLES;"
               read -p "Tabla: " nombre_tabla
               menu_gestion_registros "$nombre_tabla" ;;
            5) ejecutar_sql "USE \`$DB_SELECCIONADA\`; SHOW TABLES;"
               read -p "Eliminar tabla: " nombre_tabla
               read -p "Confirmar (s/n): " confirmacion
               [[ "$confirmacion" == "s" ]] && ejecutar_sql "USE \`$DB_SELECCIONADA\`; DROP TABLE \`$nombre_tabla\`;" ;;
            6) return;;
            *) echo -e "${ROJO}Opción no válida.${RESET}";;
        esac
        read -p "Enter para continuar..."
    done
}

menu_gestion_registros() {
    local tabla=$1
    while true; do
        encabezado
        echo -e "${AZUL}--- Registros en '$tabla' ---${RESET}"
        echo "1. Ver todos"
        echo "2. Buscar"
        echo "3. Insertar"
        echo "4. Actualizar"
        echo "5. Eliminar"
        echo "6. Volver"
        read -p "Opción: " opcion

        case $opcion in
            1) ejecutar_sql "USE \`$DB_SELECCIONADA\`; SELECT * FROM \`$tabla\`;";;
            2) read -p "Condición: " condicion
               ejecutar_sql "USE \`$DB_SELECCIONADA\`; SELECT * FROM \`$tabla\` WHERE $condicion;" ;;
            3) read -p "Columnas: " columnas
               read -p "Valores: " valores
               ejecutar_sql "USE \`$DB_SELECCIONADA\`; INSERT INTO \`$tabla\` ($columnas) VALUES ($valores);" ;;
            4) read -p "Nuevos valores: " nuevos_valores
               read -p "Condición: " condicion
               ejecutar_sql "USE \`$DB_SELECCIONADA\`; UPDATE \`$tabla\` SET $nuevos_valores WHERE $condicion;" ;;
            5) read -p "Condición: " condicion
               read -p "Confirmar (s/n): " confirmacion
               [[ "$confirmacion" == "s" ]] && ejecutar_sql "USE \`$DB_SELECCIONADA\`; DELETE FROM \`$tabla\` WHERE $condicion;" ;;
            6) return;;
            *) echo -e "${ROJO}Opción no válida.${RESET}";;
        esac
        read -p "Enter para continuar..."
    done
}

menu_principal() {
    while true; do
        encabezado
        echo -e "${AZUL}--- Menú Principal ---${RESET}"
        echo "1. Gestionar Bases de Datos"
        echo "2. Consola SQL"
        echo "3. Salir"
        read -p "Opción: " opcion

        case $opcion in
            1) menu_gestion_bd;;
            2) echo -e "${AMARILLO}Entrando a consola SQL (exit para salir).${RESET}"
               $MOTOR_DB -u "$USER" -p"$PASSWORD" ;;
            3) echo -e "${CYAN}¡Hasta pronto!${RESET}"; exit 0 ;;
            *) echo -e "${ROJO}Opción no válida.${RESET}";;
        esac
        read -p "Enter para continuar..."
    done
}

main() {
    login
    menu_principal
}

main

