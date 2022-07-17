#indices   0    1    2    3           4
lista=["String",0,False,True,["nombre","fecha",]]
#indices -5     -4  -3   -2           -1

demo_list = ["hola",True,1.5,[1,2,3],10]

numbers_list = list((1,2,3,4,5,6))
#print(numbers_lits)
#print(type(numbers_lits))
#print(list(range(1,100)))
print(dir(demo_list)) #Da informacion de lo que se puede hacer con una lista
print('hola' in demo_list) #Para preguntar si existe la palabra destro de la lista
demo_list[1] = False; #Reasigacion o midificacion
demo_list[-1] += 10 #Modificar el elemento

print(len(demo_list)) #Da informacion sobre el numero de elementos de una lista o el numero de caracteres de un String
demo_list.index("String") #Da informacion de la posicion de un elemnto el la lista basandose en su nombre
demo_list.append(["7", True]) #append agrega un elemento o un array dentro de un array
demo_list.extend(['new element',0]) #extend agrega un nuevo elemento a un array
demo_list.insert(2,'insert') #insert agrega un nuevo elemento a un array pero en un lugar en especifico usando el indice 
demo_list.pop(0) #pop elimina un elemento de un array basado en un indice por defecto elimina el ultimo
demo_list.remove(0) #remove elimina un elemento basado en su nombre pero solo elimina el primero que encuentra
demo_list.short() #shor ordena los elementos de un array por orden alfabetico
demo_list.reverse() #reverse invierte el orden de una lista
print(demo_list)





#Recorrer un lista por indices 
for i in range(len(demo_list)):
    print(demo_list[i])

#Recorrer un lista por valores
for i in demo_list:
    print(i)