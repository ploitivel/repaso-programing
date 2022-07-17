#Para que una tupla sea considerada tupla debe tener mas de 1 elementos
#A la tupla no se le pueden cambiar los valores  


days = ('lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo',)
lista = [1,2,3] #lista
tupla = tuple(lista) #tuple transforma una lista a tupla
print(type(days)) 
print(days)
print(dir(days)) #Mostrar opciones de la tupla
del x; #Del elimina una variable

locations = {
    ('35.123324', '35.000') : "Tokio",
    ('35.123324', '33.000') : "New York",
}
