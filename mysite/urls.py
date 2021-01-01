"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include, re_path
from django.conf.urls.i18n import i18n_patterns
from django.views.i18n import JavaScriptCatalog
from django.views.static import serve

urlpatterns = [
    path('admin/', admin.site.urls),
    path('ckeditor/',include('ckeditor_uploader.urls')),
    path('accounts/', include('allauth.urls')),
    path('chat/', include(('chat.urls','chat'),namespace='chat')),
    path('comment/', include('comments.urls')),
    path('search/', include('haystack.urls')),
    re_path('media/(?P<path>.*)', serve, {'document_root': settings.MEDIA_ROOT}, name='media'),
    re_path('static/(?P<path>.*)', serve, {'document_root': settings.STATIC_ROOT}, name='static'),
]

urlpatterns+=i18n_patterns(
    path('i18n/', include('django.conf.urls.i18n')),
    path('', include(('index.urls', 'index'), namespace='index')),
    path('product/', include(('product.urls', 'product'), namespace='product')),
    path('case/', include(('case.urls', 'case'), namespace='case')),
    # path('usercenter/', include(('usercenter.urls', 'usercenter'), namespace='usercenter')),
    path('news/', include(('news.urls', 'news'), namespace='news')),
    prefix_default_language=False,
)






