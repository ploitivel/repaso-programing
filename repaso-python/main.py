#comentarios
"""
Esto es un comentario multilinea
"""
#Variables
#nombre = "Julia"
#edad = 18
#localidad = "san juan"
#ciudad = "Mexico"

#Salidas y concatenacion
#print(nombre+" "+str(edad)+" "+localidad)
#print(f"{nombre} {edad} {localidad}")
#print(f"{nombre} {str(edad)} {localidad}")

#Entradas
#sitioweb = input("Cual es tu pagina web? : ")
#nombre = input("Cual es tu nombre? :")
#altura = input("Escribe tu altura :")
#Espera la entrada

#Condiciones
#if int(altura) >= 180:
#    print(nombre+" eres una persona alta")
#else:
#    print(nombre+" Eres bajito") 


#funciones predefinidas
#int(altura)
#str(nombre)


#funciones
def mostrarAltura(altura,nombre):
    ##altura = altura == null ? 170 : altura
    result = ""
    if int(altura) >= 180:
        result = str(nombre)+" eres una persona alta"
    else:
        result = str(nombre)+" Eres bajito"
    return result
     

nombre_persona = "ricardo"
altura_persona = 180
print(mostrarAltura(altura_persona, nombre_persona))
print(mostrarAltura(150, "paco"))
print(mostrarAltura(140, "Julian"))
print(mostrarAltura(190, "Jose"))


#Listas o Arrays
personas = ["Pedro", "Luis" , "Salvador"]
print(personas[0])
print(personas[1])
print(personas[2])

#tuples
(10,4,34,543)

{
    "nombre":"juan",
    "lastname":"lopez",
    "nickname":"Cruz"
}

print(type({
    "nombre":"juan",
    "lastname":"lopez",
    "nickname":"Cruz"
}))

#Bucle for
#Repetir una serie de instrucciones asta que se completa o se cumpla una condicion
#for persona in personas:    
#    print("-" + persona)


#asignacion doble
x, y = 10 , 11

print(x)

#Conventiones
book_name = "i robots" #Snake case
bookName = "i robots" #Camel Case
BookName = "i robots" #Pascal Case

#<script>alert("hacked");</script>



