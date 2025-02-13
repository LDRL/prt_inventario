from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework.authtoken.views import obtain_auth_token
from django.conf.urls import url
from api import viewsets


router = DefaultRouter()
router.register(r'categoria', viewsets.CategoriaViewset)
router.register(r'proveedor', viewsets.ProveedorViewset)
router.register(r'producto', viewsets.ProductoViewset)



urlpatterns = [
    path('api/', include(router.urls)),
]
