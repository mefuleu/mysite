from django.shortcuts import render
from django.utils.translation import gettext
from django.utils.translation import gettext_lazy


def index(request):
    host=request.get_host()
    return render(request, 'index.html', locals())

