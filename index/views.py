from django.shortcuts import render
from django.utils.translation import gettext
from django.utils.translation import gettext_lazy

def index(request):
    return render(request, 'index.html', locals())

def test(request):
    return render(request,'test.html',locals())

