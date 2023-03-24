isc-dhcp-server. servidor dhcp

 HostAPD

Host Access Point Daemon es un software para GNU/Linux y FreeBSD capaz de hacer funcionar una tarjeta inalámbrica compatible con el modo AP en un punto de acceso WiFi. Para saber si una tarjeta inalámbrica es compatible con el modo AP (punto de acceso) se debe ejecutar el siguiente comando:




#------------------------------------------------------------------#
#-------------802.11b/g/n con cifrado WPA2-PSK y CCMP -------------#
#------------------------------------------------------------------#

#/etc/hostapd/hostapd.conf
interface=wlan0       # La interfaz usada por el punto de acceso
hw_mode=g             # g significa la banda de 2,4GHz
channel=10            # El canal a utilizar
ieee80211d=1          # Limitar las frecuencias usadas a las permitidas en el país
country_code=ES       # El código del país
ieee80211n=1          # Activar soporte para la tecnología inalámbrica 802.11n
wmm_enabled=1         # Activar soporte para Quality of Service
ssid=somename         # El nombre del punto de acceso
auth_algs=1           # Tipo de cifrado: 1=wpa, 2=wep, 3=ambos
wpa=2                 # Sólo cifrado WPA2
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
wpa_passphrase=somepassword



#------------------------------------------------------------------#
#-------------802.11a/n/ac con cifrado WPA2-PSK y CCMP ------------#
#------------------------------------------------------------------#

#/etc/hostapd/hostapd.conf
interface=wlan0       # La interfaz usada por el punto de acceso
hw_mode=a             # a significa 5GHz
channel=0             # El canal a utilizar, 0 significa buscar el de menos interferencia 
ieee80211d=1          # Limitar las frecuencias usadas a las permitidas en el país
country_code=FR       # El código del país
ieee80211n=1          # Activar soporte para la tecnología inalámbrica n
ieee80211ac=1         # Activar soporte para la tecnología inalámbrica ac
wmm_enabled=1         # Activar soporte para Quality of Service
ssid=somename         # El nombre del punto de acceso
auth_algs=1           # Tipo de cifrado: 1=wpa, 2=wep, 3=both
wpa=2                 # Sólo cifrado WPA2
wpa_key_mgmt=WPA-PSK 
rsn_pairwise=CCMP
wpa_passphrase=somepassword


#------------------------------------------------------------------#
#-------------802.11b/g/n triple punto de acceso ------------------#
#------------------------------------------------------------------#


Tres puntos de acceso con la misma tarjeta. Uno con encriptación WPA2, otro con WPA1 y otro sin encriptación. Hostapd crea automáticamente interfaces para cada nuevo punto de acceso:
#/etc/hostapd/hostapd.conf
interface=wlan0       # La interfaz utilizada por el punto de acceso
hw_mode=g             # g significa 2,4GHz
channel=10            # El canal a utilizar
ieee80211d=1          # Limitar las frecuencias a utilizar a las permitidas en el país
country_code=FR       # El código del país
ieee80211n=1          # Activar el soporte para la tecnología inalámbrica 802.11n
wmm_enabled=1         # Activar soporte para Quality of Service
# 1ER PUNTO DE ACCESO
ssid=test1            # El nombre del punto de acceso
auth_algs=1           # El tipo de cifrado: 1=wpa, 2=wep, 3=both
wpa=2                 # Sólo cifrado WPA2
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
wpa_passphrase=somepassword
# 2DO PUNTO DE ACCESO
bss=wlan1                 # El nombre de la nueva interfaz que se creará para el nuevo AP
ssid=test2                # El nombre del punto de acceso
auth_algs=1               # El tipo de cifrado: 1=wpa, 2=wep, 3=both
wpa=1                     # Sólo cifrado WPA1
wpa_key_mgmt=WPA-PSK
wpa_passphrase=someotherpassword
# 3ER PUNTO ACCESO
bss=wlan2         # El nombre de la nueva interfaz que hostapd creará para manejar el 3er AP
ssid=test3