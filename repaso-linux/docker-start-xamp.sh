
#docker run --name aimeos -p 41061:22 -p 41062:80 -d -v .:/www tomsik68/xampp:8
docker run --name aimeos -p 41061:22 -p 41062:80 -d -v /var/www/aimeos-laravel:/www tomsik68/xampp:8 
#Para navegar a su página web, visite esta URL: http://localhost:41062/www
#Para abrir la interfaz XAMPP: http://localhost:41062/
#Para abrir phpmyadmin: http://localhost:41062/phpmyadmin/.

#Esta imagen usa el directorio /www para los archivos de su página, por lo que debe montarla.
#docker run --name myXampp -p 41061:22 -p 41062:80 -d -v ~/my_web_pages:/www tomsik68/xampp

#Default credentials ssh
#service	username	password
#ssh		root		root

#Conexión ssh
#La contraseña SSH predeterminada es 'root'.
#$ ssh root@localhost -p 41061

#obtenga una terminal de shell dentro de su contenedor
#docker exec -ti myXampp bash

#Usa tu propia configuración de apache
#docker run --name myXampp -p 41061:22 -p 41062:80 -d -v ~/my_web_pages:/www  -v ~/my_apache_conf:/opt/lampp/apache2/conf.d tomsik68/xampp

#reiniciar el servidor
#docker exec myXampp /opt/lampp/lampp restart

#phpmyadmin
#Si usó la bandera -p 41062:80con docker run, simplemente vaya a http://localhost:41062/phpmyadmin/ .
