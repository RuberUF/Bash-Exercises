#!/bin/bash

a="" # Espaciado inicial vacío
b=""
for (( i=0; i<=100; i++ )); do

carrito="
$a      ______
$a     /|_||_\`.__
$a$b  (   _    _ _\\
$a    =\`-(_)--(_)-'
$a       ~ ~    ~ ~
"

    echo "$carrito"
    sleep 0.08
    clear
    b=💨
    a+=" " 
done

