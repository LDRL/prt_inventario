import { useState, useEffect, useCallback, useRef } from 'react';
import { useSelector } from 'react-redux';
import { useFetchProducts } from './useProductOption';

export const useProducts = (initialPage = 1) => {
    const search = useSelector((state) => state.product.search)

    const [products, setProducts] = useState([]);
    const [totalProduct, setTotal] = useState(0);
    const [page, setPage] = useState(initialPage);

    const [paginationModel, setPaginationModel] = useState({
        page: initialPage - 1,
        pageSize: 10,
    });

    const { data, error, isLoading } = useFetchProducts(page,search);
   

    useEffect(() => {
        if(data){
            console.log(data.results, "---data hook")
            const adaptedProducts = data ? data.results : [];
            setProducts(adaptedProducts || []);
            setTotal(data?.total || 0);
        }
    }, [data]);

    const handlePaginationModelChange = (newPaginationModel) => {
        setPaginationModel(newPaginationModel);
        const newPage = newPaginationModel.page + 1;
        setPage(newPage);
    };

    return {
        products,
        totalProduct,
        isLoading,
        error,
        paginationModel,
        handlePaginationModelChange,
    };
};