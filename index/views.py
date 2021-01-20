from django.contrib import auth
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
import random
import string

from django.urls import reverse
from haystack.views import SearchView

from like.forms import LoginForm
from .models import Tourist
from django.contrib.auth import authenticate, login,logout



def index(request):
    host=request.get_host()
    return render(request, 'index.html', locals())

def show_sd(request):
    return render(request,'show_sd.html',locals())

def tourist_land(request):
    if not request.user.is_authenticated:
        ran_str = ''.join(random.sample(string.ascii_letters + string.digits, 8))
        visitor_name=ran_str
        visitor_password=ran_str
        visit_user=User.objects.create_user(username=visitor_name,password=visitor_password,is_active=1)
        tourist=Tourist()
        tourist.visitor_name=visitor_name
        tourist.visitor_password=visitor_password
        tourist.save()
        login(request,visit_user,backend='django.contrib.auth.backends.ModelBackend')
    tourists = Tourist.objects.values('visitor_name')
    tourists_init_list=list(tourists)
    tourists_list=[]
    for each_dict in tourists_init_list:
        tourists_list.append(each_dict['visitor_name'])
    return render(request,'usercenter.html',locals())

def tourist_logout(request):
    logout(request)
    return HttpResponseRedirect(reverse("index:index"))

def login_for_medal(request):
    login_form = LoginForm(request.POST)
    data = {}
    if login_form.is_valid():
        user = login_form.cleaned_data['user']
        auth.login(request, user)
        data['status'] = 'SUCCESS'
    else:
        data['status'] = 'ERROR'
    return JsonResponse(data)

