#!/bin/bash
for archivo in *
do
  if [ -f "$file" ]; then
    extension="${file##*.}"
    if [[ "$extension" != "$file" ]]; then
      mkdir -p "$extension"
      echo "File: $archivo"
      echo "$archivo mv to $extension"
      mv "$archivo" "$extension"
    else
      mkdir -p withoutExtension
      mv "$archivo" withoutExtension/
    fi
  fi
done
