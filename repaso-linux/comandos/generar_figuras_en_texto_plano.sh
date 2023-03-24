#!/bin/bash


source ./desing_cfg.sh

printf "$(

titulo 'Generar figuras en texto plano'
comando "sudo apt install cowsay" "instalar la herramineta COWSAY"
comando "cowsay -l" "ver la lista de figuras disponibles"
comando "cowsay 'Feliz viernes a todos'" ""
comando 'cowthink -f tux "Ser o no ser."' "Muestra un globo de pensamiento en vez de uno de discurso"
comando 'cowsay -f ghostbusters "Este sistema fantasma será eliminado" > /etc/motd' "operador de redirección para guardar el resultado del siguiente comando en /etc/motd"
text "La próxima vez que un usuario inicie sesión verá el simpático mensaje"

)"

