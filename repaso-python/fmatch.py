def suma_de_numeros(numeros):
    import re
    numeros = re.sub(r'[^0-9+.]', '', numeros)  #eliminar todos los caracteres y conserva todos los números y el signo +. "34.3+3.4+34+"
    array_numeros = numeros.replace(" ", "").split("+") #Eliminar los espacios y dividir el string a array por medio del signo +
    array_numeros = list(filter(bool, [elemento for elemento in array_numeros if elemento])) #filtrar elementos vacios
    suma_total = 0
    for numero in array_numeros:
        suma_total = float(numero) + float(suma_total)
    return suma_total

def resta_de_numeros(numeroUno, numeroDos):
    return numeroUno - numeroDos