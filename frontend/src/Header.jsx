import React from 'react'
import "./Header.css"

function Header() {
  return (
        <div className="contenedor-header">
        <header>
            <div className="logo">
                <a href="#">Ldrl</a>
            </div>
            <nav id="nav">
                <ul>
                    <li><a href="/private/inicio">Inicio</a></li>
                    <li><a href="/private/buscar">Sobre mi</a></li>
                    <li><a href="/private/crear">Contacto</a></li>
                </ul>
            </nav>
        </header>
    </div>
  )
}

export default Header