#!/bin/bash
barra(){
  b="="
  for ((i=0;i<=15;i++));do 
    b+="="
  done
  echo "$b"
}
tareas=()
mostrarTareas(){
  i=1
  for tarea in "${tareas[@]}"; do 
    echo "$i) $tarea"
    i=$(("$i"+1))
  done 
}
main(){
  while true; do 
    barra
    echo "TO DO LIST"
    barra
    echo "1: Agregar Tarea: "
    echo "2: Ver Tareas Pendientes"
    echo "3: Eliminar Tareas"
    echo "4: Actualizar Tareas"
    echo "5: Salir del programa"
    read -p "Ingrese una opcion: " opcion
    echo ""
    if (( "$opcion"==1 )); then 
      read -p "Ingrese nueva Tarea: " nTarea
      tareas+=("$nTarea")
      mostrarTareas
      echo "Tarea Agregada con exito"
      echo ""
    elif (( "$opcion" == 2)); then 
      echo ""
      echo "Lista de Tareas Pendientes: "
      mostrarTareas
      echo ""
    elif (( "$opcion"==3 )); then 
      echo ""
      mostrarTareas
      read -p "Ingrese el numero de la tarea a Eliminar: " tarea
      cant=${#tareas[@]}
      if (( tarea > 0 && tarea <= cant )); then 
        unset tareas[$((tarea -1))]
        echo "Tarea Eliminada con exito"
        echo ""
        mostrarTareas
      else 
        echo "La tarea no existe!!"
      fi
      echo ""
    elif (( "$opcion"==4)); then 
      echo ""
      mostrarTareas
      read -p "Ingrese el numero de la tarea a Actualizar: " tra
      cant=${#tareas[@]}
      if (( tra > 0 && tra <= cant)); then
        read -p "Ingrese Nueva tarea a realizar: " nTarea
        tareas[$((tra-1))]="$nTarea"
        echo "Tarea Actualizada con exito!!!"
        mostrarTareas
      else 
        echo "La Tarea No existe"
      fi
      echo ""
    elif (( "$opcion" == 5 )); then 
      echo ""
      barra
      echo "Gracias Por su visista vuelva pronto"
      barra
      echo ""
      break
    else 
      echo "Opcion no Valida"
    fi
  done
}
main
