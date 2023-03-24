#-----------------------------------------------#
#----------------Cambiar Permisos---------------#
#-----------------------------------------------#

#Debemos además modificar los permisos un poco para asegurarnos que el permiso de lectura pueda ser aplicado a archivos y directorios para que las páginas puedan ser desplegadas correctamente
sudo chmod -R 755 /var/www

r (leer)     ->  4
w (escribir) ->  2
x (ejecutar) ->  1

r + w + x = 7

Propietario -> r + w + x = 7
Grupo       -> r + w + x = 7
Otros       -> r + w + x = 5

chmod 775

# -R recursivo #Cambia permisos dentro de toda la carpeta
chmod -R 755 /var/www