from django.urls import path, include
from . import views
urlpatterns = [
    path('',views.showArticle,name='showArticle'),
    path('<int:article_pk>',views.detailArticle,name='detailArticle'),
    path('articletype/<typename>',views.typeArticle,name='typeArticle'),
]
