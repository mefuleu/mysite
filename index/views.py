from django.contrib.auth.models import User
from django.http import HttpResponseRedirect
from django.shortcuts import render
import random
import string

from django.urls import reverse

from .models import Tourist
from django.contrib.auth import authenticate, login,logout

def index(request):
    host=request.get_host()
    return render(request, 'index.html', locals())

def tourist_land(request):

    if request.user.is_authenticated:
        pass
    else:
        ran_str = ''.join(random.sample(string.ascii_letters + string.digits, 8))
        visitor_name=ran_str
        visitor_password=ran_str
        visit_user=User.objects.create_user(username=visitor_name,password=visitor_password,is_active=1)
        tourist=Tourist()
        tourist.visitor_name=visitor_name
        tourist.visitor_password=visitor_password
        tourist.save()
        login(request,visit_user,backend='django.contrib.auth.backends.ModelBackend')
    return render(request,'usercenter.html',locals())

def tourist_logout(request):
    logout(request)
    return HttpResponseRedirect(reverse("index:index"))
