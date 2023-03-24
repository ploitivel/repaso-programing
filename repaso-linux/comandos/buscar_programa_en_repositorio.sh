
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
