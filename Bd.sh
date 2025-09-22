#!/bin/bash

USER="root"
PASSWORD="123456789"
DATABASE="Prueba12"

read -p "Ingrese Nuevo Registro: " Registro

mariadb -u"$USER" -p"$PASSWORD" << EOF
CREATE DATABASE IF NOT EXISTS ${DATABASE};
USE ${DATABASE};

CREATE TABLE IF NOT EXISTS Registro(
  idRegistro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  registro VARCHAR(100) NOT NULL
);

INSERT INTO Registro(registro) VALUES ('$registro');

SELECT * FROM Registro;
EOF
