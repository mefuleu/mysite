from django.shortcuts import render

# Create your views here.
def showMusic(request):
    return render(request, 'music.html')