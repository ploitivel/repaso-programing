
#-------------------------------------------------------------------------#
#----------------------INFORMACION DEL SISTEMA OPERATIVO------------------#
#-------------------------------------------------------------------------#

$ uname #El comando uname mostrará la información del sistema operativo, como puede ser la plataforma, la versión del Kernel utilizada, o la arquitectura del sistema.
$ uname -o #Este comando mostrará el nombre del Kernel utilizado, en este caso Linux.
$ uname -a #El comando mostrará el nombre del sistema operativo, en este caso GNU/Linux.  (arquitectura del ordenador) 
$ uname -m #Mostrará nombre del Kernel y del sistema operativo, arquitectura del sistema, el nombre de host, el procesador, etc.
umane -r #MUstra la version del kernel de linux

#Averiguar el número de versión de la distribución. funciona en cualquier sistema
cat /etc/*release  
cat /etc/os-release

lsb_release -d #Mostrara la distribución de Linux actual y el número de versión,
lsb_release -a #proporciona datos más detallados de la versión:
