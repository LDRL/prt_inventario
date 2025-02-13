from __future__ import unicode_literals
from django.db import models

class Proveedor(models.Model):
    nombre = models.CharField(max_length=40, null=True, blank=True)
    apellido = models.CharField(max_length=40, null=True, blank=True)
    direccion = models.CharField(max_length=255, null=True, blank=True)
    activo = models.BooleanField(default=True)

    creado = models.DateTimeField(auto_now_add=True)
    modificado = models.DateTimeField(auto_now=True)
