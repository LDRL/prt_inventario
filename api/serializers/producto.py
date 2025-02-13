from rest_framework import serializers
from api.models import Producto


class ProductoSerializer(serializers.ModelSerializer):

    class Meta:
        model = Producto
        depth = 2
        fields = '__all__'


class ProductoReadSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Producto
        depth = 2
        fields = '__all__'
