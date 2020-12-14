from django.shortcuts import render

# Create your views here.
def userCenter(request):
    return render(request,'usercenter.html',locals())