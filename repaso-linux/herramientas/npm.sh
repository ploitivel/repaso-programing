
##########################################################################
#Verifcar los paquetes que están desactualizados u onsoletos.
#########################################################################

#FORMA 1
sudo npm i -g npm-check-updates
#FORMA 2
#Si desea saber qué paquetes están desactualizados y cuáles se pueden actualizar,
npm outdated
#FORMA 3 
$ npx npm-check-updates
Checking /n-app/package.json
[====================] 3/3 100%

 axios      ^0.21.2  →  ^0.27.2     
 node-sass   ^4.0.1  →   ^7.0.1     
 webpack    ^4.73.0  →  ^5.73.0     

###################################################################################
#Actualizar un paquete a la versión más reciente (principal, secundaria y parche), 
###################################################################################

#FROMA 1: 
#agregue la @latest palabra clave al final del nombre del paquete, por ejemplo:
npm i express-mongo-sanitize@latest
#esto actualizará express-mongo-sanitize de la versión 1.2.1, por ejemplo, a la versión 2.2.0 .

#FORMA 2
#instale NCU y luego ejecútelo solo para ese paquete. Esto saltará a lo último real.
npm install -g npm-check-updates
ncu -f your-intended-package-name -u

#FORMA 3 Luego actualice el paquete o paquetes que desee manualmente como:
npm update --save package_name
#De esta manera no es necesario actualizar su package.json archivo local.

###################################################################################
#Actualizar todos los paquetes 
###################################################################################

#FORMA 4 escribe una versión más nueva en package.json
npx npm-check-updates -u
npx npm-check -u

#instala todos los paquetes
ncu -u

#Primero probará cada dependencia que tenga y ejecutará pruebas, si las pruebas fallan, actualizará cada dependencia una por una y ejecutará pruebas después de cada actualización.
ncu --doctor -u


###################################################################################
#INstalar todos las dependencias y herramientas
###################################################################################

#Recomendaciones para evitar errores
#*Solucione el código de error npm 1 actualizando sus dependencias 
#*instalar la versión de nodo recomendada para la mayoría de los usuarios

#Instala las dependencias de package.json
npm install
#INstala las dependecias con fuerza bruta
npm install --legacy-peer-deps
npm install <package-name> --legacy-peer-deps
--forceo . --legacy-peer-deps


