import React from "react";
//Las funciones en react se comienzan con una letra mayuscula devido 
//a que son componentes creados por nosotros y no de html
export function Comment({comentario}){
    return(
        //para insertar codigo javascript se utilizan las llaves
        <div>{comentario}</div>
    );
}

function App() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
        </header>
      </div>
    );
  }
  
export default App;