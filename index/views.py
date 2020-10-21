from django.shortcuts import render
from django.utils.translation import gettext
from django.utils.translation import gettext_lazy

def index(request):
    if request.LANGUAGE_CODE == 'ja':
        language = gettext('Japanese')
    else:
        language = gettext('English')
        # language = gettext_lazy('English')
    return render(request, 'index.html', locals())

