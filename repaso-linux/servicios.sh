#SERVICIOS 

#U servicio es un programa que se ejecuta en segundo plano, fuera del control interactivo de los usuarios del sistema,
#Esto con el fin de proporcionar aún más seguridad, pues algunos de estos servicios son cruciales para el funcionamiento del sistema operativo.
#Los servicios también se conocen como daemons.


#------------------------------------------------------#
#----------------LISTAR SERVICIOS----------------------#
#------------------------------------------------------#
#Cuando ejecutes el comando, verás todos los servicios que están en el sistema. 
sudo systemctl list-unit-files --type service --all


Ls servicios:
habilitados (Enabled) son los que se están ejecutando actualmente. Generalmente estos no tienen problemas.
deshabilitados (Disabled) son los que no están activos, pero se pueden activar en cualquier momento sin ningún problema.
enmascarados (Masked) no se ejecutarán a menos que les quites esa propiedad.
estáticos (Static) solo se utilizarán en caso de que otro servicio o unidad los necesite.
generados (generated) a través de un initscript SysV o LSB con el generador systemd.


#servicios que están activos
sudo systemctl | grep running

#La ruta donde debemos ir para ver todos y cada uno de los servicios es 
/etc/systemd/system/

#INICIAR UN SERVICIO
sudo systemctl start [nombre_servicio]

#DETENER UN SERVICIO
sudo systemctl stop [nombre_servicio]

#VERIFICAR ESTADO DE UN SERVICIO
sudo systemctl status [nombre_servicio]

# ejecutar un servicio mientras se carga el sistema operativo:
sudo systemctl enable [nombre_servicio]

#O eliminarlo de la carga inicial:
sudo systemctl disable [nombre_servicio]

#recargar todos los servicios de nuevo, muy útil por si modificamos varios de ellos, de esta forma, podremos hacerlo de forma global con todos.
sudo systemctl daemon-reload: 

#nos permite ver el registro generado por el servicio en cuestión, por si hay algún error a la hora de ejecutarlo, o algún aviso que podría dar lugar a futuros problemas.
journalctl -u ttrssupdate.service


#Verifiicar que puerto utiliza el servicio
#instalar netstat
sudo apt install netstat-nat
sudo netstat -plnt

#Linux: Qué proceso usa un puerto: netstat
netstat -tulpn | grep :80
#Para listar cualquier proceso que escuche el puerto 8080:
lsof -i:8080

ls -l /proc/2054/exe #Nos muestra la ruta completa a la que va asociado el proceso 
ls -l /proc/1648/exe


#¿Cómo elimino un proceso que se ejecuta en un puerto?

La solución larga es buscar el ID de proceso o el PID del servidor que 
escucha en cualquier puerto que esté ejecutando, como 8000. 
Puede hacerlo ejecutando netstat o lsof o ss. Obtenga el PID 
y luego ejecute el comando kill.

Este fuser 8080/tcp le imprimirá el PID del proceso enlazado en ese puerto.


#Y esto fuser -k 8080/tcp matará ese proceso.
kill -9 16085
#Para matar cualquier proceso escuchando el puerto 8080:
kill $(lsof -t -i:8080)
#O más violentamente:
kill -9 $(lsof -t -i:8080)


#Eliminar un servicio
systemctl stop [servicename] 
systemctl disable [servicename] 
rm /etc/systemd/system/[servicename] 
rm /etc/systemd/system/[servicename] 
# and symlinks that might be related 
rm /usr/lib/systemd/system/[servicename] 
rm /usr/lib/systemd/system/[servicename] 
# and symlinks that might be related 
systemctl daemon-reload 
systemctl reset-failed

Fuente: https://www.enmimaquinafunciona.com/pregunta/120820/como-eliminar-los-servicios-del-sistema


/usr/sbin/dnsmasq --test
/usr/sbin/dnsmasq --test --conf-dir=/etc/dnsmasq.d