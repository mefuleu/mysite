from . import views
from django.urls import path, include, re_path

urlpatterns = [
    path('', views.show_news, name='news_home'),
    path('news_id_<int:new_pk>', views.detailNew, name='detailNews'),
]
