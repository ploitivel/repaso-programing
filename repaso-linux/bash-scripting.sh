#!/bin/bash


##########################################################
####################### VARIABLES ########################
##########################################################

nombre_variable=valor_variable

#Es importante no dejar espacios ni antes ni después del =
#Sólo puede contener caracteres alfanuméricos y guiones bajos
#El primer carácter debe ser una letra del alfabeto o “_” (este último caso se suele reservar para casos especiales).
#No pueden contener espacios.
#Las mayúsculas y las minúsculas importan, “a” es distinto de “A”.
#Algunos nombres som usado como variables de entorno y no los debemos utilizar para evitar sobrescribirlas (e.g.,PATH).
#Las variables de entorno se escriben en mayúscula,
#De manera general deberemos escribir el nombre de las variables en minúscula.


##########################################################
####################### Funciones ########################
##########################################################
#no tener que repetir una y otra vez, el mismo código.
#mayor costo de mantenimiento
#Primero se hace la Declaracion del la funcion y despues de hace la llamada
#Las funciones bash pueden aceptar cualquier número de parámetros. El siguiente ejemplo acepta dos parámetros:


mi_primera_funcion(){
    echo Hola Mundo
    echo $1
    echo $2
    echo $3
}
#mi_primera_funcion(){ echo Hola Mundo; echo otro Hola; }

read -p "Enter a number: " int2

#llamada de la funcion
mi_primera_funcion "Hello" "World" $int2

#Ejemplo
addition(){
   sum=$(($1+$2))
   return $sum
}
read -p "Enter a number: " int1
read -p "Enter a number: " int2
addition $int1 $int2
echo "The result is : " $?

#VARIABLES ESPECIALES DE LA FUNCION 

funcion1(){
    #puedes hacer uso de las variables especiales para trabajar con tu función.
    echo $0 # $0 representa el nombre del script
    echo $# # $# el número de argumentos que se pasan a un script
    echo $@ # $@ todos los argumentos que se han pasado al script
    echo $$ # $$ el ID del proceso del script
    $1 – $9 # los primeros nueve argumentos que se pasan a un script en Bash
    ans=$(($1+$2))
    echo $? # $? la salida del último proceso que se ha ejecutado
    echo $ans 
    echo $? # $? la salida del último proceso que se ha ejecutado

    if [ $# -gt 0 ]
    then
        echo Con argumentos
    else
        echo Sin argumentos
    fi
}
funcion1 2 2 3
echo $?


#Devolver valores
funcion1(){
    return 5 #devolver el estado de la función
}
funcion1
echo $?

#GUARDAR RESULTADO DE LA FUNCION EN VARIABLE
funcion1(){
    local resultado='resultado'
    echo "$resultado"
}
resultado=$(funcion1)
echo $resultado

#Reutilizar funciones de otro script

#!/bin/bash
suma(){
    local resultado=$(($1+$2))
    echo $resultado
}

Si lo quisieras utilizar en otro script, tienes que hacerlo tal y como ves a continuación,

#!/bin/bash
source ./script1
echo $(suma 2 2)


Si ejecutas funcion1 2 2 verás que imprime un 4 como es de esperar.

Tal y como te comentaba antes de este ejemplo, puedes hacer uso de las variables especiales para trabajar con tu función. Así, estas variables, son,

    $0 representa el nombre del script
    $1 – $9 los primeros nueve argumentos que se pasan a un script en Bash
    $# el número de argumentos que se pasan a un script
    $@ todos los argumentos que se han pasado al script
    $? la salida del último proceso que se ha ejecutado
    $$ el ID del proceso del script

En este sentido, como ves, excepto el primero y el último, que hacen referencia al propio script, el resto los puedes utilizar perfectamente en tus funciones. Ahora modifica ligeramente la función, añadiendo esas variables especiales, como puedes ver a continuación,


##########################################################
########################## BUCLES ########################
##########################################################

for VARIABLE in LISTA_VALORES;
do
    COMANDO 1
    COMANDO 2
    ...
    COMANDO N
done

Donde la lista de valores puede ser un rango númerico:

for VARIABLE in 1 2 3 4 5 6 7 8 9 10;
for VARIABLE in {1..10};
una serie de valores:

for VARIABLE in file1 file2 file3;

o el resutlado de la ejecución de un comando:
for VARIABLE in $(ls /bin | grep -E 'c.[aeiou]');

Hay que tener en cuenta que si pasamos un listado de valores pero lo ponemos entrecomillado, el ordenador lo enterá como un única línea:

for VARIABLE in "file1 file2 file3";

Un ejemplo simple de for sería:

#!/bin/bash
for numero in {1..20..2};
do
  echo Este es el número: $numero
done


#for ((i = 0 ; i < 100 ; i++)); do
#  echo $i
#  break
#done



##########################################################
##################### cONDICIONALES ######################
##########################################################

La sintaxis básica de un condicional es la siguiente

if [[ CONDICIÓN ]];
then  
      #COMANDO 1 si se cumple la condición
elif [[ CONDICIÓN 2 ]];
then
      #COMANDO 2 si no se cumple la condición 1 y se cumple la comdicion 2
else  
      #COMANDO 3 si no se cumple la condición 1 y 2
fi    

#operador  significado

# -lt  ->  menor que (<)
# -gt  ->  mayor que (>)
# -le  ->  menor o igual que (<=)
# -ge  ->  mayor o igual que (>=)
# -eq  ->  igual (==)
# -ne  ->  no igual (!=)

EJEMPLOS:

Condicionales con números

num1=1 
num2=2  
if [[ $num1 -gt $num2 ]]; 
then
  echo $num1 es mayor que $num2
else
  echo $num2 es mayor que $num1
fi

#Condicionales con cadenas de texto


#  operador        significado
#    =      ->     igual, las dos cadenas de texto son exactamente idénticas
#    !=     ->     no igual, las cadenas de texto no son exactamente idénticas
#    <      ->     es menor que (en orden alfabético ASCII)
#    >      ->     es mayor que (en orden alfabético ASCII)
#    -n     ->     la cadena no está vacía
#    -z     ->     la cadena está vacía


#!/bin/bash
string1='reo'
string2='teo'
if [[ $string1 > $string2 ]];
then
  echo Eso es verdad
else
  echo Eso es mentira
fi


También podemos hacer comparaciones haciendo uso de wildcards:

#!/bin/bash
string1='reo'
if [[ $string1 = *e* ]];
then
  echo Eso es verdad
else
  echo Eso es mentira
fi


#Condicionales con archivos

#operador    Devuelve true si
-e name  ->  name existe
-f name  ->  name es un archivo normal (no es un directorio)
-s name  ->  name NO tiene tamaño cero
-d name  ->  name es un directorio
-r name  ->  name tiene permiso de lectura para el user que corre el script
-w name  ->  name tiene permiso de escritura para el user que corre el script
-x name  ->  name tiene permiso de ejecución para el user que corre el script


Ejemplo, script que nos informe sobre el contenido de un directorio:

#!/bin/bash
for file in $(ls);
do
  if [[ -d $file ]];
  then
    echo directorio: $file
  else
    if [[ -x $file ]];
    then
      echo archivo ejecutable: $file
    else
      echo archivo no ejecutable: $file
    fi
  fi


##########################################################
########## Manipulación de cadenas de texto ##############
##########################################################

#Extraer subcadena

Mediante ${cadena:posicion:longitud} podemos extraer una subcadena de otra cadena. 
Si omitimos :longitud, entonces extraerá todos los caracteres hasta el final de cadena.

Por ejemplo en la cadena string=abcABC123ABCabc:

echo ${string:0} : abcABC123ABCabc
echo ${string:0:1} : a (primer caracter)
echo ${string:7} : 23ABCabc
echo ${string:7:3} : 23A (3 caracteres desde posición 7)
echo ${string:7:-3} : 23ABCabc (desde posición 7 hasta el final)
echo ${string: -4} : Cabc (atención al espacio antes del menos)
echo ${string: -4:2} : Ca (atención al espacio antes del menos)


#Borrar subcadena

${cadena#subcadena} : borra la coincidencia más corta de subcadena desde el principio de cadena
${cadena##subcadena} : borra la coincidencia más larga de subcadena desde el principio de cadena

Por ejemplo, en la cadena string=abcABC123ABCabc:

echo ${string#a*C} : 123ABCabc
echo ${string##a*C} : abc

#Reemplazar subcadena

También existen diferentes formas de reemplazar subcadenas de una cadena:

${cadena/buscar/reemplazar} : Sustituye la primera coincidencia de buscar con reemplazar
${cadena//buscar/reemplazar} : Sustituye todas las coincidencias de buscar con reemplazar

Por ejemplo, en la cadena string=abcABC123ABCabc:

echo ${string/abc/xyz} : xyzABC123ABCabc.
echo ${string//abc/xyz} : xyzABC123ABCxyz.

Para el caso de convertir el texto a mayúsculas ${cadena^^} 
Y si lo que quieres es convertir a mayúsculas solo la primera letra ${cadena^}


#Operaciones aritméticas
Por último, Bash también permite la operaciones aritméticas con número enteros:

# suma, resta
$num=10
echo $((num + 2))

# potencia
echo $((num ** 2))

# multiplicación, división, resto (módulo)
echo $((num * 2))
echo $((num / 2))
echo $((num % 2))

# VAR++ VAR– : post-incrementa, post-decrementa
echo $((num++))
echo $num

# VAR –VAR : pre-incrementa, pre-decrementa
echo $((++num))
echo $num



##########################################################
########## Obteniendo salida de otro comando #############
##########################################################

# whoami muestra el nombre del usuario actual 
echo "Hola, yo soy $(whoami)"
# ls lista los archivos actuales en el directorio
echo "ESta es la ista de archivos: $(ls)"

echo "Hoy es $(date --rfc-3339=date)"

valor_obtenido="$(comando)"

Ejemplo de respaldo de informacion con la fecha actual
mysqldump -u usuario -p nombre_base_de_datos > esquema_$(date --rfc-3339=date).sql



##########################################################
########## ELIMINAR PALABRAS EN BASH #############
##########################################################


Para eliminar sólo el primero pero no el resto, utilice una sola barra como sigue:

bash">myVar='YES WE CAN'

echo "${myVar/E}" 
# YS WE CAN

Para eliminar todo Utiliza barras inclinadas dobles:

echo "${myVar//E}"
# YS W CAN

Puede reemplazar no sólo un único carácter, sino un patrón regex largo. Ver más ejemplos de expansión de variables / sustitución de subcadenas

##########################################################
########## REMPLAZAR PALABRAS EN BASH #############
##########################################################

Usando comando tr
echo Biva Zapata | tr 'B' 'V'
Salida: Viva Zapata

archivo=" $(echo $archivo | tr '_' ' ') "  #Remplaza los guiones por espacios


##########################################################
##########  borrar, odos los números del fichero: #############
##########################################################

Usando comando tr
echo Biva Zapata12342 | tr -d '0-9' > prueba.txt
Salida: Viva Zapata


##########################################################
############# Da color a tus scripts en bash #############
##########################################################

#Estilo de fuente
    Negrita="\e[1m"
    Subrayado="\e[4m"
    Parpadeo="\e[5m"

#COlor de fuente
    Color por defecto="\e[39m"
    Rojo="\e[31m"
    Verde="\e[32m"
    Amarillo="\e[33m"
    Azul="\e[34m"

#Fondo de fuente
    Rojo="\e[41m"
    Verde="\e[42m"
    Amarillo="\e[43m"
    Azul="\e[44m"

#Códigos combinados

Negrita + Texto amarillo + Fondo azul: \e[1;33;44m
Texto rojo + Fondo azul: \e;31;44m

Códigos de reset

    Reset de todo el formato: \e[0m
    Reset de negrita: \e[21
    Reset del color de fuente: \e[39m
    Reset del color de fondo: \e[49m

#Uso de los códigos de formato    
    echo -e "\e[;31mError: Revisa esto\e[0m"
    echo -e "\e[4;30;43mSoy la Abeja Maya\e[0m"
    printf "\e[;31mError: Revisa esto\e[0m\n"



##########################################################
############# INCLUIR UN SCRIPT BASH EN OTRO SCRIPT BASH: #############
##########################################################

#ARCHIVO secundario.sh
#!/bin/bash
WELCOLME=”lazarus”
DATOS=”023 – 031 – 035 – 057”
CHAO=”que tengas buen día”

#ARCHIVO primario.sh
#!/bin/bash
source secundario.sh
echo hola ${WELCOME}!!!
echo recuerda que hoy debes revisar los servidores: ${DATOS}.
echo no lo olvides, ${CHAO}.

$ bash primario.sh
#SALIDA
Hola Lazarus!!!
Recuerda que hoy debes revisar los servidores: 023 – 031 – 035 – 057.
No lo olvides que tengas buen día








