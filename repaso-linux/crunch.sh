#Crunch es una utilidad que se utiliza para crear listas de palabras usando letras, números y símbolos para cada combinación posible o según reglas específicas.

crunch [min] [max] [caracteres] -t [patron] -o [nombre_Archivo]

#Ejemplo
crunch 6 6 0123456789abcdef -o 6chars.txt
crunch 2 6 qrs347
crunch 16 16 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ -o 16chars.txt
crunch 16 16 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ | #REdireccionar la salida

-b : el tamaño máximo de la lista de palabras (requiere -o START)
-c : número de líneas para escribir en la lista de palabras (requiere -o START)
-d : limita el número de caracteres duplicados
-e : deja de generar palabras en una determinada cadena
-f : especifica una lista de conjuntos de caracteres del archivo charset.lst
-i : invertir el orden de los caracteres en la lista de palabras
-l : permite la interpretación literal de @,%^ cuando se usa -t
-o : el archivo de lista de palabras de salida
-p : imprime permutaciones sin repetir caracteres (no se puede usar con -s)
-q : como la opción -p, excepto que lee las cadenas de un archivo específico
-r : reanudar una sesión anterior (no se puede usar con -s)
-s : especifica una cadena en particular para comenzar la lista de palabras con
-t : establece un patrón específico de @,%^
        @ representa letras minúsculas
        , representa letras mayúsculas
        % representa números
        ^ representa caracteres especiales
-z: comprime el archivo de lista de palabras de salida, acompañado de -o


crunch [min] [max] [caracteres] -t [patron] -o [nombre_Archivo]

#min -> minima logitud
#max -> maxima longitud
#caracteres -> %$&$#$%& caracteres en especifico
#patron -> si la clave empieza con 1@@@@@@@2
#nombre_archivo -> NOmbre del archivo de salida

#De forma predeterminada , no se requiere el conjunto de caracteres , pero puede usarlo para limitar los caracteres de su lista de palabras a los que especifique. 
#Si elige usar charset , debe mantener el orden correcto, que es lowUP123@%# (letras minúsculas, luego letras mayúsculas, luego números y finalmente símbolos).

crunch [min] [max] [caracteres] -t [patron] -d [num_caracters_duplicados] -o [nombre_Archivo]

crisis 2 6 qrs347

crunch 5 5 abc12 -t @@@14 -d 2@ -i

-d 2@ permite solo 2 letras minúsculas duplicadas. "aab14" y termina en "eed14".
Agregar -i invertiría los resultados,
agregar -e dde14 se detendría después de que se produzca la línea "dde14" (o "41edd" en el caso de una salida invertida).

crunch 2 4 -p kite sky car
#'kite', 'sky' y 'car' se imprimirán en todos los órdenes posibles (totalmente, no por letras) y se enviarán a output owl.txt sin tener en cuenta los números mínimo y máximo. Ninguna de las palabras se repetirá. Si solo se incluye una palabra, se utilizará como conjunto de caracteres. Puede usar -q en lugar de -p para extraer palabras de un archivo específico.

crunch  5 5 bcopuw2468 -s vaca28 -c 33 -b 20mb -o INICIO
#resultado un archivo de texto de 20 mb contiene combinaciones para bcopuw2468 que comienzan con "cow28" y terminan en la línea 33 del resultado teórico.


para atacar en ambos lados se require voltear los caracteres de entrada