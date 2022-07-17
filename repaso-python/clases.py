#En python todo eñ publico aqui no existen los metodos privados y publicos como en php
class Persona:
    #variable de clase
    especie = "Humano"

   
    #init es el metodo contructor
    def __init__(self, edad, pais):
        #Variables de instancia
        self.edad = edad
        self.pais = pais


    def dormir(dormir):
        print(dormir)

    def edad(self):
        self.edad += 1
        #print(self.edad)




#Persona.dormir("dormir")
#Persona.dormir("edad")

persona = Persona(20, "Mexico")
persona.dormir("dormir")
#persona.edad(20)