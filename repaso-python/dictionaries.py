#Los diccionarios sirven para agrupar datos de la vida real
#Los diccionarios no tienen indices
#clave => valor
#Las operaciones se hacen a traves de la clave
#Son parecidos a los datos json

product = {
    "name": "book",
    "cantidad": 5,
    "precio": 10.0,
    "iva": "1.2%",
}
#print(dir(product))
#print(type(product))
print(product.keys()) #MOstrar las claves
print(product.items()) #Mostrar los valores

#print(product["name"])
#print(product["cantidad"])
#print(product["precio"])
#print(product["iva"])

#Modificar valores
product["name"] = "pencil"

#Eliminar elementos de un diccionario
del product["iva"]

#sumar lo que avia antes
product["cantidad"] += 20

#Diccionario dentro de una lista
productos = [
    {"name":"Xperia 11" , "cantidad":4, "precio": 350.50},
    {"name":"Xperia 4" , "cantidad":1, "precio": 6500.1},
    {"name":"Xperia X" , "cantidad":9, "precio": 10500},
]
#print(productos)
#print(type(productos))
#product.clear()
#del product

for k,v in list(product.items()):
    print(k,v)

#Diccionario anindado
persona = {
    "nombres" : ["Juan", "Ignacio"],
    "escuelas" : {
        "primaria" : "Vicente Suarez",
        "secundaria" : "Benito Juarez"
    }
}
print(persona["nombres"][1])
print(persona["escuelas"]["secundaria"])