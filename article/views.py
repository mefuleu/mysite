
from django.shortcuts import render, get_object_or_404
from .models import Articletype,Article
from django.core.paginator import Paginator
# Create your views here.

def showArticle(request):
    articles=Article.objects.all()
    paginator = Paginator(articles, 10)  # 每10个进行分页
    page_num = request.GET.get('page', 1)  # 获取url的页码参数（GET请求）
    page_of_articles = paginator.get_page(page_num)
    types=Articletype.objects.all()
    return render(request, 'article_list.html', locals())


def detailArticle(request, article_pk):
    article = get_object_or_404(Article, pk=article_pk)
    return render(request, 'article_detail.html', locals())

def typeArticle(requset,typename):
    articletype=get_object_or_404(Articletype,typename=typename)
    articles = Article.objects.filter(articletype=articletype)
    types = Articletype.objects.all()
    paginator = Paginator(articles, 10)  # 每10个进行分页
    page_num = requset.GET.get('page', 1)  # 获取url的页码参数（GET请求）
    page_of_articles = paginator.get_page(page_num)
    return render(requset,'article_type.html',locals())