import React, { useCallback } from 'react';
import { Button } from '@mui/material';
import { useDispatch } from 'react-redux';
import { useForm } from 'react-hook-form';
import { setSearch } from '../../../../redux/productSlice';
import debounce from 'just-debounce-it';

import { Navigate, useNavigate } from 'react-router-dom';
import { FormInputText } from '../../../../components/FormInputText';

const Header = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate()


  const debouncedGetProducts= useCallback(debounce((search) =>{
    dispatch(setSearch(search));
  },300 ),[])


  const handleClick = () => {
    navigate("create")

  };

  const { control, handleSubmit, reset, formState: { errors } } = useForm({
    defaultValues: { id: 0, name: '', price: 0},
  });

  const handleSearchChange = (event) => {
    debouncedGetProducts(event.target.value)
  };

  return (
    <div style={{ display: "flex", justifyContent: "space-between" }}>
      <div style={{ alignItems: "right" }}>
        <FormInputText
          name="search"
          control={control}
          label="Buscar"
          externalOnChange={handleSearchChange}
        />
      </div>

      <div>
        <Button variant="contained" color="primary" onClick={handleClick}>
          Crear Producto
        </Button>
      </div>
    </div>
  );
};

export default Header;
