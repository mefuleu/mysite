from django.shortcuts import render

# Create your views here.
def showArticle(request):
    return render(request,'article.html')