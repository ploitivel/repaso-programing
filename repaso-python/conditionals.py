#nombre = input("Cual es tu nombre? :")
from pdb import Restart


nombre = "Matias"
altura = input("Escribe tu altura :")
#Espera la entrada

#Condiciones

if int(altura) >= 170:
    print(nombre+" eres una persona alta")
elif int(altura) < 170 and int(altura) > 160 :
    print(nombre+" eres una persona promedio")
else:
    print(nombre+" Eres bajito") 

#Condiciones anidadas son condiciones dentro de una condicion
#En python no existe el switch