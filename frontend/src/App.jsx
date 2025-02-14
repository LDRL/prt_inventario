import React from 'react'
import './App.css'
import {BrowserRouter, Route, Navigate } from 'react-router-dom';
import RoutersWitNotFound from './utils/routers-with-not-found.utility';
import AuthGuard from './guards/auth.guard';
import { PrivateRoutes } from './utils/routes';
import Private from './routes/private';
import { Provider } from 'react-redux';
import { store } from './redux/store';


function App() {
  return (
    <Provider store = {store}>
      <BrowserRouter>
        <RoutersWitNotFound>
        <Route path="/" element={<Navigate to ={PrivateRoutes.PRIVATE} />} />

          <Route path="*" element={<>Not found</>}/>

          <Route element={<AuthGuard />}>
          <Route path={`${PrivateRoutes.PRIVATE}/*`} element={<Private />} />

          </Route>
        </RoutersWitNotFound>
      </BrowserRouter>
    </Provider>
    
  )
}

export default App