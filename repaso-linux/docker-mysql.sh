#Como crear un contenedor con Docker-Mysql y persistir la información
 descargar el contenedor de Mysql con el siguiente comando.

#EJEMPLO 1
$ docker run -d -p 33060:3306 --name mysql-db -e MYSQL_ROOT_PASSWORD=secret mysql

-d: Deatached Mode es la forma en que indicamos que corra en background.
-p : puerto, el contenedor corre en el puerto 3306 pero hacemos un bind para que lo escuchemos en Host el puerto 33061.
–name : para no tener que hacer referencia al hash le asignamos un nombre.
-e : environment le asignamos la contraseña.

#EJEMPLO 2
$ docker run -d -p 33061:3306 --name mysql57 -e MYSQL_ROOT_PASSWORD=secret mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

Analicemos el comando:

docker run corre/crea un contenedor.

-d  # indica que el contenedor permanecerá corriendo en segundo plano.
-p 33061:3306 #conecta el puerto 33061 de nuestro sistema operativo con el puerto 3306 del contenedor.
--name mysql57 # le da un nombre personalizado al contenedor.
-e MYSQL\_ROOT\_PASSWORD=secret  #asigna la contraseña "secret" al usuario "root" de MySQL, -e sirve para configurar variables de entorno.
mysql:5.7 # indica la version de la imagen a partir de la cual se va a crear el contenedor.
--character-set-server=utf8mb4 #codificación de caracteres por defecto cuando creemos bases de datos.
--collection-server=utf8mb4\_unicode\_ci #mysql que use utf8mb4 en las colecciones de datos.


#VARIABLES DE ENTORNO
MYSQL_ROOT_PASSWORD #Esta variable es obligatoria y especifica la contraseña que se establecerá para la rootcuenta de superusuario de MySQ
MYSQL_DATABASE #Esta variable es opcional y le permite especificar el nombre de una base de datos que se creará al iniciar la imagen.
MYSQL_USER,MYSQL_PASSWORD #variables son opcionales, se usan en conjunto para crear un nuevo usuario y establecer la contraseña de ese usuario.
MYSQL_ALLOW_EMPTY_PASSWORD #permitir que el contenedor se inicie con una contraseña en blanco para el usuario root.  (NO se recomienda para produccion)
MYSQL_RANDOM_ROOT_PASSWORD #generar una contraseña inicial aleatoria para el usuario raíz  y la imprime
MYSQL_INITDB_SKIP_TZINFO #el script de punto de entrada carga automáticamente los datos de zona horaria necesarios para la CONVERT_TZ()función


#Datos persistentes 
1. Cree un directorio de datos en un volumen adecuado en su sistema host, por ejemplo, /my/own/datadir.
$ docker run --name some-mysql -v /my/own/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
La -v /my/own/datadir:/var/lib/mysqlparte del comando monta el /my/own/datadirdirectorio desde el sistema host subyacente como /var/lib/mysqldentro del contenedor, donde MySQL por defecto escribirá sus archivos de datos.


######################################3#####################3
######################Entrar al contenedor##################
#########################################3###################
Para entrar al contenedor usamos un modo interactivo para asignar un TTY(terminal) y un STDIN abierto

$ docker exec -it <nombre_contenedor> mysql -p
$ docker exec -it mysql57 mysql -uroot -p


exec: indicamos que vamos a pasar un comando.
-it Modo interactivo.
mysql -p: es el comando para entrar a la consola de mysql con el usuario root(si has trabajado con mysql en consola es lo mismo).

Una vez que se ejecuta la línea nos pedirá la contraseña que definimos en MYSQL_ROOT_PASSWORD y estamos dentro del contenedor y podemos lanzar comandos a MYSQl.


Conclusión
Y de esta forma ya estamos trabajando con contenedores, 
Ahora podemos hacer una conexión vía HTTP y así como lo hacemos al 127.0.0.1:33060 
lo podemos hacer a un contenedor remoto.

Si queremos usar nuestro cliente MySQL preferido, por ejemplo Sequel Pro, los datos que usaremos para conectarnos son:

Host: 127.0.0.1
User: root
Password: secret
Puerto: 33061


$ docker run -d -p 33060:3306 --name mysql-db  -v /home/anon32/data_mysql_docker:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=secret mysql:8.0 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

#CONEXION AL CONTENEDOR DESDE EL HOST
mysql -u root -p  -h localhost -P 33060
mysql -u root -p  -h 127.0.0.1 -P 33060    

mysql -u admin_root -p  -h 127.0.0.1 -P 33061
