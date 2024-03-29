#Instale y administre varias versiones de Node.js en Linux
#Node Version Manager (NVM) es un script bash simple para administrar múltiples versiones activas de node.js en su sistema Linux.
#Para obtener más información, consulte nvm --help o vaya al repositorio de Github de Node Version Manager: https://github.com/nvm-sh/nvm.

#instalar o actualizar nvm en Linux, puede descargar el script de instalación automática usando las herramientas de línea de comando wget como se muestra.

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
#OR
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

#Luego de instalar NVM deben cerrar y abrir nuevamente el terminal para hacer efectiva la instalación.

####################################################3
###############INSTALAR NODE.JS#####################
###################################################33

#Nombre de las versiones
#Argon: Node 4.x
#Boron: Node 6.x
#Carbon: Node 8.x
#Dubnium: Node 10.x
#Erbidium: Node 12.x
#Fermium: Node 14.x
#Gallium: Node 16.x
#Hydrogen: Node 18.x

#listar todas las versiones LTS disponibles para descargar desde los repositorios oficiales de Node. 
#Si utilizan el comando sin el flag --lts, NVM listará todas las versiones disponibles de Node.
nvm ls-remote
#El término LTS hace referencia a Long Term Support, es decir, una versión que actualmente se encuentra con soporte por un período de 18 meses. Luego de transcurrido ese tiempo, la versión pasará a modo mantención por 12 meses.
nvm ls-remote — lts

#Para descargar, compilar e instalar la última versión del node:
nvm install node 
#Para instalar una versión de “node” específica,  
nvm install 10.15.3  	#or 8.16.0, 11.15.0 etc
#NVM automáticamente cambiará la versión a la última descargada.

#Verificar todas las versiones instaladas de node con el siguiente comando:
nvm ls

#Puede usar una versión de node.js en cualquier shell nuevo como se muestra:
nvm use node	 #use default version
nvm use 10.15.3  #Usar version especifica

#Permite desinstalar una versión específica de Node
nvm uninstall <VERSIÓN>

#Es importante destacar que puede ver la ruta al ejecutable donde se instaló una versión de nodo específica de la siguiente manera:

nvm which 10.15.3
nvm which system  #check system-installed version of a node using “system” alias
nvm which 12.2.0

#Además, para configurar manualmente una versión de nodo predeterminada que se utilizará en cualquier shell nuevo, utilice el alias "predeterminado" como se muestra.

nvm alias default 10.15.3
nvm alias default system
nvm alias default 12.2.0

Nota: 

Existe una solución que permite agilizar este proceso.
Puede crear un archivo de inicialización .nvmrc en el directorio raíz de su proyecto 
y agregar un número de versión de nodo o cualquier otro indicador u opción de uso que nvm comprenda. 
Por ejemplo
8.9.1
Luego mediante la consola, nos dirigimos a la carpeta del proyecto y escribimos nvm use para activar la versión correspondiente.


Para que ciertos paquetes de npm se ejecuten, también necesitamos ejecutar el comando sudo apt install build-essential.