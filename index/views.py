from django.shortcuts import render
from django.utils.translation import gettext
from django.utils.translation import gettext_lazy


def index(request):
    languagedict = {'en': 'English', 'zh_hans': '中文', 'ja': '日本の', 'ko': '한국어'}
    return render(request, 'index.html', locals())

def test(request):
    return render(request,'test.html',locals())

