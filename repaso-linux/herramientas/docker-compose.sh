
###########################################################
##################### DOCKER COMPOSE ######################
###########################################################

Usage:  docker compose [OPTIONS] COMMAND

[OPTIONS]:
       --ansi string               Controla cuándo imprimir los caracteres de control ANSI ("nunca"|"siempre"|"automático") (predeterminado "automático")
       --compatibility             Ejecutar componer en modo de compatibilidad con versiones anteriores
       --env-file string           Especifique un archivo de entorno alternativo.
   -f, --file stringArray          Componer archivos de configuración
       --profile stringArray       Especifique un perfil para habilitar
       --project-directory string  Especifique un directorio de trabajo alternativo
                                    (predeterminado: la ruta del primer archivo Compose especificado)
   -p, --project-name cadena       Nombre del proyecto

[COMMAND]:
   build     -> Construir o reconstruir servicios
   convert   -> Convierte el archivo de composición al formato canónico de la plataforma
   cp        -> Copiar archivos/carpetas entre un contenedor de servicios y el sistema de archivos local
   create    -> Crea contenedores para un servicio.
   down      -> Detener y eliminar contenedores, redes
   events    -> Recibir eventos en tiempo real de los contenedores.
   exec      -> Ejecutar un comando en un contenedor en ejecución.
   images    -> Lista de imágenes utilizadas por los contenedores creados
   kill      -> Forzar la detención de contenedores de servicio.
   logs      -> Ver salida de contenedores
   ls        -> Lista de proyectos de composición en ejecución
   pause     -> Pausa servicios
   port      -> Imprime el puerto público para un enlace de puerto.
   ps        -> Lista de contenedores
   pull      -> Extraer imágenes de servicio
   push      -> Imágenes de servicio push
   restart   -> Reiniciar contenedores de servicio
   rm        -> Elimina contenedores de servicio detenidos
   run       -> Ejecutar un comando único en un servicio.
   start     -> Iniciar servicios
   stop      -> Detener servicios
   top       -> Mostrar los procesos en ejecución
   unpause   -> reanudar servicios
   up        -> Crear e iniciar contenedores
   version   -> Mostrar la información de la versión de Docker Compose

Ejecute 'docker compose COMMAND --help' para obtener más información sobre un comando.


#############################################################################
############### ESTRUCTURA DE UN ARCHIVO docker-compose.yml #################
#############################################################################

#Docker compose es una herramienta que te permite manejar aplicaciones que consisten en multiples contenedores de Docker.
#Docker-compose es simplemente un archivo con extensión y formato yml Con la configuración que deseemos y lo ejecutamos

$ touch docker-compose.yml

version: '3.8'   #versión de docker compose que se utilizará

#sección de servicios
# Cada servicio contará con sus propias variables de configuración y sus respectivos valores.
services:       
  #El nombre que usemos para cada servicio nos servirá como una referencia para su uso en otros servicio
   nombre_del_primer_servicio:
      variable_de_configuracion:
         valores
      variable_de_configuracion:
         valores
   nombre_del_segundo_servicio:
      variable_de_configuracion:
         valores
   #Ejemplo
   db:
      image: postgres

   #En el caso de que necesitamos una imagen personalizada será mejor usar un Dockerfile.
   webapp:
      build: ./ubicacion_del_Dockerfile
      #Dockerfile personalizado, en lugar del predeterminado, especificando en context el lugar donde se encuentra y en dockerfile su nombre. 
      #Esto es bastante útil pues nos permite especificar diferentes archivos para producción o para desarrollo.
      build:
         context: ./ubicacion_del_Dockerfile
         dockerfile: Dockerfile-personalizado
      #Command sobreescribe el comando predeterminado del contenedor. Esta opción es ideal para ejecutar un comando cuando inicia un servicio, por ejemplo un servidor web.
      command: python manage.py runserver 0.0.0.0:8000
      #Ports nos dice los puertos que expondremos al exterior y a cual puerto de nuestra máquina se vincularán, siempre en el formato de HOST:CONTENEDOR.
      ports:
         - "80:8000"  #HOST:CONTENEDOR
         - "80:8000/udp" #También podemos especificar el protocolo udp o tcp.
      
      #Expose también expone puertos, la diferencia con ports es que los puertos solo estarán disponibles para los servicios vinculados, no para la máquina desde donde estamos ejecutando $ docker-compose.
      expose:
         - '6379'
      #Arrancar el servicio web solo si ya se han cargado todos los demás servicios especficados. En el ejemplo anterior $ docker-compose ejecutará el servicio web solo si ya están disponibles los servicios db y redis.
      depends_on:
         - db
         - redis
      #La configuración environment nos permite establecer una lista de variables de entorno que estarán disponibles en nuestro servicio.
      environment:
         - POSTGRES_USER=usuario
         - POSTGRES_PASSWORD=contrasena
      #También podemos usar una sintaxis tipo diccionario en lugar de la de arriba.
      environment:
         MODE: development
         DEBUG: 'true'
         #variables de entorno secretas
         SECRET_KEY:      #Si no especificamos un valor para una variable de entorno y dejamos su valor en blanco, $ docker-compose la tomará de la máquina donde se esté ejecutando $ docker-compose.
   
      #env_file: Si queremos cargar múltiples variables de entorno, en lugar de especificar las variables una por una, en nuestro archivo usaremos env_file.
      env_file:   common.env
      #healthcheck Este comando es para corroborar el estado de un servicio de manera periódica. podemos crear un comando que nos permita saber si nuestro contenedor está corriendo de manera correcta.
      healthcheck:
         test: ["CMD", "curl", "-f", "http://localhost"]
         interval: 1m30s  # Healtcheck va a ejecutar un curl a localhost, cada minuto y medio
         timeout: 10s #si el comando tarda más de 10 segundos en devolver un resultado lo considerará como un fallo
         retries: 3 #si un fallo ocurre más de 3 veces el servicio se considerará “no saludable”.
         start_period: 40s
      #HOST:CONTENEDOR ubicación en tu sistema o también el nombre de un volumen que hayas creado con docker.
      volumes:
         - "/var/run/postgres/postgres.sock:/var/run/postgres/postgres.sock"
         - "dbdata:/var/lib/postgresql/data"
         #Opcionalmente podemos especificar si el uso de volúmenes será de solo lectura o de lectura y escritura, con “ro” y “rw”, respectivamente.
         - "dbdata:/var/lib/postgresql/data:ro"
      #Con restart podemos aplicar políticas de reinicio a nuestros servicios
      restart: "on-failure"
         #La opción restart puede tomar varios valores
         #no: nunca reinicia el contenedor
         #always: siempre lo reinicia
         #on-failure: lo reinicia si el contenedor devuelve un estado de error
         #unless-stopped: lo reinicia en todos los casos excepto cuando se detiene


#############################################################################
################## Comandos básicos de docker compose    ####################
#############################################################################

#Compilar un archivo de servicios
$ docker-compose build #buscará un archivo llamado docker-compose.yml en la carpeta actual

#Si queremos especificar un archivo docker-compose en específico usamos la opción -f, seguida del nombre del archivo.
$ docker-compose -f production.yml build


#Ejecutar docker-compose y sus servicios
#Una vez que la imagen con nuestros servicios se ha creado podemos iniciar y crear los servicios con el comando up.
#se empezarán o reiniciarán todos los servicios en el archivo docker-compose.yml o el que especifiquemos con -f.
$ docker-compose up 
#Para ejecutar nuestro stack de servicios en segundo plano, para eso basta con agregar la opción -d al final.
$ docker-compose up -d
#para recrear en caso de error de network
$ docker-compose up --force-recreate


##Correr un comando dentro de un contenedor en ejecución 
#docker-compose exec, seguido nombre del servicio y el comando.
$ docker-compose exec app bash


#Detener y remover los servicios (Detiene y remueve los contenedores, redes, volúmenes e imágenes que se crean)
$ docker-compose down

#Reiniciar los servicios
$ docker-compose restart  #reiniciar todos los servicios
$ docker-compose restart nombre_servicio  #reinicia un servicio en especifico

#Detener los servicios sin removerlos
$ docker-compose stop #Detener todos los servicios
$ docker-compose stop servicio #Detener uno servicio en especifico

#Iniciar los servicios de docker-compose previamente creados pero detenidos en algun momento sin volver a crearlos, además (no crea ningún contenedor nuevo)
$ docker-compose start  #Inicia todos los servicios
$ docker-compose start servicio #Inicia un solo servicio

#Correr un comando dentro de un servicio
#Para ejecutar un comando dentro de uno de nuestros servicios usamos el comando run, la opción –rm eliminará el contenedor que se creará al terminar de ejecutarse, a continuación colocamos el comando. A diferencia de docker-compose start, este comando se usa para efectuar tareas que se llevan a cabo solo una vez.
$ docker-compose run --rm django python manage.py migrate

#Ver los procesos
$ docker-compose ps  #Para listar los containers que se están ejecutando
$ docker-compose ps servicio #Para listar un solo container lo colocamos al final de nuestro comando.

#Acceder a los procesos
#De la misma manera que el comando top en GNU/Linux, docker-compose top nos muestra los procesos de cada uno de nuestros servicios.
$ docker-compose -f local.yml top
$ docker-compose top servicio #Para ver los procesos de un único servicio

#Ver los logs (Si algo salió mal)
$ docker-compose -f production.yml logs #ver los logs de un stack en específico
$ docker-compose -f production.yml logs servicio

#Escalar contenedores
docker-compose -f production.yml up -d --scale servicio=3
# –scale seguida del servicio que queremos escalar y el número de copias usando el formato servicio=numero.

#Hay que tomar en cuenta que cuando escalamos un contenedor, se intentará crear otro contenedor con un puerto que ya estará en uso, lo que provocará un conflicto, por esta razón necesitamos especificar rangos de puertos en nuestro archivo de docker compose. Tampoco podemos usar nombres de contenenedores en nuestros servicios, por los que habrá que removerlos.

services:
  django:
    build:
      context: .
      dockerfile: Dockerfile
    image: customImage
    container_name: django # ES NECESARIO REMOVER ESTA LINEA
    depends_on:
      - postgres
    volumes:
      - .:/app:z
    env_file:
      - ./django.env
      - ./posgres.env
    ports:
      - "8000-8005:8000" # APLICA RANGOS A LOS PUERTOS
    command: /start






// crear e iniciar contenedores 
docker-compose up
// iniciar servicios con modo separado 
docker-compose -d up
// iniciar un servicio específico 
docker-compose up <nombre-servicio>
// lista de imágenes 
docker-compose imágenes
// lista de contenedores 
docker-compose ps
// inicio del servicio 
docker-compose start
// detener los servicios 
docker-compose stop
// mostrar contenedores en ejecución 
docker-compose top
// matar servicios 
docker-compose matar
// eliminar contenedores detenidos 
docker-compose rm
// detener todos los contenedores y eliminar imágenes, volúmenes 
docker-compose down



 
