
flyctl es una interfaz de línea de comandos para la plataforma Fly.io.

Permite a los usuarios administrar la autenticación, el lanzamiento de aplicaciones,
implementación, configuración de red, registro y más con solo el
un comando

* Inicie una aplicación con el comando de inicio -> launch
* Implementar una aplicación con el comando de implementación -> deploy
* Ver una aplicación web implementada con el comando abrir  -> open
* Comprobar el estado de una aplicación con el comando de estado  -> status

Para leer más, use el comando docs para ver la ayuda de Fly en la web.

Uso:
  flyctl [flags]
  flyctl [command]

Comandos disponibles:
   agent      --> Comandos que administran el agente Fly, un proceso en segundo plano que administra las conexiones flyctl wireguard
   apps       --> Administrar aplicaciones
   auth       --> Administrar autenticación
   autoscale  --> Recursos de la aplicación de escala automática
   certs      --> Administrar certificados
   checks     --> Administrar controles de salud
   completion --> generar el script de autocompletado para el shell especificado
   config     --> Administrar la configuración de una aplicación
   curl       --> Ejecutar una prueba de rendimiento contra una URL
   dashboard  --> Abrir navegador web en Fly Web UI para esta aplicación
   deploy     --> Implementar aplicaciones Fly
   destroy    --> Destruye permanentemente una aplicación
   dig        --> Hacer solicitudes de DNS contra el servidor DNS interno de Fly.io
   dns        --> Administrar registros DNS
   docs       --> Ver documentación de Fly
   doctor     --> El comando DOCTOR le permite depurar su entorno Fly
   domains    --> Administrar dominios
   help       --> Ayuda sobre comandos flyctl
   history    --> Muestra el historial de cambios de una aplicación
   image      --> Administrar imagen de la aplicación
   info       --> Muestra información sobre la aplicación
   ips        --> Administrar direcciones IP para aplicaciones
   jobs       --> Mostrar trabajos en Fly.io
   launch     --> Cree y configure una nueva aplicación a partir del código fuente o una imagen de Docker.
   list       --> Enumera sus recursos de Fly
   logs       --> Ver registros de aplicaciones
   machine    --> Comandos que gestionan máquinas
   monitor    --> Supervisar las implementaciones de aplicaciones actualmente en ejecución
   move       --> Mover una aplicación a otra organización
   open       --> Abrir navegador a la aplicación implementada actual
   orgs       --> Comandos para gestionar organizaciones Fly
   ping       --> Probar conectividad con mensajes de ping ICMP
   platform   --> Información de la plataforma de vuelo
   postgres   --> Administrar clústeres de Postgres.
   proxy      --> Conexiones de proxy a una máquina virtual voladora
   redis      --> Inicie y administre bases de datos de Redis administradas por Upstash.com
   regions    --> Administrar regiones
   releases   --> Lista de lanzamientos de aplicaciones
   restart    --> Reiniciar una aplicación
   resume     --> Reanudar una aplicación
   scale      --> Escalar los recursos de la aplicación
   secrets    --> Administre los secretos de la aplicación con los comandos set y unset.
   sftp       --> Obtener o colocar archivos desde una máquina virtual remota.
   ssh        --> Use SSH para iniciar sesión o ejecutar comandos en máquinas virtuales
   status     --> Mostrar estado de la aplicación
   suspend    --> Suspender una aplicación
   turboku    --> Inicia aplicaciones heroku
   version    --> Mostrar información de versión para el comando flyctl
   vm         --> Comandos que administran instancias de VM
   volumes    --> Comandos de gestión de volúmenes
   wireguard  --> Comandos que administran las conexiones entre pares de WireGuard

Flags:
  -t, --access-token string  -> Fly API Access Token
  -h, --help                 -> ayuda para flyctl
  -j, --json                 -> json output (salida json)
      --verbose              -> verbose output (salida detallada)

Use "flyctl [comando] --help" para obtener más información sobre un comando.    



#REgistro en fly.io
flyctl auth singup

#iniciar sesión con flyctl
flyctl auth login

Fly.io le permite implementar cualquier tipo de aplicación siempre que esté empaquetada en una imagen de Docker . 
Eso también significa que puede simplemente implementar una imagen de Docker y, de hecho, tenemos una lista para usar flyio/hellofly:latest.

flyctl launch --image flyio/hellofly:latest

flyctl apps create


? App Name (leave blank to use an auto-generated name):
Aquí puede ingresar el nombre de la aplicación. (números, letras minúsculas y guiones)

? Select organization: Personal (personal)


? Select region: ord (Chicago, Illinois (US))
Seleccione una región para la implementación. 
La región más cercana a usted se selecciona de manera predeterminada. 
Puede usar esto o cambiar a otra región.

? Would you like to set up a Postgresql database now? (y/N)
si necesita una base de datos Postgresql. Puedes responder no por ahora.


app = "hellofly"


[build]
  image = "flyio/hellofly:latest"




[[services]]
  internal_port = 8080




...


flyctl crea una aplicación para usted y escribe su configuración en un fly.toml archivo. 
El fly.toml archivo ahora contiene una configuración predeterminada para implementar su aplicación.
El flyctlcomando siempre se referirá a este archivo en el directorio actual si existe

#implementar nuestra aplicación en contenedores. 
flyctl deploy

Esto buscará nuestro fly.tomlarchivo y obtendrá el nombre de la aplicación helloflydesde allí. Luego, flyctl comenzará el proceso de implementación de nuestra aplicación en la plataforma Fly.io. flyctl lo regresará a la línea de comandos cuando haya terminado.


#Verifique el estado de su aplicación

$ flyctl status

App
  Name     = hellofly
  Owner    = dj
  Version  = 0
  Status   = running
  Hostname = hellofly.fly.dev
Allocations
ID       VERSION REGION DESIRED STATUS  HEALTH CHECKS      RESTARTS CREATED
987e3ac2 0       fra    run     running 1 total, 1 passing 0        58s ago
$
#Como puede ver, la aplicación se implementó con un nombre de host DNS de hellofly.fly.dev. Por supuesto, el nombre de su implementación será diferente.


#Visite su aplicación sobre la marcha

$ flyctl open /fred

Opening http://hellofly.fly.dev/fred


#administrar sus aplicaciones Fly.
$ flyctl apps [command]

Comandos disponibles:
   create ->  Crear una nueva aplicación
   destroy -> Destruye permanentemente una aplicación
   list ->  Lista de aplicaciones
   move ->  Mover una aplicación a otra organización
   open ->  Abrir navegador a la aplicación desplegada actual
   releases ->  Lista de lanzamientos de aplicaciones
   restart -> Reiniciar una aplicación


#Muestra las aplicaciones (contenedores) 
$ fly list apps

#Eliminar contenedor
$ fly destroy name_container

#Mestra los logs de un contenedor
flyctl logs -a name_container

#REiniciar contenedor
flyctl restart [APPNAME] [flags]
Flags:
  -f, --force Emitirá un reinicio contra cada máquina incluso si hay errores. (Solo máquinas)
 --force-stop Realiza una detención forzada contra la máquina de destino. (Solo máquinas)

#Reiniciar aplicacion previmente suspendida
$ flyctl resume [APPNAME] 

#Ver el estado de las aplicaciones
$ flyctl status  --all #Mostrar instancias completadas
$ flyctl status --app name_app 
$ flyctl status instance   #Mostrar estado de la instancia 

#Suspender una aplicacion
$ flyctl suspend [APPNAME] [flags] #Todas las instancias se detendrán y la aplicación no se ejecutará en ninguna parte.

#administrar instancias de VM
$ flyctl vm [command]
Commands:
  restart     Restart a VM
  status      Show a VM's status
  stop        Stop a VM

#Use SSH para iniciar sesión o ejecutar comandos en máquinas virtuales
$ flyctl ssh [command]
Comands:
   console -> Conéctese a una instancia en ejecución de la aplicación actual.
   issue -> Emitir una nueva credencial SSH
   log  -> Registro de todos los certificados SSH emitidos
   sftp ->  Obtenga o coloque archivos desde una máquina virtual remota.
