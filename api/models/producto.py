from django.db import models
from .categoria import Categoria
from .proveedor import Proveedor


class Producto(models.Model):
    """ Este modelo guarda los productos del inventario. """

    categoria = models.ForeignKey(Categoria,
                                related_name="producto_categoria",
                                on_delete=models.CASCADE)
    
    proveedor = models.ForeignKey(Proveedor,
                                related_name="producto_proveedor",
                                on_delete=models.CASCADE,
                                null=True)
    
    nombre = models.TextField(null=True, blank=True) 
    cantidad = models.IntegerField(null=True, blank=True)
    precio = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    activo = models.BooleanField(default=True)

    creado = models.DateTimeField(auto_now_add=True)
    modificado = models.DateTimeField(auto_now=True)