

import React from 'react';
import { useDispatch } from 'react-redux';
import { Button } from '@mui/material';
import { DataGrid } from '@mui/x-data-grid';


import { useNavigate } from 'react-router-dom';
import { openModal } from '../../../../redux/productSlice';
import Loading from '../../../../components/Loading';
import { useProducts } from '../../hooks/useProduct';

import "./ProductTable.css";

const ListOfProducts= () => {
    
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const {
        products,
        totalProduct,
        isLoading,
        paginationModel,
        handlePaginationModelChange,
    } = useProducts();

    console.log(products);

    const handleEditProduct = (product) => {

        dispatch(openModal(product));
        navigate(`${product.id}/editar`)
    };

    const columns = [
        {
            field: 'id',
            headerName: 'Codigo',
            flex: 1,
            minWidth: 150,
            renderCell: (params) => <>{params.value}</>,
        },
        {
            field: 'nombre',
            headerName: 'Nombre',
            flex: 1,
            renderCell: (params) => <>{params.value}</>,
        },
        {
            field: 'cantidad',
            headerName: 'Cantidad',
            flex: 1,
            renderCell: (params) => <>{params.value}</>,
        },
        {
            field: 'categoria',
            headerName: 'Marca',
            flex: 1,
            // renderCell: (params: GridRenderCellParams) => <>{params.value}</>,
            renderCell: (params) => <>{params.value ? params.value.nombre : 'Sin marca'}</>,
        },
        {
            field: 'proveedor',
            headerName: 'Presentacion',
            flex: 1,
            renderCell: (params) => <>{params.value ? params.value.nombre : 'Sin Presentacion'}</>,
        },
        {
            field: 'category',
            headerName: 'Categoria',
            flex: 1,
            renderCell: (params) => <>{params.value ? params.value.name : 'Sin Categoria'}</>,
        },
        {
            field: 'actions',
            type: 'actions',
            sortable: false,
            headerName: 'Actions',
            width: 200,
            renderCell: (params) => (
                <Button
                    variant="contained"
                    color="success"
                    onClick={() => handleEditProduct(params.row)}
                >
                    Edit
                </Button>
            ),
        },
    ];


    if (isLoading) {
        return <Loading loading={isLoading}/>;
    }

    return (
            <DataGrid
            rows={products}
            rowCount={totalProduct}
            columns={columns}
            disableColumnSelector
            disableRowSelectionOnClick
            autoHeight
            initialState={{
                pagination: {
                    paginationModel: {
                        pageSize: paginationModel.pageSize,
                        page: paginationModel.page,
                    },
                },
            }}
            onPaginationModelChange={handlePaginationModelChange}
            pageSizeOptions={[paginationModel.pageSize]}
            getRowId={(row) => row.id}
            paginationMode="server"
        />
        
    );
};

export default ListOfProducts;

