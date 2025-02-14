import { createSlice } from '@reduxjs/toolkit';

const initialState ={
  currentProduct : null,
  search:""
}

const productSlice = createSlice({
  name: 'product',
  initialState: initialState,
  reducers: {
    openModal: (state, action) => {
      state.currentProduct = action.payload;
    },
    closeModal: (state) => {
      state.currentProduct = null;
    },
    setSearch: (state, action) => {
      state.search = action.payload;
    },
  },
});

export const { openModal, closeModal,setSearch } = productSlice.actions;

export default productSlice.reducer;

