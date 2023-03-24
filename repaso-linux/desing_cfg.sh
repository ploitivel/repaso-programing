#!/bin/bash

#sudo apt install cowsay

#AMARILLO="\e[33m"
#ROJO="\e[;31m"
#CELESTE="\e[;36m"
#NOCOLOR="\e[0m"
#DEFECTO="\e[39m"
#VERDE="\e[32m"
#AZUL="\e[34m"
#
#NEGRITA="\e[1m"
#SUBRAYADO="\e[4m"
#PARPADEO="\e[5m"

comando(){
    DEFECTO="\e[39m"
    VERDE="\e[32m"
    NEGRITA="\e[1m"
    PARPADEO="\e[5m"
    NONEGRITA="\e[21"
    FORMAT="\e[0m"
    echo -e "$NEGRITA $DEFECTO $ $1  $VERDE -> $2 $FORMAT"
}

titulo(){
    AMARILLO="\e[33m"
    DEFECTO="\e[39m"
    VERDE="\e[32m"
    NEGRITA="\e[1m"
    FORMAT="\e[0m"
    echo ""
    echo -e "$AMARILLO////////////////////////////////////////////////////////////////////////////"
    echo -e "////////////////////////////////////////////////////////////////////////////"
    echo -e "                     $NEGRITA $DEFECTO $1 $FORMAT $AMARILLO"
    echo -e "////////////////////////////////////////////////////////////////////////////"
    echo -e "//////////////////////////////////////////////////////////////////////////// $DEFECTO"
    echo ""
}

text(){
    DEFECTO="\e[39m"
    echo ""
    echo -e "$DEFECTO $1 $DEFECTO"
    echo ""
}