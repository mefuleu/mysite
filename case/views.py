from django.shortcuts import render

# Create your views here.
from django.shortcuts import render,get_object_or_404
from .models import Case
from django.conf import settings
from django.core.paginator import Paginator


def fen_ye_qi(request, cases_all_list):
    paginator = Paginator(cases_all_list, settings.EACH_PAGE_PRODUCTS_NUMBER)
    page_num = request.GET.get('page', 1)  # 获取url的页码参数（GET请求）
    page_of_cases = paginator.get_page(page_num)
    current_page_num = page_of_cases.number  # 获取当前页码
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
    context['page_of_cases'] = page_of_cases
    context['page_range'] = page_range
    return context

def show_case(request):
    cases=Case.objects.all()
    context=fen_ye_qi(request, cases.order_by('create'))
    context['cases']=Case.objects.all()
    return render(request,'show_case.html',context=context)


def detailCase(request, case_pk):
    case = get_object_or_404(Case, pk=case_pk)
    return render(request, 'case_detail.html', locals())
