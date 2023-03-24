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

chown -R john:john /var/www/  #JOhn tomara todos los permisos 
