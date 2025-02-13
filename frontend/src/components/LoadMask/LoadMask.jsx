
import { CSSProperties, useState } from 'react';
import Loading from '../Loading';
import { ClipLoader } from 'react-spinners';




const override = {
    display: "block",
    margin: "0 auto",
    borderColor: "red",
  };
  
function LoadMask({loading}){
    // const [loading, setLoading] = useState(true)
    const [color, setColor] = useState("#ffffff")

    return (
        <>
            {
                loading && (
                    <div className="sweet-loading">
                     
                    <ClipLoader
                      color={color}
                      loading={loading}
                      cssOverride={override}
                      size={150}
                      aria-label="Loading Spinner"
                      data-testid="loader"
                    />
                  </div>
                )    
            }
        </>
     )
}

export default LoadMask;