from django.urls import path, include
from . import views
urlpatterns = [
    path('',views.showArticle,name='showArticle'),
    path('/article_id_<int:article_pk>',views.detailArticle,name='detailArticle'),
    path('/articletype/<typename>',views.typeArticle,name='typeArticle'),
]
