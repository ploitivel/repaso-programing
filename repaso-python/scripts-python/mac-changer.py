
#!/usr/bin/env python

import subprocess #subprocess nos permite ejecutar comandos
import random #Nos permite obtener nueros aleatorios
import optparse  #optparser nos permite vicular los parametros de la consola
import re #Paquete de expresiones regulares
import sys #Paquete para detener el programa

#pythex.org sitios para expresiones regulares de python

def get_arguments():
        parser = optparse.OptionParser()
        parser.add_option("-i", "--interface" ,  dest = "interface" , help = "interface para cambiar direccion MAC")
        parser.add_option("-m", "--mac" ,  dest = "mac" , help = "mac para cambiar direccion MAC")
        #parser.add_option("-a", "--auto" ,  dest = "auto" , help = "auto para usar el modo automatico")
        (options , arguments) = parser.parse_args()
        #if not options.interface:
        #        parser.error("[-] Indica una interfaz, usa --help para mas informacion")
        #elif not options.mac:
        #        parser.error("[-] Indica una Direccion Mac, usa --help para mas informacion")
        #return parser.parse_args() 
        return options

        #if options.interface: 
        #        return options.interface 
        #else: 
        #        parser.error("[!] Invalid Syntax. " + "Use --help for more details.") 

def get_random_mac_address(): 
        characters = "0123456789abcdef"
        random_mac_address = "00"
        for i in range(5): 
                random_mac_address += ":" + random.choice(characters) + random.choice(characters) 
        return random_mac_address 

def change_mac(interfaz, new_mac_address): 
        print("[+] Cambiando interfaz para " + interfaz + " to " + new_mac_address)
        subprocess.call(["sudo", "ifconfig", interfaz, "down"]) 
        subprocess.call(["sudo", "ifconfig", interfaz, "hw", "ether", new_mac_address]) 
        subprocess.call(["sudo", "ifconfig", interfaz, "up"]) 

#subprocess.call("ifconfig eth0 down", shell=True)  #call nos permite ejecutar comandos
#subprocess.call("ifconfig eth0 hw ether 00:11:22:33:44:66", shell=True)
#subprocess.call("ifconfig eth0 up", shell=True)

def actual_mac(interface):
        ifconfig_results = subprocess.check_output(["ifconfig", interface])
        mac_address_search_result = re.search(r"\w\w:\w\w:\w\w:\w\w:\w\w:\w\w", str(ifconfig_results))
        if mac_address_search_result:
                return mac_address_search_result.group(0) #group(0) es para obtener el primer resultado
        else:
                return "No pudimos leer la direccion Mac"

def valid_mac(mac):
        def validar_mac(mac):
                if re.match("^([0-f][0-f][:-]){5}[0-f][0-f]$", str(mac)):
                        return True
                else:
                        return False

        valid_mac = False
        while valid_mac != True:
                if not validar_mac(str(mac)):
                        print("[-] Indica una direccion MAC valida.")
                        mac = str(raw_input("Nuevo MAC > "))
                else:
                        valid_mac = True
                        return mac
               
if __name__ == "__main__":

        print("[* Welcome to MAC ADDRESS Changer *]") 
        print("[*] Press CTRL-C to QUIT") 
        
        #TIEMPO_DE_ESPERA = 60

        options = get_arguments()

        if options.interface and options.mac:
                interface = options.interface
                new_mac=valid_mac(options.mac) #retornar mac valida
        elif not options.interface and not options.mac:
                #MODO AUTOMATICO
                print("[* Modo automatico *]\n")
                print("MAC?\n")
                print("[0] Manual MAC")
                print("[1] Aleatoria MAC")
                new_mac = str(raw_input("Nuevo MAC > ")) if str(input("\nElige un opcion > ")) == "0" else get_random_mac_address()
                new_mac=valid_mac(new_mac) #retornar mac valida

                print("\nInterfaces conocidas\n")
                print("[0] 'eth0'")
                print("[1] 'wlan0'")
                print("[*] 'Otra'")
                option_interface = raw_input("\nElige una opcion > ")
                 
                if option_interface == "0":     interface = "eth0"
                elif option_interface == "1":   interface = "wlan0"
                elif option_interface == "*":   interface = raw_input("Interfaz > ")
                else:                           interface = "eth0"
                
        elif not options.interface:
                sys.exit("[-] Indica una interfaz, usa --help para mas informacion") 
        elif not options.mac:
                sys.exit("[-] Indica una direccion MAC, usa --help para mas informacion") 

        #Imprimir la mac actual
        vieja_mac = actual_mac(interface)
        print("La direccion MAC actual es: " + str(vieja_mac))

        #Varificar si la mac ya existe
        if vieja_mac == new_mac: 
                sys.exit("[-] La direccion MAC " + new_mac + " ya existe.") 

        ##Cambiar la mac
        change_mac(interface, new_mac) 

        nueva_mac = actual_mac(interface)
        if nueva_mac == new_mac: 
                print("[+] La direccion MAC se cambio correctamente ")
                print("[+] " + str(vieja_mac) + " => " + str(nueva_mac))
        else:
                print("[-] Fallo al cambiar la direccion MAC")





