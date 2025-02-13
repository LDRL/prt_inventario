import json
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status, filters, viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.settings import api_settings
from api.serializers import ProveedorSerializer
from api.models import Proveedor

from django.db.models import Q


class ProveedorViewset(viewsets.ModelViewSet):
    queryset = Proveedor.objects.filter(activo=True)
    serializer_class = ProveedorSerializer
    # permission_classes = [IsAuthenticated]

    filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter)
    filter_fields = ("nombre", "id")
    search_fields = ("nombre", "id")
    ordering_fields = ("nombre", "id")

    def get_queryset(self):
        proveedores = Proveedor.objects.filter(activo=True)
        self.filter_queryset(proveedores)
        return proveedores


    def create(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    
        except Exception as e:
            return Response({'detail':str(e)}, status=status.HTTP_400_BAD_REQUEST)

    def get_success_headers(self, data):
        try:
            return {'Location': str(data[api_settings.URL_FIELD_NAME])}
        except (TypeError, KeyError):
            return {}

    def update(self, request, *args, **kwargs):
        data = request.data
        
        try:
            proveedor = self.get_object()

            serializer = ProveedorSerializer(proveedor, data=data, partial=True)
            serializer.is_valid(raise_exception=True)
            self.perform_update(serializer)
            return Response(serializer.data)
        
        except Exception as e:
            return Response({'detail':str(e)}, status=status.HTTP_400_BAD_REQUEST)

    def destroy(self, request, *args, **kwargs):
        proveedor = self.get_object()
        proveedor.activo = False
        self.perform_destroy(proveedor)
        return Response(status=status.HTTP_200_OK)

