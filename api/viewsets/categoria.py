import json
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status, filters, viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.settings import api_settings
from api.serializers import CategoriaSerializer
from api.models import Categoria


from django.db.models import Q


class CategoriaViewset(viewsets.ModelViewSet):
    queryset = Categoria.objects.filter(activo=True)
    serializer_class = CategoriaSerializer
    # permission_classes = [IsAuthenticated]

    filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter)
    filter_fields = ("nombre", "id")
    search_fields = ("nombre", "id")
    ordering_fields = ("nombre", "id")

    def get_queryset(self):
        categorias = Categoria.objects.filter(activo=True)
        self.filter_queryset(categorias)
        return categorias
        
    def create(self, request, *args, **kwargs):
        try:
            #COMPROBAR QUE NO EXISTA UNA CATEGORIA CON ESTE NOMBRE
            categorias = Categoria \
                .objects \
                .filter(
                    nombre__iexact=request.data["nombre"],
                ).exclude(activo = False)
            if categorias.count() > 0:
                raise Exception("Ya existe una categoria con este nombre")
        
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
        print(data)
        
        try:
            categoria = self.get_object()

            #COMPROBAR QUE NO EXISTA UNA CATEGORIA CON ESTE NOMBRE
            categorias = Categoria \
                .objects \
                .filter(
                    nombre__iexact=request.data["nombre"],
                ).exclude(Q(pk=categoria.id) | Q(activo=False))

            if categorias.count() > 0:
                raise Exception("Ya existe una categoria con este nombre")

            serializer = CategoriaSerializer(categoria, data=data, partial=True)
            serializer.is_valid(raise_exception=True)
            self.perform_update(serializer)
            return Response(serializer.data)
        
        except Exception as e:
            return Response({'detail':str(e)}, status=status.HTTP_400_BAD_REQUEST)

    def destroy(self, request, *args, **kwargs):
        categoria = self.get_object()
        categoria.activo = False
        self.perform_destroy(categoria)
        return Response(status=status.HTTP_200_OK)

