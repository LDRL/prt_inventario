import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'prtinventario',
        'USER': 'root',
        'PASSWORD': "",
        'ATOMIC_REQUESTS': True,
        'HOST': '127.0.0.1',
        'PORT': '3306',
    },
}


STATIC_ROOT = os.path.join(BASE_DIR, '../static')
MEDIA_ROOT = os.path.join(BASE_DIR, '../media')


DEBUG = True

DOMINIO = 'http://0.0.0.0:8080'



