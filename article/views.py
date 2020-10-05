
from django.shortcuts import render, get_object_or_404
from .models import Articletype,Article
from django.conf import settings
from django.core.paginator import Paginator
# Create your views here.

def fen_ye_qi(request, articles_all_list):
    paginator = Paginator(articles_all_list, settings.EACH_PAGE_BLOGS_NUMBER)
    page_num = request.GET.get('page', 1)  # 获取url的页码参数（GET请求）
    page_of_articles = paginator.get_page(page_num)
    current_page_num = page_of_articles.number  # 获取当前页码
    # 获取当前页面前后各2页的页码范围
    page_range = list(range(max(current_page_num - 2, 1), current_page_num)) + \
                 list(range(current_page_num, min(current_page_num + 2, paginator.num_pages) + 1))
    # 加上省略页码标记
    if page_range[0] - 1 >= 2:
        page_range.insert(0, '...')
    if paginator.num_pages - page_range[-1] >= 2:
        page_range.append('...')
    # 加上首页和尾页
    if page_range[0] != 1:
        page_range.insert(0, 1)
    if page_range[-1] != paginator.num_pages:
        page_range.append(paginator.num_pages)

    context = {}
    context['page_of_articles'] = page_of_articles
    context['page_range'] = page_range
    context['types'] = Articletype.objects.all()
    return context


def showArticle(request):
    articles=Article.objects.all()
    context=fen_ye_qi(request, articles)
    context['articles']=Article.objects.all()
    return render(request, 'article_list.html', context=context)


def detailArticle(request, article_pk):
    article = get_object_or_404(Article, pk=article_pk)
    return render(request, 'article_detail.html', locals())

def typeArticle(requset,typename):
    articletype=get_object_or_404(Articletype,typename=typename)
    articles = Article.objects.filter(articletype=articletype)
    context=fen_ye_qi(requset, articles)
    context['articles']=Article.objects.filter(articletype=articletype)
    context['articletype']=get_object_or_404(Articletype,typename=typename)
    return render(requset,'article_type.html',context=context)