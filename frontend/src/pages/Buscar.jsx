import { useState } from 'react';
import axios from 'axios';
import { ToastContainer } from 'react-toastify'; 
import 'react-toastify/dist/ReactToastify.css';

import './Table.css'

function Buscar() {
  const urlImages = `${import.meta.env.VITE_API_URL}imagenes`;

  const [selectedDate, setSelectedDate] = useState('');
  const [images, setImages] = useState([]);

  const [selectedImage, setSelectedImage] = useState(null); // Estado para la imagen seleccionada para el modal

  const handleDateChange = (e) => {
    setSelectedDate(e.target.value); // Captura la fecha seleccionada
  };

  const handleFetchImages = async () => {
    if (!selectedDate) return;

    try {
      const response = await axios.get(urlImages, {
        params: {
          date: selectedDate, // Enviamos la fecha en formato YYYY-MM-DD
        },
      });
      setImages(response.data.images); // Recibimos las imágenes filtradas
    } catch (error) {
      console.error('Error al obtener las imágenes:', error);
    }
  };

  // Función para abrir la imagen en el modal
  const handleImageClick = (image) => {
    setSelectedImage(image); // Establece la imagen seleccionada para el modal
  };

  // Función para cerrar el modal
  const handleCloseModal = () => {
    setSelectedImage(null); // Cierra el modal
  };


  return (
    <div className="">
      <div>
        <h1>Buscar Imágenes por Fecha</h1>
        <div>
          <input
            type="date"
            value={selectedDate}
            onChange={handleDateChange}
            style={{ marginRight: "12px" }}
          />
          <button onClick={handleFetchImages}>Buscar Imágenes</button>
        </div>

        <div className="image-cards">
          {images.length > 0 ? (
            images.map((image) => (
              <div key={image.id} className="image-card">
                <img
                  src={image.url}
                  alt="Imagen"
                  className="image-card-img"
                  onClick={() => handleImageClick(image)} // Al hacer clic, abre la imagen en el modal
                />
                <div className="image-card-info">
                  <h3 style={{ fontWeight: 600, color: '#000' }}>{image.filename}</h3>
                  <p>{new Date(image.createdAt).toLocaleString('es-ES')}</p> {/* Mostrar la fecha en español */}
                </div>
              </div>
            ))
          ) : (
            <p>No hay imágenes para esta fecha.</p>
          )}
        </div>
      </div>

      {/* Modal para ver la imagen en tamaño grande */}
      {selectedImage && (
        <div className="modal" onClick={handleCloseModal}>
          <div className="modal-content">
            <img src={selectedImage.url} alt="Imagen grande" className="modal-img" />
            <button className="close-btn" onClick={handleCloseModal}>Cerrar</button>
          </div>
        </div>
      )}

      <ToastContainer />
    </div>
  );
}

export default Buscar;
