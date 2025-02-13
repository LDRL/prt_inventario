import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import axios from 'axios';

export const productUrl = 'http://localhost:8000/api/producto/';



// Hook para obtener la lista de productos
// import { useQuery } from 'react-query';
// import axios from 'axios';

export const useFetchProductList = (page, search) => {
    return useQuery({
        queryKey: ['product', page, search],
        queryFn: async () => {
            const params = { page };
            if (search) params.search = search;

            const config = { params };

            try {
                const response = await axios.get(productUrl, config);

                if (response.status !== 200) {
                    throw new Error(`Error fetching products: ${response.statusText}`);
                }

                // Retornamos tanto la lista de productos como el total
                return {
                    products: ProductListAdapter(response.data.data), // Adaptamos y devolvemos los productos
                    total: response.data.total, // Añadimos el total
                };
            } catch (error) {
                throw new Error(error instanceof Error ? error.message : "Unknown error");
            }
        },
    });
};



// Hook para obtener un producto específico
export const useFetchProduct = (productId) => {
    return useQuery({
        queryKey: ['product', productId], // Query key
        queryFn: async () => {
            const response = await axios.get(`${productUrl}${productId}/`);

            if (response.status !== 200) {
                throw new Error('Error al cargar el producto');
            }

            return response.results; // Adapt and return the product
        },
        enabled: !!productId, // Only runs if productId is available
        // onError: (error) => {
        //     console.error(`Error fetching product: ${error}`);
        // },
    });
};

// Hook para crear un nuevo producto
export const useCreateProduct = () => {
    const queryClient = useQueryClient();

    return useMutation({
        mutationFn: async (newProduct) => {
            const product = {
                nombre: newProduct.name,
                cantidad: newProduct.amount,
                precio: newProduct.price,
                categoria: {id: newProduct.idCategory},
                proveedor: {id: newProduct.idProveedor},
            };

            const response = await axios.post(productUrl, product);

            if (response.status !== 201) {
                throw new Error('Error al crear el producto');
            }

            return response;
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ['products'] });
        },
        onError: (error) => {
            console.error(`Error creating product: ${error}`);
        },
    });
};




export const useUpdateProduct = () => {
    const queryClient = useQueryClient();

    return useMutation({
        mutationFn: async (updatedProduct) => {
            const product = {
                nombre: updatedProduct.name,
                idcategoria: updatedProduct.idCategory,
                idmarca: updatedProduct.idBrand,
                idpresentacion: updatedProduct.idPresentation,
                descripcion: updatedProduct.description,
            };

            const response = await axios.put(`${productUrl}${updatedProduct.productCode}/`, product);

            if (response.status !== 200) {
                throw new Error('Error al actualizar el producto');
            }

            return response; // Adaptamos y devolvemos el producto actualizado
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ['products'] });
        },
        onError: (error) => {
            console.error(`Error updating product: ${error}`);
        },
    });
};


export const useFetchProducts = (page =1, search) => {
    return useQuery({
        queryKey: ['products', page, search],
        queryFn: async () => {
            const response = await axios.get(`${productUrl}?page=${page}&search=${search}`);
            return response.data;
            
        },
     });
};