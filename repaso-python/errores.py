entrada = str(input("Ingresa algo: "))

#Blindar programa para que no se caiga
try:
    #Codigo riesgoso que podria hacer caer el programa
    x = int(entrada)
#except:
except Exception as e: #Obtener el error
    print("Error inesperado" , e)

print("Ha llegado hast a el final")