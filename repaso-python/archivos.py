#  "r" => Modo de lectura
#  "a" => Agregar archivos o editar infomracion
#  "w" => Escribir desde 0


f = open("archivo.txt", "r")  #Abrir archivo en modo lectura
#f = open("archivo.txt", "a")  #Abrir archivo en modo escritura
#f = open("archivo2.txt", "w")  #Crea un archivo en blanco "si el archivo ya existe lo resetea"

#print(f.readlines()) #Leer archivo de golpe

for line in f:
    line = line.strip() #Quitar caracteres especiales o saltos de linea o espacios al inicio y final de una cadena
    line = line.split(",")
    print(line) 

#f.write("Hola mundo\n")  #Escribir en el archivo