#Cadenas
myString = "Hola mundo , mundial"
#print(dir(myString)) #muesta las metodos o funciones para los string 
#['__add__', '__class__', '__contains__', '__delattr__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__getnewargs__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__mod__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__rmod__', '__rmul__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', 'capitalize', 'casefold', 'center', 'count', 'encode', 'endswith', 'expandtabs', 'find', 'format', 'format_map', 'index', 'isalnum', 'isalpha', 'isascii', 'isdecimal', 'isdigit', 'isidentifier', 'islower', 'isnumeric', 'isprintable', 'isspace', 'istitle', 'isupper', 'join', 'ljust', 'lower', 'lstrip', 'maketrans', 'partition', 'removeprefix', 'removesuffix', 'replace', 'rfind', 'rindex', 'rjust', 'rpartition', 'rsplit', 'rstrip', 'split', 'splitlines', 'startswith', 'strip', 'swapcase', 'title', 'translate', 'upper', 'zfill']  
myString[2] #Imprime la posicion
myString[-2] #Imprime la posicion
myString.upper() #upper cambia el texto a mayuscula
myString.lower() #upper cambia el texto a minuscula
myString.replace('Hola' , 'Bye') #replace remplaza una palabra por una nueva

#Eliminar los espacios en blanco de una cadena en Python
myString.lstrip() #Eliminar los espacios en blanco al principio de una cadena  " Demo  Example  " => "Demo  Example  "
myString.rstrip() #Eliminar los espacios en blanco al final de una cadena " Demo  Example  " => " Demo  Example"
myString.strip() #Eliminar los espacios en blanco al principio y al final de una cadena " Demo  Example  " => "Demo  Example"
#Quitar caracteres especiales o saltos de linea o espacios al inicio y final de una cadena
myString.replace(" ", "") #elimina todos los espacios en blanco " Demo  Example  " => "DemoExample"
output = " ".join(myString.split()) #Sólo eliminar los espacios dobles de una cadena " Demo  Example  " => 'Demo Example'

#Eliminar espacios en blanco de un string con python regex
import re 
re.sub(r"^\s+", "", myString) #Eliminar los espacios en blanco al principio " Demo  Example  " => "Demo  Example  "
re.sub(r"\s+$", "", myString) #Eliminar los espacios en blanco al final  " Demo  Example  " => " Demo  Example"
re.sub(r"\s+", "", myString) #elimina todos los espacios en blanco " Demo  Example  " => "DemoExample"
output = " ".join(re.split(r"\s+", myString))  #Sólo eliminar los espacios dobles de una cadena " Demo  Example  " => 'Demo Example'

#Convertir una cadena en una lista en Python
list(myString) #cadena a una lista "Python" => ['P', 'y', 't', 'h', 'o', 'n']
output=myString.split(',') #split separa la cadena en palabras (ARRAY) a partir de un caracter ',' por defecto es apartir de un espacio 'x,y,z' => ['x', 'y', 'z']
import ast
output = ast.literal_eval("['xxx','yyy','zzz']") #Convertir una cadena específica en una lista  "['xxx','yyy','zzz']" => ['xxx', 'yyy', 'zzz']
output = eval("['xxx','yyy','zzz']")  #Convertir una cadena específica en una lista  "['xxx','yyy','zzz']" => ['xxx', 'yyy', 'zzz']

#Convertir una lista a cadena en python
cadena = "-".join(["1","2","3"]) #Unira los elementos en este caso por un - ["1","2","3"] => "1-2-3"


#eliminar caracteres no alfanuméricos de una string.
import re
s = re.sub(r'\W+', '', "Welcome, User_12!!") #eliminar caracteres no alfanuméricos de una string. \W es equivalente a [^a-zA-Z0-9_], que conserva todos los números y letras junto con los guiones bajos. "WelcomeUser_12"
s = re.sub(r'[^a-zA-Z0-9]', '', "Welcome, User_12!!")  #eliminar caracteres no alfanuméricos de una string. que conserva todos los números y letras "WelcomeUser12"
s = ''.join(ch for ch in "alphanumeric@123__" if ch.isalnum()) #Elimina caracteres no alfanumericos "alphanumeric123"
s = ''.join(filter(str.isalnum, "alphanumeric@123__")) #Elimina caracteres no alfanumericos "alphanumeric123"
print(s)    # BienvenidoUsuario_12



#eliminar caracteres no permitidos
#Forma 1
characters_nopermitidos = "'!?."
myString = ''.join( x for x in "Hey! What's up?..." if x not in characters_nopermitidos) #Hey Whats up
#Forma 2
string = "Hey! What's up?"
characters = "'!?"
for x in range(len(characters)):
    string = string.replace(characters[x],"") #Hey Whats up
#Froma 3
import re
string = re.sub("\!|\'|\?","","Hey! What's up?") #Hey Whats up



#Validar strings
myString.isalnum() #Devuelve verdadero si todos los caracteres de la string son alfanuméricos; de lo contrario, devuelve falso.
myString.isalpha() #Devuelve True si la cadena es alfabética, de lo contrario False.
myString.isdigit() #Devuelve True si la cadena es numérica, de lo contrario False.
myString.isnumeric() #isnumeric devuenve true si el valor es numerico
myString.islower #Devuelve True si la cadena contiene solamente minúsculas, de lo contrario False.
myString.isupper #Develve True si la cadena contiene solamente mayúsculas, de lo contrario False.
myString.isalpha() #isnumeric devuenve true si el valor es alfanumerico
myString.isspace #Devuelve True si la cadena contiene solamente espacios en blanco, de lo contrario False.
s = ''.join(filter(str.isalnum, "Welcome, User_12!!")) #filtrar la string que coincide con el isalnum()  "WelcomeUser12"

#Generar una nueva lista filtrando las sublistas vacías
nueva_lista = [sublista for sublista in lista if sublista]
nueva_lista = [elemento_lista for elemento_lista in primera_lista if elemento_lista]
nueva_lista = list(filter(bool, lista))


myString.count('Hola') #count cuenta palabras o caracteres
myString.index('a') #index muestra el numero de indice del la posicion del caracter
print(len(myString)) #len obtiene la longitud o el numero de caracteres de la cadena
#Metodos encadenados
print(myString.replace('Hola' , 'Bye').upper()) #replace remplaza una palabra por una nueva

print(f" Atencion!! {myString}") #La f indica que abra varibles dentro de la cadena
#print(" Atencion!! {1}".format(myString)) #La f indica que abra varibles dentro de la cadena