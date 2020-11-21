
from .base import *
import os
from pathlib import Path





SECRET_KEY = os.environ['SECRET_KEY']
# SECURITY WARNING: keep the secret key used in production secret!
DEBUG = True
# SECURITY WARNING: don't run with debug turned on in production!

ALLOWED_HOSTS = ['*']
DATABASE_PASSWORD =os.environ['DATABASE_PASSWORD']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'myweb',
        'USER': 'root',
        'PASSWORD': DATABASE_PASSWORD,
        'HOST': '47.111.69.141',
        'PORT': '3306',
    }
}

