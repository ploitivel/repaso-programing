
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