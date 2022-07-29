import React, { useState } from 'react';
//Forma de inportar un icono
import logo from './logo.svg';
//Forma de importar un archivo css
import './App.css';
//Importar un componente 
import {Componente} from './components/Componente'

function App() {
  //useState es una funcion que devuelve 1 array con el estado y la funcion que modifca el estado
  const [Todo, setTodos] = useState([]);
  return (
    <div>
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
           {/*  Forma de llamar a un componete con su parametro */}
            <Componente comentario="Hola Mundo"/>
           {/*  Forma de llamar a un componete con su parametro entre llaves*/}
            <Componente comentario={"Hola Mundo 1"} comentario_dos={"Hola Mundo 2"}/>
          </header>
        </div>  
    </div>
    
  );
}

export default App;
