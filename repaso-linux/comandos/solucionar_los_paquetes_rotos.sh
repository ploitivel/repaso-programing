
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
