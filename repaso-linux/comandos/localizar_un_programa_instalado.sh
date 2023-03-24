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
