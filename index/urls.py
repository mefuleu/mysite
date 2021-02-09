from rest_framework.routers import DefaultRouter

from chat.api import MessageModelViewSet, UserModelViewSet
from . import views
from django.urls import path, include, re_path


router = DefaultRouter()
router.register(r'message', MessageModelViewSet, basename='message-api')
router.register(r'user', UserModelViewSet, basename='user-api')
urlpatterns = [
    path('', views.index, name='index'),
    path('show_sd', views.show_sd, name='show_sd'),
    path('usercenter/',views.tourist_land,name='usercenter'),
    path('api/v1/', include(router.urls)),
]
