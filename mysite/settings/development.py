
from .base import *
import os
from pathlib import Path





SECRET_KEY = 'yp1ptnnq992n%e4=&4(1*-!kc7&h&2mm-gi5=xx9ctye!o+kun'
# SECURITY WARNING: keep the secret key used in production secret!
DEBUG = True
# SECURITY WARNING: don't run with debug turned on in production!

ALLOWED_HOSTS = ['*']


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'myweb',
        'USER': 'root',
        'PASSWORD': '123456',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}

