from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.models import AbstractUser


class Usuario(AbstractUser):
    """ ROLES DE USUARIO """
    
    nombre = models.CharField(max_length=255, null=True, blank=True)
    apellido = models.CharField(max_length=255, null=True, blank=True)
     
    activo = models.BooleanField(default=True)
    reset_pass = models.BooleanField(default=True)
    
    
    creado = models.DateTimeField(auto_now_add=True)
    modificado = models.DateTimeField(auto_now=True)

