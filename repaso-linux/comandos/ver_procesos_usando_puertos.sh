#!/bin/bash

priv(){
#-------------------------------------------------------------------------#
#----------------------Programas o procesos usando los puertos-------------------------------#
#-------------------------------------------------------------------------#

#FROMA1
netstat -tulpn | grep :80   #Veremos el servicio que está enlazado al puerto 80 del interfaz de red.
> netstat -nepal|grep 8080
sudo netstat -tupln #le mostrará el PID (2472).

#FORMA 2
lsof -i :25 |grep LISTEN #lsof (List Open Files) para obtener una lista de los ficheros abiertos del equipo. Obtenemos el proceso asociado al puerto 25.

#FORMA 3
#El comando ss es la versión moderna del comando netstat.
ss -lptn 'sport = :25'
#Obtenemos el proceso asociado al puerto 25.
}

source ./desing_cfg.sh

printf "$(
    titulo "Programas o procesos usando los puertos"
    text "Todos estos comando leen los procesos en el puerto 80"
    comando "netstat -nepal | grep 80"
    comando "netstat -tulpn | grep :80"
    comando "netstat -tulpn" "le mostrará el PID Ejemplo: (2472)"
    comando "lsof -i :80 |grep LISTEN" "lsof (List Open Files) para obtener una lista de los ficheros abiertos del equipo."
    comando "ss -lptn 'sport = :80'" "ss es la versión moderna del comando netstat"
)"
