
#-----------------------------------------------#
#----------------Cambiar Propietario------------#
#-----------------------------------------------#

#cambiar el propietario de un archivo y una carpeta,
chown [propietario/grupo propietario] [nombre del archivo]
chown nuevo_propietario miarchivo.txt

#Cambiar el grupo propietario del archivo
chown :clientes miarchivo.txt

#Camabiar propietario de una carpeta 
sudo chown -R anon32 /var/www/html/
-R (recursivo). Esta opción te permite cambiar permisos o propietarios de todos los archivos y subdirectorios dentro de un directorio específico.

#Cambiar el propietario y el grupo al mismo tiempo.
chown hostinger:clientes miarchivo.txt

#combinar con chmod y chown. Cambiar permisos o propietarios de todos los archivos y subdirectorios dentro de un directorio específico.
chown -R 755 /etc/misarchivos


sudo chown -R $USER:$USER /var/www/pruebas.com/public_html
#La variable $USER tomará el valor del usuario con el cual actualmente estás identificado. Al hacer esto, nuestro usuario regular ahora es propietario de los directorios public_html donde se almacenará nuestro contenido.

#-----------------------------------------------#
#----------------Cambiar Permisos---------------#
#-----------------------------------------------#

#Debemos además modificar los permisos un poco para asegurarnos que el permiso de lectura pueda ser aplicado a archivos y directorios para que las páginas puedan ser desplegadas correctamente
sudo chmod -R 755 /var/www


#-----------------------------------------------#
#----------------Liminar Directorio-------------#
#-----------------------------------------------#

#omando “rm –r” (abreviatura de remove) y el nombre del directorio para eliminar toda la carpeta y su contenido.
rm -r archivos
sudo rm -r nombre del directorio


#-----------------------------------------------#
#----------------Crear Directorio---------------#
#-----------------------------------------------#
#Crear los directorios en cadena
sudo mkdir -p /var/www/ejemplo.com/public_html


#-----------------------------------------------#
#-----------------Mover directorios-------------#
#-----------------------------------------------#

#El comando mv mueve un directorio o un archivo (lo elimina de su ubicación original y lo "coloca" en una nueva ubicacion).

mv directorio ruta_de_destino/nombre_directorio

#Ejemplo 1 (mover el directorio img a un nivel por encima sin cambiarle el nombre)
mv img ../img

#Ejemplo 2 (mover el directorio img a la carpeta interna files cambiandole el nombre a images)
mv img files/images


#-----------------------------------------------#
#-------------Renombrar directorios-------------#
#-----------------------------------------------#

mv directorio directorio_renombrado

#Para renombrar directorios usamos el mismo comando mv, pero no es necesario indicar una nueva ruta para el directorio, solo un nuevo nombre.
#EEjemplo si queremos renombrar el directorio img a images lo haríamos así:
mv img images


#-------------------------------------------------------------------------#
#-------------Bloquear Futuras ACtualizaciones DE UN PROGRAMA-------------#
#-------------------------------------------------------------------------#

sudo apt-mark nombre_del_programa
#Ejemplo para bloquear futuras actualizaciones de Hostapd.
sudo apt-mark hold hostapd

#-------------------------------------------------------------------------#
#----------------------LOCALIZAR UN PROGRAMA INSTALADO------------------#
#-------------------------------------------------------------------------#

#Para saber que programas están instalados escribimos en un terminal:
dpkg --get-selections

#Si la lista es muy larga, podemos buscar solo el programa que necesitamos:
dpkg --get-selections | grep <NOMBRE DEL PROGRAMA>

#Y para saber donde está situado:
dpkg -L phyton-apt

whereis <NOMBRE DEL PROGRAMA> #Para saber donde esta instalado


#-------------------------------------------------------------------------#
#----------------------BUSCAR UN PROGRAMA NO INSTALADO------------------#
#-------------------------------------------------------------------------#

#si no conocemos el nombre exacto de lo que queremos instalar, apt nos dirá que no encuentra la aplicación que le estamos indicando. 
#Para esto, apt tiene una herramienta muy útil que nos permite buscar aplicaciones.

sudo apt-get update

#Para buscar una aplicación con apt desde la terminal usaremos apt-cache como sigue:
sudo apt-cache search nombre_aplicacion

#Buscar todas las aplicaciones que contengan una frase determinada
sudo apt-cache search "web server"
#apt nos devolverá un listado de las aplicaciones que contengan la cadena que le hemos especificado de modo que podemos saber el nombre exacto de lo que deseamos instalar.



#-------------------------------------------------------------------------#
#----------------------REMOVER O DESINSTALAR UN PROGRAMA------------------#
#-------------------------------------------------------------------------#

#Para eliminar un programa de tu distribución
sudo apt-get remove <Programa a desinstalar>

#Para desinstalar el programa y a su vez, eliminar todos los archivos asociados a el dentro de la distro, ejecuta:
sudo apt-get --purge remove [nombre del programa]

#«purge», APT se encargará de buscar todos los restos, dependencias que se hayan descargado e instalado al instalar el programa y las configuraciones que haya podido crear el programa. 

#dependencias que todavía se encontraban, serán igualmente desinstaladas.
sudo apt-get autoremove

#Comando completo para remover
sudo apt-get purge –auto-remove <Programa a desinstalar>

#Forzar la desinstalacion de un paquete
sudo dpkg --remove --force-remove--reinstreq nombre_paquete


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


#-------------------------------------------------------------------------#
#----------------------REINICIAR LA MAQUINA-------------------------------#
#-------------------------------------------------------------------------#

[ -f /var/run/reboot-required ] && sudo reboot -f


#-------------------------------------------------------------------------#
#----------------------------PAQUETES ROTOS-------------------------------#
#-------------------------------------------------------------------------#

Causas:
EL paquete no se instalo correctamente o no es compatible con el resto de PAQUETES
Depentendencias incumplidas opaquetes adicionales 

#Configurar paquetes desempaquetados pero no configurados
sudo dpkg --configure -a 

#Limpiar la cache local de paquetes 
sudo apt-get clean && sudo apt-get autoclean

#Regenerar la cache de los repositorios
sudo apt-get update --fix-missing

#COrregir las deendencias rotas
sudo apt-get install -f


#Averiguar que paquete causa los problemas 
sudo dpkg -l | grep ..r

sudo apt-get remove

#SI no funciona lo anterios Forzar la desinstalacion del un paquete que causa problemas
sudo dpkg --remove --force-remove--reinstreq nombre_paquete


#-------------------------------------------------------------------------#
#----------------------------NO SE PUEDE ACTUALIZAR REPOSITORIO-------------------------------#
#-------------------------------------------------------------------------#

#E: The repository 'http://ppa.launchpad.net/armagetronad-dev/ppa/ubuntu bionic Release' does not have a Release file. N: Updating from such a repository can't be done securely, and is therefore disabled by default. N: See apt-secure(8) manpage for repository creation and user configuration details.
#Elimina el repo 
sudo apt-add-repository -r ppa:armagetronad-dev/ppa
#actualiza la lista de paquetes. Después de esto puede instalar nuevos paquetes, actualizarlos o eliminarlos.
sudo apt update -q

#E: El repositorio «http://ppa.launchpad.net/kazam-team/stable-series/ubuntu hirsute Release» no tiene un fichero de Publicación.
sudo add-apt-repository -r ppa:<ppa to remove>
sudo add-apt-repository -r ppa:kazam-team/stable-series

sudo add-apt-repository -r ppa:lakinduakash/lwh

and471/kazam-daily-stable/
lakinduakash/lwh/
lakinduakash/lwh/
kazam-team/stable-series/
and471/kazam-daily-stable/





Como eliminar un repositorio PPA en Debian
Supongamos que en Debian hemos añadido un repositorio PPA a través de add-apt-repository y deseamos eliminarlo.

Abrimos un Terminal como root y removemos el programa asociado al PPA que deseamos eliminar.

Nos vamos a:

# cd /etc/apt/sources.list.d/
Listamos para ver su contenido:

# ls
Localizamos el ppa y procedemos a eliminarlo:

# rm nombre_del_ppa
Listamos para comprobar su eliminación:

# ls


subdirectorios





apt-get dist-upgrade



apt-get install build-essential


#POr si ay dependencias incumplidas
sudo apt --fix-broken install          

sudo apt autoremove

sudo apt install linux-headers-$(username -r) dkms

sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)

sudo aptitude install linux-headers-$(username -r)



sudo apt-get install build-essential linux-headers-`uname -r`
sudo apt-get install autoconf automake bc bison build-essential flex gcc g++ make python -y
sudo apt-get purge virtualbox

sudo sh -c 'echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -c | cut -f2) non-free contrib" >> /etc/apt/sources.list.d/virtualbox.org.list'

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-6.0


openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=VirtualBox/"

4.- Lo añadimos al kernel:

sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)


odprobe: FATAL: Module vboxdr not found in directory /lib/modules/5.14.0-kali4-amd64


modinfo: ERROR: Module vboxdrv not found.
sudo: /usr/src/linux-headers-5.14.0-kali4-amd64/scripts/sign-file: command not found


wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- \
  | gpg --dearmor \
  | sudo tee /usr/share/keyrings/virtualbox-archive-keyring.gpg

  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/virtualbox-archive-keyring.gpg] http://download.virtualbox.org/virtualbox/debian buster contrib" \
  | sudo tee /etc/apt/sources.list.d/virtualbox.list




wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O | sudo apt-key add -

wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O | sudo apt-key add -
 
🔹 Añadir repositorios a lista de recursos Kali:

echo "deb [arch=amd64] http://download.virtualbox.org/virtua... buster contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list