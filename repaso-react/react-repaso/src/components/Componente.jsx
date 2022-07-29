//con la extencion React/redux al escribir "rfc" se crear la estructura del componete

import React from 'react';

//Las funciones en react se comienzan con una letra mayuscula devido 
//a que son componentes creados por nosotros y no de html
//Los parametros en las funciones entraran en forma de array
export function Componente({comentario, comentario_dos}) {
  //Asignacion ternaria
  comentario = (comentario) ? comentario : 'no exite comentario';
  comentario_dos = (comentario_dos) ? comentario_dos : 'no exite comentario dos';
  //let size_img = (sizeimg==="smail") ? style.is_smail : (sizeimg==="large") ? style.is_large : style.is_normal;
  //Se puede guardar html debido a que es html-de-react
  var parrafo = <p><span>parrafo</span></p>;

  //funciones flecha
  const FuncionFlechaUnaLinea = () => "hola"
  const FuncionFlechaVariasLineas = () => {
      return "hola soy una funcion flecha"
  }
  const listado = [{"nombre":"john",},{"nombre":"pablo",}]
  
  return (
          //Solo se puede renderizar un componete
          <div>
          {/* para insertar codigo javascript se utilizan las llaves */}
                <div>{FuncionFlechaVariasLineas()}</div>
                <div >{comentario}</div>
                <div>{comentario_dos}</div>
                <div>{parrafo}</div>
                <ul>
                    {listado.map(elemento => (<li>{elemento.nombre}</li>))}
                </ul>
          </div>
          // <></>  Version Reducida
          //<React.Fragment></React.Fragment>
          //Esto esta prohibido mandar 2 componenetes
          //<div></div>
          //<div></div>

    )
}

//Exportar la funcion por defecto
//export default function Componente({comentario}) {
//  //para insertar codigo javascript se utilizan las llaves
//  return (
//    <div>{comentario}</div>
//  )
//}
