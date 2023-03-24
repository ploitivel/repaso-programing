
#################################################################
#########Matando procesos de puertos abiertos en Linux############3
################################################################

#FROMA 1
#Visualizar los procesos: $ sudo ps -fA | grep python
#Matando el proceso requerido: $ sudo kill -15 PID    "O"   $ sudo kill -9 PID
$ sudo kill -9 4536
#Esto es un ejemplo para matar el proceso de una app que dejó abierto un puerto UDP, y que con el primer comando se identificó su número de proceso 4536

#FROMA 2

#lista todos los puertos de escucha:
netstat -antu

#Toma el correspondiente, digamos 80 y mátalo usando esto:
kill -9 $( lsof -i:80 -t )
