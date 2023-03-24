#Iniciar Apache si el servicio se encuentra detenido.
systemctl start apache2

#Detener o Parar Apache si el servicio se encuentra funcionando.
systemctl stop apache2

#Detener e Iniciar Apache (Reiniciar) cargando así las nuevas configuraciones posibles que pudieran haberse cambiado o modificado.
systemctl restart apache2

#Recargar Permite que los archivos de configuración se vuelvan a cargar sin reiniciar el servicio.
#Usarlo cuando se modifican las aplicaciones
systemctl reload apache2

#Directorio raíz donde el servidor intentará servir los archivos de páginas web. a los clientes web (navegadores) que lo soliciten. 
/var/www/html 

#Este directorio es donde se alojan la mayoría de archivos de configuración de Apache.
/etc/apache2 

#Aquí encontramos todos los sitios o webs disponibles de nuestro servidor y dónde creamos los nuevos sitios.
/etc/apache2/sites-avaliable

#Este directorio continene todos los sitios activados o habilitados.
/etc/apache2/sites-enabled

#Comando para habilitarlos:
a2ensite ejemplo.com

#COmando para dehabilitarlos:
a2dissite example.com


#Estructura VirtualHost de Sites Enabled

<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>


#Habilitar o Deshabilitar Módulos
#Apache tiene distintos módulos que mejoran y amplían sus funcionalidades.

#Habilitar módulo:
a2enmod nombre_modulo

#Deshabilitar módulo:
a2dismod nombre_modulo


#CONFIGURAR VIRTUAL HOST EN APACHE

#Crear los directorios
sudo mkdir -p /var/www/ejemplo.com/public_html

#Otorgar Permisos
sudo chown -R $USER:$USER /var/www/ejemplo.com/public_html
sudo chmod -R 755 /var/www

#Crear una Página de Prueba para el Virtual Host
nano /var/www/ejemplo.com/public_html/index.html
<html>
  <head>
    <title>Bienvenido a Ejemplo.com!</title>
  </head>
  <body>
    <h1>Éxito! El Virtual Host ejemplo.com esta funcionando!</h1>
  </body>
</html>

#Crear Nuevo Archivo Virtual Host, hacer una copia del original y vamos a modificarlo
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/ejemplo.com.conf 

#MOdificaremos las directivas
#ServerAdmin admin@ejemplo.com : por un correo del administrador del sitio que pueda recibir correos. admin@ejemplo.com
#ServerName ejemplo.com : Establece la base del dominio que debe coincidir para este Virtual Host. Esto será como tu dominio. ejemplo.com
#ServerAlias www.ejemplo.com:  determina nombres futuros que pueden coincidir y servirse como el nombre base o dominio principal. Esto es útil para host tipo www: www.ejemplo.com
#DocumentRoot /var/www/ejemplo.com/public_html:  DocumentRoot va a apuntar al directorio que hemos creado para la aplicacion:

<VirtualHost *:80>
    ServerAdmin admin@ejemplo.com
    ServerName ejemplo.com
    ServerAlias www.ejemplo.com
    DocumentRoot /var/www/ejemplo.com/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>


#Paso Cinco — Habilita el nuevo archivo Virtual Host con el comando a2ensite
a2ensite ejemplo.com.conf
sudo a2ensite ejemplo.com.conf

#reiniciar Apache para asegurarte de que tus cambios surtan efecto:
sudo service apache2 restart


#Configura Archivos Locales
sudo nano /etc/hosts

#Los detalles que necesitas agregar son la IP pública de tu VPS seguido del dominio que deseas apuntar a ese VPS.
#Para los dominios que utilizamos en esta guía, asumiremos que la IP de nuestro VPS es 111.111.111.111, podemos agregar las siguientes líneas al final del archivo hosts:

#corresponder un nombre de dominio, que puede ser una simple cadena como localhost o mimaquina o un nombre de dominio como los que te encuentras en Internet example.com o servidordeprueba.example.com con una dirección IP, colocando una línea donde figurarán ambas cosas. Por ejemplo:

192.168.56.101  www.miproyecto.dev

#Si estás configurando un virtualhost en tu máquina seguramente la IP será la de localhost:

127.0.0.1   localhost
127.0.1.1   guest-desktop
127.0.0.2   ejemplo.com
127.0.1.2   pruebas.com
127.0.0.1  proyecto.example.com

#Probar el dominio en el navegador web
http://ejemplo.com

