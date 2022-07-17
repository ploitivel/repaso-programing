#Una funcion es una porcion de codigo que no se ejecuta asta que sea lllamada

""" def suma_de_dos_numeros(numeroUno, numeroDos):
    return numeroUno + numeroDos;

print(suma_de_dos_numeros(5,20)) """

def suma_de_numeros(numeros):
    import re
    numeros = re.sub(r'[^0-9+.]', '', numeros)  #eliminar todos los caracteres y conserva todos los números y el signo +. "34.3+3.4+34+"
    array_numeros = numeros.replace(" ", "").split("+") #Eliminar los espacios y dividir el string a array por medio del signo +
    array_numeros = list(filter(bool, [elemento for elemento in array_numeros if elemento])) #filtrar elementos vacios
    suma_total = 0
    for numero in array_numeros:
        suma_total = float(numero) + float(suma_total)
    return suma_total


#numeros_sumar = str(input("Ingresa la suma : "))
#print(suma_de_numeros(numeros_sumar))
print(suma_de_numeros("5+5+5+5+5+5+1"))




add = lambda numeroUno, numeroDos: numeroUno + numeroDos

print(add(10,11))


#Crear funcion que una varias listas

def sumar_elementos(lista):
    x = 0
    for element in lista:
        x += x + element
        return x

#sumar_elementos([1,2,3,4,5,6])


def unir_conjuntos(conjuntos):
    new_conjunto={}
    for conjunto in conjuntos:
        conjunto = set(conjunto)
        new_conjunto = conjunto.union(new_conjunto)
    return new_conjunto

conjunto1 = ['Blue', 'Red', 'Black']
conjunto2 = {'Blue Fuerte', 'Red Claro', 'Black Claro',{'hola','mundo'}}
conjunto3 = {'Blue Fuerte 1', 'Red Claro 2', 'Black Claro 3'}

#print(unir_conjuntos([conjunto1, conjunto2]))
print(unir_conjuntos([conjunto1, conjunto2, conjunto3]))

print(dir(conjunto1))
#print(issuperset(conjunto1))