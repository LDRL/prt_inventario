import React, { CSSProperties, useEffect, useState } from 'react';
import { Box, Button} from '@mui/material';
import { useDispatch, useSelector } from 'react-redux';

import { useForm } from 'react-hook-form';

import "./ProductCreate.css"
import { ClipLoader } from 'react-spinners';
import { useNavigate, useParams } from 'react-router-dom';
import { useCreateProduct, useFetchProduct, useUpdateProduct } from '../../hooks/useProductOption';
import { useFetchOptions, useFetchProveedorOptions } from '../../hooks/useFetchOptions';
import CardForm from '../../../../components/Cards/CardForm';
import LoadMask from '../../../../components/LoadMask/LoadMask';
import { FormDropdown, FormInputNumber, FormInputText, FormTextArea } from '../../../../components/FormInputText';
import { openModal,closeModal } from '../../../../redux/productSlice';
const override = {
  display: "block",
  margin: "0 auto",
  borderColor: "red",
};

const CreateProduct = () => {
  const [loading , setLoading] = useState(false);
  const [subtitulo, setSubtitulo] = useState("");
  const [color] = useState("#ffffff")
  const navigate = useNavigate();

  const {id} = useParams(); //Se captura el id de un producto
  const dispatch = useDispatch();
  const { currentProduct } = useSelector((state) => state.product);

  const { control, handleSubmit, reset, formState: { errors } } = useForm({
    defaultValues: { id: 0, name: '', price: 0, amount:0 },
  });

  const {data: options, isLoading, isError} = useFetchOptions();
  const {data: marcaOptions, isLoading: isMarcaLoading, isError: isMarcaError} = useFetchProveedorOptions();

  
 const createProductMutation = useCreateProduct();
 const updateProductMutation = useUpdateProduct();


 const { data, isLoadingCategory, isErrorCategory } = id ? useFetchProduct(id) : { data: null, isLoading: false, isError: false };
  
 useEffect(() => {
  if (id && data) {
    console.log(data, "--data ---")
    dispatch(openModal(data));
    return;
  }
  dispatch(closeModal());
  // dispatch(clearCategory());
}, [dispatch, data]);

useEffect(() => {
  if (currentProduct) {
    
    reset(currentProduct);
    setSubtitulo("Editar");
  } else {
    reset({ id: 0, name: '', price: 0, amount: 0 });
    setSubtitulo("Nuevo");
  }
}, [currentProduct, reset]);





  const onSubmit = async (data) => {
    setLoading(true);
    console.log(currentProduct, "-current")
    console.log(data, "---")
    try {
      // let responseData;
      if (currentProduct) {
        // Update the product
        await updateProductMutation.mutateAsync(data);
      } else {
        // Create a new product
        await createProductMutation.mutateAsync(data);
      }
      navigate(`/private/product`, {replace:true})
    } catch (error) {
      console.log(error)
    }
    finally {
      setLoading(false); // Desactiva el loader
    }
  };
  if (isLoading){
    return <p>Cargando opciones ....</p>
  }
  if(isError){
    console.log(isError, "======")
    return <p>Error al cargar las opciones, {isError}</p>
  }

  if (isMarcaLoading){
    return <p>Cargando opciones ....</p>
  }
  if(isMarcaError){
    console.log(isMarcaError, "======")

    return <p>Error al cargar las opciones</p>
  }

  

  return (    
    <div className='container' style={{marginTop:'40px'}}>
      {loading && (
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
      )}

      <CardForm
        titulo='Producto'
        subtitulo={subtitulo}
      >
        <LoadMask
        />

        <Box
          component="form"
          onSubmit={handleSubmit(onSubmit)}
          autoComplete="off"
        >
          <div className='section'>
            <FormInputText
                name="name"
                control={control}
                label="Nombre producto"
                rules={{ required: 'Product name is required' }}
              />
          </div>

          <div className='container_selector'>
              <FormDropdown
                name="idCategory"
                control={control}
                label="categoria......"
                rules={{ required: 'categorie name is required' }}
                options={options || []}
              />
            
              <FormDropdown
                name="idProveedor"
                control={control}
                label="Proveedor"
                rules={{ required: 'proveedor name is required' }}
                options={marcaOptions || []}
              />         

             
          </div>

          

          <div className='container_selector'>
            <FormInputNumber
              name="amount"
              control={control}
              label="Cantidad"
              rules={{ required: 'Cantidad es requerido' }}
            />

            <FormInputNumber
              name="price"
              control={control}
              label="Precio"
              rules={{ required: 'Precio es requerido' }}
            />
            </div>
            <div className='container_button'>
              <Button
                variant="contained"
                type="submit"
                sx={{ mt: 2 }}
              >
                Guardar
              </Button>
              <Button
                variant="contained"
                type="button"
                sx={{ mt: 2 }}
                color='error'
              >
                Cancelar
              </Button>
            </div>
        </Box>
      </CardForm>
    </div>
  );
};

export default CreateProduct;
