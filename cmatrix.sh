#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'
contador=0
clear
cadena=("M" "N" "B" "V" "C" "X" "Z" "   " "Ñ" "L" "K" "J" "H" "G" "F" "D" "S" "A" "P" "     " "O" "I" "U" "Y" "T" "R" " " " " "E" "W" "Q" "m" "n" "b" "v" "c" "x" "z" "ñ" "l" "p" "o" "i" "u" "y" "t" "r" "e" "w" "q" "1" "2" "   " "3" "4" "5" "6" "7" "8" "9" "0" "'" "  " "¿" "+" "}" "{}" "-" "." "," ":" ";" "[" "]" "|" "@" "!" "#" "$" "%" "&" "/" "  " "(" ")" "=" "?" "?" " ")

while true; do 
   
  q=$(( RANDOM % ${#cadena[@]} ))
  w=$(( RANDOM % ${#cadena[@]} ))
  e=$(( RANDOM % ${#cadena[@]} ))
  r=$(( RANDOM % ${#cadena[@]} ))
  t=$(( RANDOM % ${#cadena[@]} ))
  y=$(( RANDOM % ${#cadena[@]} ))
  u=$(( RANDOM % ${#cadena[@]} ))
  i=$(( RANDOM % ${#cadena[@]} ))
  o=$(( RANDOM % ${#cadena[@]} ))
  p=$(( RANDOM % ${#cadena[@]} ))
  a=$(( RANDOM % ${#cadena[@]} ))
  s=$(( RANDOM % ${#cadena[@]} ))
  d=$(( RANDOM % ${#cadena[@]} ))
  f=$(( RANDOM % ${#cadena[@]} ))
  g=$(( RANDOM % ${#cadena[@]} ))
  h=$(( RANDOM % ${#cadena[@]} ))
  j=$(( RANDOM % ${#cadena[@]} ))
  k=$(( RANDOM % ${#cadena[@]} ))
  l=$(( RANDOM % ${#cadena[@]} ))
  z=$(( RANDOM % ${#cadena[@]} ))
  x=$(( RANDOM % ${#cadena[@]} ))
  c=$(( RANDOM % ${#cadena[@]} ))
  v=$(( RANDOM % ${#cadena[@]} ))
  b=$(( RANDOM % ${#cadena[@]} ))
  A=$(( RANDOM % ${#cadena[@]} ))
  
  if (( contador<=100 )); then 
    echo -e "${GREEN} ${cadena[$q]} ${cadena[$w]}  ${cadena[$e]}   ${cadena[$r]}   ${cadena[$t]}   ${cadena[$y]} ${cadena[$u]} ${cadena[$i]}  ${cadena[$o]}   ${cadena[$p]}   ${cadena[$a]} ${cadena[$s]} ${cadena[$d]}  ${cadena[$f]}   ${cadena[$g]}   ${cadena[$h]}   ${cadena[$j]}   ${cadena[$k]} ${cadena[$l]} ${cadena[$z]}  ${cadena[$x]}   ${cadena[$c]}   ${cadena[$v]}   ${cadena[$b]}${cadena[$q]} ${cadena[$w]}  ${cadena[$e]}   ${cadena[$r]}   ${cadena[$t]}   ${cadena[$y]} ${cadena[$u]} ${cadena[$i]}  ${cadena[$o]}   ${cadena[$p]}   ${cadena[$a]} ${cadena[$s]} ${cadena[$d]}  ${cadena[$f]}   ${cadena[$g]}   ${cadena[$h]}   ${cadena[$j]}   ${cadena[$k]} ${cadena[$l]} ${cadena[$z]}  ${cadena[$x]}   ${cadena[$c]}   ${cadena[$v]}   ${cadena[$b]}${cadena[$q]} ${cadena[$w]}   ${cadena[$r]}   ${cadena[$t]} ${cadena[$z]}  ${cadena[$x]}  ${cadena[$A]}   ${NC}"
  
  else 
    echo -e "${GREEN} ${cadena[$q]} ${cadena[$w]}  ${cadena[$e]}   ${cadena[$r]}   ${cadena[$t]}   ${cadena[$y]} ${cadena[$u]} ${cadena[$i]}  ${cadena[$o]}   ${cadena[$p]}   ${cadena[$a]} ${cadena[$s]} ${cadena[$d]}  ${cadena[$f]}   ${cadena[$g]}   ${cadena[$h]}   ${cadena[$j]}   ${cadena[$k]} ${cadena[$l]} ${cadena[$z]}  ${cadena[$x]}   ${cadena[$c]}   ${cadena[$v]}   ${cadena[$b]}${cadena[$q]} ${cadena[$w]}  ${cadena[$e]}   ${cadena[$r]}   ${cadena[$t]}   ${cadena[$y]} ${cadena[$u]} ${cadena[$i]}  ${cadena[$o]}   ${cadena[$p]}   ${cadena[$a]} ${cadena[$s]} ${cadena[$d]}  ${cadena[$f]}   ${cadena[$g]}   ${cadena[$h]}   ${cadena[$j]}   ${cadena[$k]} ${cadena[$l]} ${cadena[$z]}  ${cadena[$x]}   ${cadena[$c]}   ${cadena[$v]}   ${cadena[$b]}${cadena[$q]} ${cadena[$w]}   ${cadena[$r]}   ${cadena[$t]} ${cadena[$z]}  ${cadena[$x]}  ${cadena[$A]}   ${NC}"
    sleep 0.02s
  fi
  contador=$(( $contador + 1))
done

