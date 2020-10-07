from django.urls import path, include
from . import views
urlpatterns = [
    path('',views.showMusic,name='showMusic'),
    path('songname/<songname>',views.detailMusic,name='detailMusic'),
    path('musictype/<typename>',views.typeMusic,name='typeMusic'),
]
