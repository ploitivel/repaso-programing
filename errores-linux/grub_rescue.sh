Reinstalar Grub usando Grub REscue
Causas:
*Kernel dañado
*SI se tiene linux y posteriormente se instala windows es posible que windows sobreescriba el sector de arranque MBR
*MOdificacion de las particiones del desico 
*Gestor de arranque se corrope tras una actualizacion 

La solucion es aplicable si al iniciar el equipo se encuentra el siguiente mensaje
"Error:unknown filesystem entering recue mode"

escribir los siguientes comandos en el promt de grub REscue

#Lista el disco y las particiones. El disco duro como (hd0) y las particiones como (msdosx)
grub rescue> ls

#Identificar el sistema de archivos propio de linux 
#Ejemplo: Recuerdo que en el sistema de archivos se encuentra la particion /dev/sda7 por tanto se represetara como hd0,msdos7
grub rescue> ls (hd0,msdos7) #Recuerdo que aqui se encuentra la particion raiz
#Si no se recuerda probar en todas las particiones hasta obtener "Filesystem is ext4"

#Comprobar que es el sistema de archivos de debian donde se encuentra alojado el Grub 
grub rescue> ls (hd0,msdos7)/ 

#Comprobar que la particion tiene los archivos necesarios para reparar el arranque
grub rescue> ls (hd0,msdos7)/boot/grub

#Ya comprobado añadimos el prefijo correspondiente a la carpeta
grub rescue> set prefix=(hd0,msdos7)/boot/grub 

#Indicarl al sistema la raiz del grub
grub rescue> set root=(hd0,msdos7)

#Forzar la carga del modulo correcto

#OPCION 1 Predeterminado
grub rescue> insmod normal 
grub rescue> normal

#OPCION 2 Especifico
grub rescue> insmod (hd0,msdos7)/boot/grub/linux.mod
#Cargar kernel al Grub 
linux /boot/vmlinuz-4.3-4-generic-generic root=/dev/sda7

#Ejecutar comando boot para ver las opciones de inicio
boot

#Una vez dentro del la interfaz de debe reinstalar el grub

sudo grub-install /dev/sda
sudo update-grub




