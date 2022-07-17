<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>


<div id="div_general">
    <h1 class="hola_mundo">HOLA MUNDO</h1>
    <p class="bienvenidos">BIENVENIDOS</p>
    <p class="temas">tema1</p>
    <p class="temas">tema2</p>
    <p class="temas">tema3</p>
    <p class="temas">tema4</p>
    <p class="temas">tema5</p>
    <bottom class="btn_click">Bottom</bottom>
</div>
<script type="text/javascript">
          const h1 = document.querySelector(".hola_mundo");
          //console.log(h1);

          h1.style.color = "red";
          h1.style.fontSize = "70px";


          const temas = document.querySelectorAll(".temas");
          //temas.style.color = "red";
          //temas.textContent = "Nuevo texto";
          //temas.style.fontSize= "30px";
          console.log(temas);

          const btn = document.querySelector(".btn_click");
          //console.log(btn);

          console.log(document.documentElement);

          var objeto_html = document.documentElement;
          var objeto_head = objeto_html.firstChild;
          var objeto_body = objeto_html.lastChild;
          console.log(objeto_head)
          console.log(objeto_body)

          var objeto_head = objeto_html.childNodes[0];
          var objeto_body = objeto_html.childNodes[1];


         /*  const nAzar = 5;
          const intentos = 3;
          //console.log("escribe un numero");
          document.writeln("escribe un numero");
          document.writeln("ingresa un numero");
          //console.log("ingresa un numero");
          nUser=5
          while(nAzar <> nUser & intento > 1){
                  if(nAzar > nUser){
                    //console.log("valor muy bajo");
                    document.writeln("valor muy bajo")
                  }else{
                    //console.log("valor muy alto");
                    document.writeln("valor muy alto")
                  }
                  intento = intentos - 1;
                  document.writeln("te quedan mas intentos")
                  //console.log("te quedan mas intentos");
                  nUser=prompt("Imgrese un numero");
          }
          if(nAzar==nUser){
            //console.log("adivinaste");
            document.writeln("adivinaste")
            
          }else{
            document.writeln("perdiste")
            //console.log("perdiste");
          } */
          /*   let numeroUno = prompt("Ingresa el primero número");
            let numeroDos = prompt("Ingresa el segundo número");
            //let resultado = numeroUno + numeroDos;
            //console.log(resultado); // ¿no es el resultado esperado?
            let resultado = parseInt(numeroUno) + parseInt(numeroDos);
            console.log(resultado);
 */
/*         let resultado = true || false || false;
        console.log(resultado); */

        //const animales = ["caballo","leon","mamut","perro","gato","zorro"];
        //animales[1]=["leona"];
        //animales.unshift("ballena","delfin");
        //console.log(animales);

       /*  const frutas = ["manzana", "pera"];

        frutas.unshift("uva");

        const frutaEliminada = frutas.pop();

        console.log(frutas);
        console.log(frutaEliminada); */
      /*   let frutas = ["manzana", "sandía", "pera"]
        frutas.forEach((fruta, index, array) => {
            console.log(index + fruta , array)
           // console.log(fruta)
           //console.log(array)
        }) */

       /*  const gato = {
            nombre: "Valiente",
            duerme: true,
            edad: 10,
            enemigos: ["agua", "perros"],
            comer(comida) {
                return `${nombre} está comiendo ${comida}`;
            },
        };

        console.log(gato.comer("pez")); */

        //El objeto de compone de llaves 
         //puntos para asignar u valor a una propiedad
        const ciudad = {
             nombre: "Mexico",
             capital: "ciudad de Mexico",
             nestados:32,
             rios : ["lerma"],
             ciudades:{
                 morelia:"morelia",
                 jalisco:{},
                 nayarit:{}, 
                 edomex:{
                     municipios:["atlacomulco","toluca","lerma"]
                 },
                 Tabasco:{},
                 Chihuahua:{},
                 Monterrey:{},
                 Hidalgo:{}
                },
             otros:{
                    tradiciones:["navidad", "noche de brujas", "15 de septiembre"],
                    comida:{
                        antojitos:["pambazo","enchiladas","tostadas"],
                        tradicional:{
                            tacos:["pastor","longaniza","tripa","campechano"],
                            tostadas:["tinga","pollo","frijoles"],
                            //Forma numero uno de colocar un metodo dentro de un bjeto
                            comidaalert: function () {
                                //alert("Aqui esta la comida");
                                //this hace referencia al contexto actual tradicinal en este caso
                                //this no exite en las arrow functions
                                return `Ejemplo de this ${this.tacos} ${this.tostadas}`;
                            }

                        }
                    },
                    //forma 2 de colocar un metodo dentro de un objeto
                    juegos(nombre){
                         return ` ${nombre} los juegos son basket boll,futbool,tennis`;
                    }
             },
             //0 parametros 
            get nombreMayuscula() {
                 return this.nombre.toUpperCase();
            },
            //Debe tener un parametro
            set nuevoRio(nuevo) {
                this.rios.push(nuevo);
            },
        };
        //forma de acceder al objeto anidado
        //console.log(ciudad.otros.comida.tradicional.tacos);

        //Acceder al elemento de un array
        //console.log(ciudad.otros.comida.tradicional.tacos[3]);

        //añade un elemento al final del array
        //console.log(ciudad.otros.comida.tradicional.tacos.push("bisteck"));

        //añade un elemento al inicio del array
        //console.log(ciudad.otros.comida.tradicional.tacos.unshift("chuleta"));

        //elimina un elemento al final del array
        //console.log(ciudad.otros.comida.tradicional.tacos.pop());

        //elimina un elemento al inicio del array
        //console.log(ciudad.otros.comida.tradicional.tacos.shift());

        //Verificar la longitud del array
        //console.log(ciudad.otros.comida.tradicional.tacos.length);

        //INterpolacion o template string
        //console.log(`Bienvenido a ${ciudad.ciudades.morelia}`);
        //console.log(`La comida de ${ciudad.nombre} es ${ciudad.otros.comida.antojitos}`);

        //Acceder a los metodos o funciones dentro del objeto
        //console.log(ciudad.otros.juegos("luis lopez"));

        //hasOwnProperty devuelve true o false si existe o no una propiedad
        //console.log(ciudad.ciudades.edomex.hasOwnProperty("municipios"));
        //if(ciudad.ciudades.edomex.hasOwnProperty("municipios")){
        //    ciudad.ciudades.edomex.municipios[0]="toluca";
        //}
        //Un metodo de invoca como un afuncion solo que esta perteece al objeto
        //console.log(ciudad.otros.comida.tradicional.comidaalert());

        //forma de validad la referencia
        //console.log(ciudad.ciudades.edomex?.municipios);
  
        //for in solo itera las propiedades de un objeto
        //for(const propiedad in ciudad){
        //    console.log(ciudad[propiedad])
        //}

        //Object.values devuelve un array con os valores de las propiedades enumeradas
        //console.log(Object.values(ciudad));
        //Object.values(ciudad).forEach((item) => console.log(item));

        //Desctrucuting permite desempacar los valores de objetos y arrays
        //const {nombre,capital,nestados,ciudades}=ciudad;
        //ALias o sobrenombre de la variable ademas de asignarle un valor por defecto
        //const {tacos: lostacos = "Sin nombre", tostadas}=ciudad.otros.comida.tradicional;
        //console.log(tacos)
        //Destructurind de anidados 
        //const { otros: { tradiciones }, } = ciudad;
        //console.log(tradiciones);
        //Destructuring de metodos
        //const { juegos } = ciudad;
        //const { otros: {juegos} } = ciudad;
        //console.log(juegos("pez"));

        // GET
       // console.log(ciudad.nombreMayuscula);

        // SET
        //ciudad.nuevoRio = "nilo";
        //console.log(ciudad.rios);

        
        //Si cambiamos el valor de a, b sigue siendo "hola"
        //let a = "hola";
        //let b = a;
        //a = "chao";
        //console.log(b);

        //b sera el mismo valoe que a 
        //const a = {
        //    nombre: "hola",
        //};
        //const b = a;
        //a.nombre = "chao";
        //console.log(b); 

        //console.log(document)

    
            
    </script>
    
</body>
</html>