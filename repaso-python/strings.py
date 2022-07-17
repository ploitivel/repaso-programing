myString = "Hola mundo , mundial"

#print(dir(myString)) #muesta las metodos o funciones para los string 
#['__add__', '__class__', '__contains__', '__delattr__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__getnewargs__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__mod__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__rmod__', '__rmul__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', 'capitalize', 'casefold', 'center', 'count', 'encode', 'endswith', 'expandtabs', 'find', 'format', 'format_map', 'index', 'isalnum', 'isalpha', 'isascii', 'isdecimal', 'isdigit', 'isidentifier', 'islower', 'isnumeric', 'isprintable', 'isspace', 'istitle', 'isupper', 'join', 'ljust', 'lower', 'lstrip', 'maketrans', 'partition', 'removeprefix', 'removesuffix', 'replace', 'rfind', 'rindex', 'rjust', 'rpartition', 'rsplit', 'rstrip', 'split', 'splitlines', 'startswith', 'strip', 'swapcase', 'title', 'translate', 'upper', 'zfill']  

print(myString[2]) #Imprime la posicion
print(myString[-2]) #Imprime la posicion
print(myString.upper()) #upper cambia el texto a mayuscula
print(myString.lower()) #upper cambia el texto a minuscula
print(myString.replace('Hola' , 'Bye')) #replace remplaza una palabra por una nueva
print(myString.count('Hola')) #count cuenta palabras o caracteres
print(myString.split(',')) #split separa la cadena en palabras (ARRAY) a partir de un caracter ',' por defecto es apartir de un espacio
print(myString.index('a')) #index muestra el numero de indice del la posicion del caracter
print(myString.isnumeric()) #isnumeric devuenve true si el valor es numerico
print(myString.isalpha()) #isnumeric devuenve true si el valor es alfanumerico
print(myString.capitalize()) #capitalize pone la primera letra en mayuscula y las demas en miniscula
print(len(myString)) #len obtiene la longitud o el numero de caracteres de la cadena
#Metodos encadenados
print(myString.replace('Hola' , 'Bye').upper()) #replace remplaza una palabra por una nueva


print(f" Atencion!! {myString}") #La f indica que abra varibles dentro de la cadena
#print(" Atencion!! {1}".format(myString)) #La f indica que abra varibles dentro de la cadena

#Recorrer un string 
for s in myString:
    print(s)