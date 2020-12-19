from django.shortcuts import render

# Create your views here.
from django.shortcuts import render,get_object_or_404
from .models import New
from django.conf import settings
from django.core.paginator import Paginator


def fen_ye_qi(request, news_all_list):
    paginator = Paginator(news_all_list, settings.EACH_PAGE_PRODUCTS_NUMBER)
    page_num = request.GET.get('page', 1)  # 获取url的页码参数（GET请求）
    page_of_news = paginator.get_page(page_num)
    current_page_num = page_of_news.number  # 获取当前页码
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
    context['page_of_news'] = page_of_news
    context['page_range'] = page_range
    return context

def show_news(request):
    news=New.objects.all()
    context=fen_ye_qi(request, news.order_by('create'))
    context['news']=New.objects.all()
    context['host'] = request.get_host()
    return render(request,'show_new.html',context=context)


def detailNew(request, new_pk):
    new = get_object_or_404(New, pk=new_pk)
    return render(request, 'new_detail.html', locals())
