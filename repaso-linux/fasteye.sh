#!/bin/bash

#sudo apt install cowsay

AMARILLO="\e[33m"
ROJO="\e[;31m"
CELESTE="\e[;36m"
NOCOLOR="\e[0m"
DEFECTO="\e[39m"
VERDE="\e[32m"
AZUL="\e[34m"

NEGRITA="\e[1m"
SUBRAYADO="\e[4m"
PARPADEO="\e[5m"

echo -e $AMARILLO

echo " ------    ---    ------ --------- -------- ---   --- --------"
echo " ---      -- --   ----      ---    ---        -- --   ------"
echo " ----    --   --    ----     -     ------       -     ---"  
echo " --     --     -- ------     -     --------     -     --------"

cowthink -f eyes "Si todo parece estar bajo control, no vas lo suficientemente rápido. " 
echo -e  $NEGRITA

ruta=comandos
chmod +x $ruta/ *
lista_archivos="$(ls $ruta)"
ARCHIVO=$(echo $lista_archivos | tr " " "\n") #Divide la cadema en array a traves de los espacio

num=1
for archivo in $ARCHIVO
do
    archivo=${archivo//.sh} #Elimina .sh del string
    archivo=${archivo^} #COnvierte primera letra en mayuscula
    archivo="[ $((num++)) ] $(echo $archivo | tr '_' ' ') " #Remplaza el guion por espacios
    echo $archivo
done

echo -e $DEFECTO " "
read -p "Escribe un numero de tema > " numero_tema 
echo " "

num_increment=1
open_file=""
for archivo in $ARCHIVO
do
    if [[ $num_increment -eq $numero_tema ]]; then
         open_file=$archivo
         break
         #exit 0
    else
         num_incremen="$((num_increment++))"
    fi
done

bash $ruta/$open_file







