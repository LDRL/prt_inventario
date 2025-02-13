import { ProductTable } from "./components";
import Header from "./components/Header/Header";



export default function Product(){
    // const sidebarState = useSelector(store.sidebar)
    
    return(
        <div style={{margin:'60px'}}>

            <div>
                <h2>Listado de productos</h2>
                <hr />
            </div>

            <div className="" style={{marginBottom:"10px"}}>
                <Header />
            </div>
            

            <div style={{width: "94vw"}}>
                <ProductTable />
            </div>
        </div>

    )
}