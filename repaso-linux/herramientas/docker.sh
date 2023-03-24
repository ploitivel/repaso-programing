########################################################
################ Administrar imagenes  #############
########################################################

#LIstar imagenes descargadas en el sistema
$ docker images
$ docker images | head

#Descargar imagen
$ docker pull <nombre de imagen>
#Para saberel nombre de la imagen a descargar es necesario acceder a https://hub.docker.com/
#Las imagenes apline son ligeras y optimizadas
$ docker pull node #Descarla la ultima version
$ docker pull node:14.21.1 #DEscarga la version especifica

#Especificar la maquina en donde se va a ejecutar 
$ docker pull --plataform linux/x86_64 mysql

#ELiminar una imagen 
$ docker image rm <nombre_de_imagen>



########################################################
################ Administrar contenedores  #############
########################################################

$ docker container [COMMAND]

  [COMMAND]
  attach  ->  Adjuntar flujos de error, salida y entrada estándar local a un contenedor en ejecución
  commit  ->  crea una nueva imagen a partir de los cambios de un contenedor
  cp      ->  copia archivos/carpetas entre un contenedor y el sistema de archivos local
  create  ->  Crear un nuevo contenedor
  diff    ->  Inspecciona cambios en archivos o directorios en el sistema de archivos de un contenedor
  exec    ->  ejecuta un comando en un contenedor en ejecución
  export  ->  exporta el sistema de archivos de un contenedor como un archivo tar
  inspect ->  mostrar información detallada sobre uno o más contenedores
  kill    ->  mata uno o más contenedores en ejecución
  logs    ->  Obtener los registros de un contenedor
  ls      ->  lista de contenedores
  pause   ->  Pausa todos los procesos dentro de uno o más contenedores
  port    ->  lista de asignaciones de puertos o una asignación específica para el contenedor
  prune   ->  Retire todos los contenedores detenidos
  rename  ->  Cambiar el nombre de un contenedor
  restart ->  reinicia uno o más contenedores
  rm      ->  Eliminar uno o más contenedores
  run     ->  ejecutar un comando en un nuevo contenedor
  start   ->  inicia uno o más contenedores detenidos
  stats   ->  muestra una transmisión en vivo de las estadísticas de uso de recursos de los contenedores
  stop    ->  Detiene uno o más contenedores en ejecución
  top     ->  Muestra los procesos en ejecución de un contenedor
  unpause ->  Reanuda todos los procesos dentro de uno o más contenedores
  update  ->  actualizar la configuración de uno o más contenedores
  wait    ->  bloquee hasta que uno o más contenedores se detengan, luego imprima sus códigos de salida


########################################################
################ CREAR CONTENEDOR ############
########################################################

#Crear un contenedor
$ docker create mongo     #Forma corta  
$ docker container create mongo  #Forma larga

#CREAR CONTENEDOR CON ALIAS
$ docker create --name <nombre_del_contenedor> <imagen_de_referencia>
Ejemplo: docker create --name monguito mongo

#Especificar el puerto que queremos mapear del contenedor
$ docker create -p27017 --name monguito2 mongo



########################################################
################ CORRER EL CONTENEDOR QUE ESXISTE ##################
########################################################

#Iniciar uno o más contenedores detenidos
#Correr el contenedor con id
$ docker start <id_del_contenedor>
#Correr el contenedor con el alias
$ docker start <alias_del_contenedor>

Uso: docker start [OPTIONS] CONTAINER [CONTAINER...]
Opciones:
   -a, --attach : adjuntar STDOUT/STDERR y señales de reenvío
       --detach-keys string : anula la secuencia de teclas para separar un contenedor
   -i, --interactive: Adjunte el STDIN del contenedor




##################################################################
############## CORRER UN CONTENEDOR QUE NO EXISTE ################
##################################################################

$ docker run <nombre_de_imagen>
#1 ->Verifica si se encientra la imagen si no se encuentra la descarga de forma automatica
#2 ->Crea un contenedor 
#3 ->Inicia el contenedor
$ docker run -d <nombre_de_imagen> #Evita ecuchar los logs

#El nombre del contenedor lo pone de forma automatica si no se especifica
#EL puerto lo pone por defecto sino se especifica
$ docker run --name <nombre_del_contenedor> -p27017:27017 -d <nombre_de_imagen>

Ejemplo:
docker run -e MYSQL_ROOT_PASSWORD=mi-contraseña mysql

docker run  <nombre_de_imagen> --rm #--rm para eliminar el contenedor despues de ejecutarlo

########################################################
################ VER CONTENEDORES CORRIENDO ############
########################################################

#List de containers: Para saber si el contenedor corre de maner correcta
$ docker container ls, ps, list [OPCIONES]  #Forma Larga
$ docker ps [OPCIONES]    #Forma corta

Opciones:
-a, --all                -> Mostrar todos los contenedores (el valor predeterminado muestra solo en ejecución)
-f, --filter filter      -> Filtrar la salida según las condiciones proporcionadas
     --cadena de formato -> Contenedores de impresión bonita usando una plantilla de Go
-n, --last int           -> Mostrar n últimos contenedores creados (incluye todos los estados)
                         -> (predeterminado -1)
-l, --latest             -> Muestra el último contenedor creado (incluye todos los estados)
     --no-trunc          -> No truncar la salida
-q, --quiet              -> Solo mostrar ID de contenedores
-s, --size               -> Mostrar tamaños de archivo totales
                        
#Ejemplos:
$ docker ps -n 2   #Muestra los 2 ultimos contenedores creados    
$ docker ps -l  # Muestra el último contenedor creado 
$ docker ps -a #Mostrar todos los contenedores

 
CONTAINER ID   IMAGE     COMMAND                  CREATED       STATUS                        PORTS     NAMES
e00e201e545a   mongo     "docker-entrypoint.s…"   2 hours ago   Exited (132) 22 seconds ago             nostalgic_mendeleev



####################################################
############ ESCUCHAR EL CONTENEDOR ################
####################################################

# Para saber si el contenedor se ejecuto de manera correcta
$ docker logs <alias_o_id_del_contenedor>

#Escuchar los logs en tiempo real 
$ docker logs --follow <alias_o_id_del_contenedor>


####################################################
############ ACCEDER A UN CONTENEDOR ################
####################################################

#NOTA: FUNCIONA SOLO EN EJECUCION

docker exec –it <nombre de contenedor> /bin/bash
#Nota: Si desea conectarse a un contenedor como usuario root, asegúrese de tener autorización de usuario root en la máquina host y, a continuación, 
#conéctese al contenedor utilizando el mandato siguiente:
docker exec –it --user root <nombre de contenedor> /bin/bash

Vamos a acceder a un contenedor como usuario root. Para ello tenemos que utilizar la opción -u seguido del usuario, en este caso root. 
Por ejemplo, para acceder dentro de un contenedor llamado nextcloud, utilizaríamos:

docker exec -it -u root nextcloud /bin/bash

###############################################
############### DOCKERFILE ####################
###############################################

#Se utiliza para crear nuestros containers
#Imagen en la que se va a basar  (IAMGEN PADRE)
FROM imagen
#Ejemplo :
FROM node 
FROM node:18-alpine

WORKDIR #lugar donde aremos todo nuestro trabajo.
#Todos los comandos se ejecutaran en este directorio

#Carpeta donde vamos a meter el codigo fuente de nuestra aplicacion 
RUN mkdir -p /home/app
#RUN nos va a permitir ejecutar comandos de linux

#Copy nos permite mover el codigo fuente a el contenedor de compose 
COPY . /home/app

#EXPONER UN PUERTO PARA CONECTARNOS A EL CONTENEDOR 
EXPOSE 3000

RUN yarn install --production #COmando para preparar y compilar nuestra aplicacion

#COMANDO A EJECTAR CUANDO INICIE EL CONTENEDOR PARA QUE NUESTRA APLICACION CORRA
CMD ["node","/home/app/index.js"] 


#######################################################################################
############ construir un contenedor a partir de un archivo Dockerfile ################
#######################################################################################

docker build . #Genera un nombre aleatorio

docker build -t nombreapp:1.0.0 . #Genera un nombre estandar
# el "." es la ruta actual 

#Colpila desde 0 la imagen
docker build . --no-cache --rm  

docker run nombreapp #Para lanzar el contenedor
docker run -p 3000:3000 nombreapp -d

docker run -v /var/www/app -p 3000:3000 -d nombreapp #Para que los datos sean persistentes


#Renombrar contenedor 
docker tag nombreuser/nombreapp:v2 id_del_contenedor
Ejemplo docker tag pablokabs/appgetstarter:v2 32452365214

#SUbir contenedor a docker hub
docker push nombreapp



###########################################################################
#################### Administrar redes DE CONTENEDORES ####################
###########################################################################
#Una red Permite que los contenedores se puedan comunicar entre ellos
Uso:  docker network COMMAND
Commands:
connect     ->  Conectar un contenedor a una red
create      ->  Crear una red
disconnect  ->  Desconectar un contenedor de una red
inspect     ->  Mostrar información detallada sobre una o más redes
ls          ->  Lista de redes
prune       ->  Eliminar todas las redes no utilizadas
rm          ->  Eliminar una o más redes

Ejecute 'docker network COMMAND --help' para obtener más información sobre un comando.                                    

#Crear red 
docker network create nombre_de_red
#Ejemplo: docker network create tudusapp
#docker network create mi-primera-red 



######################################################################
############### EJEMPLO CREAR CONTENEDOR MYSQL    ####################
######################################################################

docker run -d  
--name some-mysql 
--network nombre_de_red --network-alias mysql 
-v mysql-data:/var/lib/mysql 
-e MYSQL_ROOT_PASSWORD=my-secret-pw 
-e MYSQL_DATABASE=namedb 
mysql:tag


--network ->       NOmbre de la red a la que va a pertenecer
--network-alias -> NOs permintira apuntar al contenedor con el nombre sin apuntar hacia la ip
-v ->              Directorio local para los datos persistentes en mysql-data (crea el directorio local) y lo monta en /var/lib/mysql del contenedor
                   SI por segunda ocacion creamos otra imagen y la apuntamos al directorio local va recuperar los datos
some-mysql ->      nombre que desea asignar a su contenedor
nombre_de_red ->   nombre a la red que va apertenecer
my-secret-pw ->    la contraseña que se establecerá para el usuario root de MySQL
namedb ->          nombre de la base de datos
tag ->             es la etiqueta que especifica la versión de MySQL que desea.


#EJEMPLO CLEANDO CONTENEDOR MYSQL
docker run -d --name container-mysql --network mi-primera-red --network-alias mysql -v mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=mysqldb mysql:5.7 

#Sesion interactiva dentro del contenedor mysql
docker exec -it 2b9e5b544b58 mysql -p 

######################################################################
############### #COntenedor que permite resolver la ip  ##############
######################################################################

#COntenedor que permite resolver la ip
docker run -it --network nombre_de_red nicolaka/netshoot
dig mysql











