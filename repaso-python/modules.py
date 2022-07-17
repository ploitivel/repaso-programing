#Modulos Frameworks o Bibliotecas
#Modulos creados por uno mismo
#Modulos cresdos por terceros #pip modules https://pypi.org/
#Modulos de python https://docs.python.org/3/py-modindex.html
#Example
#from datetime import timedelta, date
#print(date.today())

#pip sirve para instalar modulos de terceros

#import nombre_de_la_libreria
#from nombre_de_la_libreria import nombre_de_la_funcion_uno, nombre_de_la_funcion_dos
#from nombre_de_la_libreria import *

#Forma Uno inportacion global
#import fmatch 
#print(fmatch.suma_de_numeros("555+10"))

#Forma Dos inportacion del modulo que vamos a utilizar
from fmatch import suma_de_numeros
from colorama import init,Fore, Back, Style
init()

numeros_sumar = str(input("Ingresa la suma : "))
print(Fore.YELLOW + str(suma_de_numeros(numeros_sumar)))
#print(Fore.YELLOW + str(suma_de_numeros("555+10")))

""" from colorama import init,Fore, Back, Style
init()
print(Fore.RED + 'some red text')
print("Hoal")
print(Back.GREEN + 'and with a green background')
print(Style.DIM + 'and in dim text')
print(Style.RESET_ALL)
print('back to normal now') """


#libreria para generar un numero aleatorio
#import random
#print(random.randint(1,100))

from random import randint
#from random import * #Asterisco para inportar todas las funciones de la libreria
print(randint(1,100))








