from . import views
from django.urls import path, include, re_path

urlpatterns = [
    path('', views.show_product, name='product_home'),
    path('product_id_<int:product_pk>',views.detailProduct,name='detailProduct'),
    path('product_type/<first_typename>/<second_typename>',views.typeProduct,name='typeProduct'),
]
