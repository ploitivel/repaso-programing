#Tipo set conocido como conjunto
#Tipo de dato set es una coleccion desordenada que no tiene un indice
#No añade elementos repetidos
#Se pueden hacer operaciones entre conjuntos
#{'Blue', 'Red', 'Black'}
#conjunto = {'Blue', 'Red', 'Black'}

lista = [1,2,3,4]
conjunto = set(lista)
print(5 in conjunto)
conjunto.add(5)
print(4 in conjunto)

conjunto2 = {'Blue', 'Red', 'Black'}

new_conjunto = conjunto.union(conjunto2) #union de 2 conjuntos
elementos_repetidos = conjunto.intersection(conjunto2) #obtiene elementos en comun de 2 conjuntos diferentes

#print(type(conjunto)) #Ver el tipo de dato
#print(dir(conjunto))  #mostar metodos del dato
conjunto.add('Orange') #add Añade un elemento al inicio de la set
conjunto.remove('Orange') #remove elimina un elemento  de la set
conjunto.clear() #Limpia la set
print(conjunto)
#del colors #Elimina la set