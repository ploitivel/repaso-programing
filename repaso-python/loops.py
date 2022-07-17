frutas = [
    "Fresa",   #0
    "Cereza",  #1
    "Piña",    #2
    "Durazno",  
    "Platano",  
    "Fresa",  
    "Sandia",  
    "Limon",  
]

""" print(frutas[0])
print(frutas[1])
print(frutas[2])
print(frutas[3]) """

#El bucle for pasa por cada elemento del array 
#Se usa cuando se sabe el numero de veces que se repetira el ciclo
#Pare repetir algo en un nuermo especifico de veces

#break
#continue

""" for fruta in frutas:
    if fruta == "Fresa":
        print("Si ay Fresa")
        continue
    if fruta == "Durazno":
        print("Se encontro durazno")
        break
       
    print(fruta) """

#Mostrar un rango
""" for number in range(1,20):
    print(number) """

#while sirve para repetir algo mientras no se cumpla una condicion

count = 4
while count <= 10:
    #print(count)
    #count = count + 1
    count = count+1 #Si no se modifica el valor de count el bucle sera infinito

from random import randint
#from random import * #Asterisco para inportar todas las funciones de la libreria
#print(randint(1,100))
x=0
while x != 5:
    x=randint(1,100)
    #break
    #continue
print(x)