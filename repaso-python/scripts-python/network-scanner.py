import scapy.all as scapy

def scan(ip):
    #scapy.arping(ip)
    arp_request = scapy.ARP(pdst=ip)
    #print(arp_request.summary())
    broadcast = scapy.Ether(dst="ff:ff:ff:ff:ff:ff") #Para trabajar el marco de ether
    #scapy.ls(scapy.Ether())  #Para listar
    arp_request_broadcast = broadcast/arp_request
    #answered, unanswered = scapy.srp(arp_request_broadcast, timeout=1) #Preguntara el toda la subnet quien tiene dicha ip
    answered_list = scapy.srp(arp_request_broadcast, timeout=1, verbose=False)[0] #Preguntara el toda la subnet quien tiene dicha ip
    #print(answered.summary()) #Mostrar paquetes que fueron respuestos
    #print(answered_list.summary())

    print("IP\t\t\tMAC address\n-----------------------------------------")
    for element in answered_list:
        #print(element[1])
        print(element[1].psrc + "\t\t" + element[1].hwsrc)
        #print(element[1].psrc)
        #print(element[1].hwsrc)


scan("192.168.0.1/24")