import React from 'react'
import {Route, Routes } from 'react-router-dom';
import Buscar from '../pages/Buscar';
import Crear from '../pages/Crear';
import Inicio from '../Inicio';
import RoutersWitNotFound from '../utils/routers-with-not-found.utility';
import Product from '../pages/Producto/Product';
import { ProductCreate } from '../pages/Producto/components/ProductCreate';

function Private() {
  return (
    <RoutersWitNotFound>
        <Route path="/" element={<Inicio />} />
        {/* <Route path="/buscar" element={<Buscar />} /> */}
        <Route path = "product" element={<Product />} />
        <Route path = "product/create" element={<ProductCreate />} />
        <Route path = "product/:id/editar" element={<ProductCreate />} />
        <Route path="/crear" element={<Crear />} />
    </RoutersWitNotFound>
  )
}

export default Private