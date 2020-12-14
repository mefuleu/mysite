from . import views
from django.urls import path, include, re_path

urlpatterns = [
    path('', views.index, name='index'),
    path('tourist_login/',views.tourist_land,name='tourist_landing'),
    path('tourist_logout/',views.tourist_logout,name='tourist_logout')
]
