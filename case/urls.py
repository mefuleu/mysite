from . import views
from django.urls import path, include, re_path

urlpatterns = [
    path('', views.show_case, name='case_home'),
    path('case_id_<int:case_pk>', views.detailCase, name='detailCase'),
]
