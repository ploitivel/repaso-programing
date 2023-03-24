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

