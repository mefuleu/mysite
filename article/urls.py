from django.urls import path, include
from . import views
urlpatterns = [
    path('',views.showArticle,name='showArticle'),
]
