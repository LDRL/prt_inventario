import { Route, Routes } from 'react-router-dom'



function RoutersWitNotFound({children}) {
  return (
    <Routes>
        {children}
        <Route path="*" element={<div> Not found</div>}/>
    </Routes>
  )
}

export default RoutersWitNotFound