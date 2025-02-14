import React from 'react'
import {Route, Routes } from 'react-router-dom';
import Inicio from '../Inicio';
import RoutersWitNotFound from '../utils/routers-with-not-found.utility';
import Product from '../pages/Producto/Product';
import { ProductCreate } from '../pages/Producto/components/ProductCreate';

function Private() {
  return (
    <RoutersWitNotFound>
        <Route path="/" element={<Inicio />} />
        <Route path = "product" element={<Product />} />
        <Route path = "product/create" element={<ProductCreate />} />
        <Route path = "product/:id/editar" element={<ProductCreate />} />
        
    </RoutersWitNotFound>
  )
}

export default Private