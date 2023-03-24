


//Instalación de Github
//En Debian/Ubuntu y derivados:

sudo apt-get install git

//Configuración inicial de Github
//configurar los detalles de configuración del usuario GitHub. 

git config --global user.name "nombre_usuario"
git config --global user.email "email_id"

//Creación de un repositorio local
//Crear una carpeta en tu computadora, que servirá como un repositorio local. 
//Para ello, basta ejecutar el siguiente comando:

git init Mytest

//Este comando crea la carpeta MyTest. A su vez, hace que MyTest sea reconocido como un repositorio local de Git.

//Acceder al directorio
cd Mytest

//Creación de un archivo README para describir el repositorio
//El archivo README se utiliza generalmente para describir lo que el repositorio contiene o lo que el proyecto se trata. 

gedit README

//Agregar archivo por archivo al índice

git add README
git add smaple.c

git add archivo1.txt archivo2.txt archivo3.txt

//Agregar todos los archivos por extencion
git add *.txt

//Agregar todos los archivos al indice
git add .

//Ingnorar archivos a subir 
//Crear archivo
.gitignore
//Escribir nombre de archivos o carpetas a ignorar
git add .gitignore

//MOstrar el estado del repositorio
git status
git status -s //Mustra el estado de forma resumida

//Guardar los cambios realizados en el índice
// Esto significa que ya se ha terminado de agregar o modificar archivos y que los cambios pueden ser subidos al repositorio remoto de Github.
git commit -m "mensaje"
//«mensaje» puede ser cualquier mensaje que describa brevemente los cambios en cuestión, por ejemplo: «agregué tal funcionalidad» o «corregí tal cosa», etc.


//Creación de un repositorio en GitHub
//iniciar sesión en Github y crear el repositorio
//Para conectarse al repositorio remoto en GitHub hay que ejecutar el comando:

git remote add origin https://github.com/user_name/Mytest.git

//Verificar si ya esta la conexion
git remote -v

//Actualizar conexion del repositorio si ya existe el origen
git remote set-url origin https://github.com/user_name/Mytest.git

//Remover la conexion al repositorio remoto
git remote rm origin
git remote remove origin

//Empujar archivos del repositorio local al repositorio GitHub
git push origin master
//Sólo resta introducir las credenciales de inicio de sesión (nombre de usuario y contraseña).
//Esto subirá todo el contenido de la carpeta MyTest (repositorio local) a GitHub (repositorio externo).


//Creación de una rama (branch)
//Se utiliza paraa corregir errores o agregar nuevas funciones a menudo crean una rama (branch) o copia del código de modo que puedan realizar commits en forma separada, sin afectar el proyecto original. 

git branch //Mustra en que rama nos encontramos

//Crear una nueva rama:

//Opción 1 (larga) Para crear una nueva rama:

git branch mirama # crea una nueva rama llamada mirama
git checkout mirama //- pasa a utilizar la rama mirama.

//Opción 2 (corta) Para crear una nueva rama:

git checkout -b mirama //- crea y pasa a utilizar la rama mirama


//Renombrar la rama 
git branch -M main

//Luego, cuando hayan terminado pueden fusionar esta rama de vuelta en la rama principal (master).
//Una vez realizados los cambios, hay que agregarlos al índice de la rama y hacer el commit correspondiente:
git add .
git commit -m "cambios en mirama"


//Luego, hay que volver a la rama principal y tomar los cambios realizados en mirama:
git checkout nombrerama //Moverse de rama 
git checkout master  //ejemplo

//Traer los cambios de la otra rama alterna 
git merge mirama 


//Borrar rama alterna
//(ya que los cambios fueron incorporados en master):
git branch -d mirama


//Y subir master a Github:
git push origin master


//Ver el historial del los commit del repositorio
git log --online

//Clonar un repositorio
git clone https://github.com/usemoslinux/Ankifox.git

//Remover todo el repositorio local de Git
rm -rf .git
rmdir /s /q .git






errores

Error al momento de hacer push
remote: Permission to NodoVisualMedia/Training-Test-1.git denied to juanfar.
fatal: unable to access 'https://github.com/NodoVisualMedia/Training-Test-1.git/': The requested URL returned error: 403
Lo más probable es que ya lo hayan solucionado, sin embargo, si una persona llegó hasta aquí, la solución a nivel de windows … ingresar a Panel de control\Todos los elementos de Panel de control\Administrador de credenciales y crendenciales de windows buscar y eliminar la crendencial guardada de github. Reintentar el push remote, de esta forma github solicita las credenciales a nivel remoto, solucionando así el problema.




Una vez estés ahí, tendrás que utilizar el comando para clonar la rama con la instrucción inherente de Git: 

git clone -b (o – branch) main https://github.com/(link del repositorio remoto de Git) 
o la instrucción
 git clone –branch.

Cómo Clonar una Branch Específica
Ahora vamos a clonar una branch específica de nuestro repositorio de demostración. Hay dos maneras de clonar una branch específica. Puedes hacer cualquiera de ellas:

Clonar el repositorio, obtener todas las branches, y hacer un checkout a una branch específica inmediatamente.
Clonar el repositorio y obtener sólo una branch.
Opción Uno
git clone --branch <branchname> <remote-repo-url>
o

git clone -b <branchname> <remote-repo-url>
Aquí -b es sólo un alias para --branch



Opción Dos
git clone --branch <branchname> --single-branch <remote-repo-url>
o

git clone -b <branchname> --single-branch <remote-repo-url>
Aquí -b es sólo un alias para --branch
Esto realiza la misma acción que la opción uno, excepto que la opción --single-branch fue introducida en la versión 1.7.10 y posteriores de Git. 
Te permite sólo recuperar archivos de la branch especificada sin recuperar otras ramas.
