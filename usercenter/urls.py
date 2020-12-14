from . import views
from django.urls import path, include, re_path
from . import views
urlpatterns = [
    path('',views.userCenter, name='detail_usercenter'),
    # path('case_id_<int:case_pk>', views.detailCase, name='detailCase'),
]
