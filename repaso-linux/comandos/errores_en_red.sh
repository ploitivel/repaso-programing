





 airmon-ng que verifica, elimina y procesa que podrían usar la tarjeta wifi:
 airmon-ng check kill
 Para ver cualquier proceso de red sin matarlos, use airmon-ng check. Después de matarlos, volví a iniciar hostapd y ya no aparecieron errores.

Para alguna otra funcionalidad de red, es posible que necesite esos procesos, reinicié la frambuesa para eso, pero también se pueden iniciar individualmente.





Creé este script, que es una lista de comandos que desbloquean el controlador de WLAN, y ahora finalmente tengo un AP en funcionamiento, ya implementado en una ubicación remota.
Guardé el script en /usr/bin/enableAP.sh. Asegúrese de incluirlo en su crontab para que se ejecute en el arranque.

#!/bin/sh
/bin/sleep 30
/usr/sbin/service hostapd stop
/usr/sbin/service network-manager stop
/sbin/ifdown wlan0
/sbin/iwconfig wlan0 mode Managed
/usr/sbin/rfkill unblock wlan
/usr/bin/nmcli radio wifi off
/usr/sbin/service hostapd stop
/bin/sleep 10
/usr/sbin/service hostapd start


sudo nmcli nm wifi off
#si falla -->      sudo nmcli radio wifi off
sudo rfkill unblock wlan

sudo ifconfig wlan0 10.15.0.1/24 up
sleep 1
sudo service isc-dhcp-server restart
sudo service hostapd restart



SOLUCIÓN ALTERNATIVA: Para que esto persista durante los reinicios, ejecute lo siguiente en una terminal:
sudo nano /etc/NetworkManager/NetworkManager.conf
#Remplazar las xx por la MAC
unmanaged-devices=mac:xx:xx:xx:xx:xx:xx



service NetworkManager status 
service network-manager status


service wpa_supplicant stop
0

La solución para mí fue detener (que de hecho es manejado por airmon-ng check kill, pero eso no está necesariamente disponible en el sistema) wpa_supplicant, de lo contrario, seguía recibiendo "No se pudo configurar el modo de controlador"

systemctl stop wpa_supplicant.service


o vía

pkill wpa_supplicant


#Desenmascar servicios
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd





Process: 10735 ExecStart=/usr/sbin/hostapd -B -P /run/hostapd.pid $DAEMON_OPTS ${DAEMON_CONF} (code=exited, status=1/FAILURE)
