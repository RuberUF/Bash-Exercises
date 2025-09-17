#!/bin/bash

barra(){
  b="=";
  for (( i=0 ; i<=15 ; i++ )); do 
    b+="="
  done
  echo "$b"
}

main(){
  barra
  echo "Network Monitor"
  barra
  echo "\n"
  read -p "Ingrese url: " url 
  if ping -c 1 "$url" &>/dev/null ; then
    echo "La red esta activa!!"
  else 
    echo "La red esta inactiva"
  fi
}
main
