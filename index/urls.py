from . import views
from django.urls import path, include, re_path
from django.conf.urls.i18n import i18n_patterns

urlpatterns = [
    path('', views.index, name='index'),
    path('test/', views.test, name='test'),
]
