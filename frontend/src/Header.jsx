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
                    <li><a href="/private">Inicio</a></li>
                    <li><a href="/private/product">Producto</a></li>
                </ul>
            </nav>
        </header>
    </div>
  )
}

export default Header