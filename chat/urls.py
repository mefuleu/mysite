from django.urls import path

from . import views

urlpatterns = [
    path('', views.chat_index, name='chat_index'),
    path('<str:room_name>/', views.chat_room, name='room'),
]