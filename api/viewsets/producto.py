import json
import datetime
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status, filters, viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.settings import api_settings
from api.serializers import (ProductoSerializer, ProductoReadSerializer)
from api.models import Producto, Categoria, Proveedor

from django.db import transaction
from rest_framework.decorators import action
from django.conf import settings



class ProductoViewset(viewsets.ModelViewSet):
    queryset = Producto.objects.filter(activo=True)
    serializer_class = ProductoSerializer
    # permission_classes = [IsAuthenticated]

    filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter)
    filter_fields = ("id", "id")
    search_fields = ("id", "id")
    ordering_fields = ("nombre", "id")

    def get_queryset(self):
        Productos = Producto.objects.filter(activo=True)

        self.filter_queryset(Productos)

        return Productos
    
    def get_serializer_class(self):
        """Define serializer for API"""

        if self.action == 'list' or self.action == 'retrieve':
            return ProductoReadSerializer
        else:
            return ProductoSerializer
        
    def retrieve(self, request, pk=None):
        queryset = Producto.objects.get(id=pk)
        serializer = ProductoReadSerializer(queryset)
        return Response(serializer.data, status=status.HTTP_200_OK)
    

    def create(self, request, *args, **kwargs):
        data = request.data
        print(data)
        categoria = data.get('categoria', None)
        proveedor = data.get('proveedor', None)

        try:
            with transaction.atomic():
                
                producto = Producto.objects.create(
                    categoria_id = categoria["id"],
                    proveedor_id = proveedor["id"],
                    nombre = data["nombre"],
                    cantidad = data["cantidad"],
                    precio = data["precio"],
                )
                
                # producto.save(detail=producto)
                
                serializer = ProductoSerializer(producto)

            return Response(serializer.data, status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response({'detail':str(e)}, status=status.HTTP_400_BAD_REQUEST)

    def get_success_headers(self, data):
        try:
            return {'Location': str(data[api_settings.URL_FIELD_NAME])}
        except (TypeError, KeyError):
            return {}

    def update(self, request, *args, **kwargs):
        data = request.data
        # print(data["id"])
        categoria = data.get('categoria', None)
        proveedor = data.get('proveedor', None)

        try:      
            with transaction.atomic():

                _producto = Producto.objects.get(pk=data["id"])
                _producto.categoria_id = categoria["id"]
                _producto.proveedor_id = proveedor["id"]
                _producto.nombre = data["nombre"]
                _producto.cantidad = data["cantidad"]
                _producto.precio = data["precio"]

                _producto.save()
                
                serializer = ProductoSerializer(_producto)

                return Response(serializer.data, status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response({'detail':str(e)}, status=status.HTTP_400_BAD_REQUEST)

    def destroy(self, request, *args, **kwargs):
        Producto = self.get_object()

        Producto.activo = False
        self.perform_destroy(Producto)
        return Response(status=status.HTTP_200_OK)
    
    
