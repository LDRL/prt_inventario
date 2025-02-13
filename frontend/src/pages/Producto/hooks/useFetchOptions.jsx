import {useQuery} from '@tanstack/react-query'


const apiUrl = "http://localhost:8000/api/";



export const useFetchOptions = () => {
    return useQuery({
        queryKey: ['dropdownOptions'], 
        queryFn: async() => { 
            const response = await fetch(apiUrl+"categoria/");
            console.log(response, "--- fetch options")
            if(!response.ok){
                throw new Error('Errr al cargar las opciones')
            }

            const data = await response.json();
            console.log(data.results, "----")
            return categoriasAdapter(data.results);
        },
        onError: (error) => {
            console.error('Error fetching proveedor options:', error.message);
        },
    });
};

const categoriasAdapter = (categorias) => {
    return categorias.map(categoria => ({
        value: categoria.id,
        label: categoria.nombre,
    }));
};



export const useFetchProveedorOptions = () => {
    return useQuery({
        queryKey: ['dropdownProveedores'], // Se maneja como un objeto dentro de useQueryOptions para el uso de TypeScript 
        queryFn: async() => { // queryFn especifica la funcion para el consumo de la api
            const response = await fetch(apiUrl+"proveedor/");

            if(!response.ok){
                throw new Error('Errr al cargar las opciones')
            }

            const data = await response.json();
            return ProveedoresAdapter(data.results);
        },
        onError: (error) => {
            console.error('Error fetching proveedor options:', error.message);
        },
    });
};

const ProveedoresAdapter = (categorias) => {
    return categorias.map(categoria => ({
        value: categoria.id,
        label: categoria.nombre,
    }));
};