# prt_inventario

# Backend
## Instalar python 3.10
## Descargar de la pagina oficial de python
### https://www.python.org/downloads/release/python-3100rc1/

### Abrir la terminal o consola en windows para verificar la version de python con la siguiente instruccion python --version
### Crear un entrono virtual para poder instalar dependencias de python 3.10 con el siguiente comando python -m venv env
### Activar el entorno virutal con .\env\Scripts\Activate
### Instalar dependencias con pip install -r requirements.txt
### Configurar el archivo local_settings.py que se encuentra en la carpeta app, si en dado caso no se encuentra se debe crear uno y configurar para poder conectarse a la base de datos en MySql.

### Cuando tenga configurado la conexion a la base de datos puede crear las migraciones necesarias para que se creen las tablas en la Base de datos con la siguiente instruccion  python manage.py migrate

### Se proporciona la base de datos que se utilizo para generar pruebas para el CRUD, esta se encuentra en la raiz del proyecto con el nombre Dump20252134.sql

### Para poder iniciar el servidor se debe ejecutar el siguiente comando pyhton manage.py runserver
### Podra consultar el link http://127.0.0.1:8000/api/ en un navegador donde se podra ver las rutas para la generacion de los CRUD de proveedor, categoria y producto


## Listar categorias
![Descripción de la imagen](/img/categoria_get.png)

## Insertar categoria
![Descripción de la imagen](/img/categoria_post.png)

## Actualizar categoria
![Descripción de la imagen](/img/categoria_put.png)


## Listar proveedors
![Descripción de la imagen](/img/proveedor_get.png)


## Listar productos
![Descripción de la imagen](/img/producto_get.png)

## Insertar producto
![Descripción de la imagen](/img/producto_post.png)

## Actualizar producto
![Descripción de la imagen](/img/update_producto.png)

# Frontend
## Descargar node en el sitio web https://nodejs.org/es

### Instarlar node en la maquina y con node --version verificar que la instalacion fue correcta
### Ingresar a la carpeta frontend desde la terminal o una consola con el comando cd frontend
### cuando se encuentre ubicado en la carpeta frontend ejecutar los siguientes comandos
### npm i
### npm run dev

## Para poder ver la pagina donde se ejecuta el cliente puede ingresar al siguiente link cuando ya este ejecutando npm run dev http://localhost:5173/private

