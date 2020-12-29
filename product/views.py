from django.contrib.contenttypes.models import ContentType
from django.shortcuts import render,get_object_or_404

from comments.forms import CommentForm
from comments.models import Comment
from .models import Product,ProductTypeSecond,ProductTypeFirst
from django.conf import settings
from django.core.paginator import Paginator


def fen_ye_qi(request, products_all_list):
    paginator = Paginator(products_all_list, settings.EACH_PAGE_PRODUCTS_NUMBER)
    page_num = request.GET.get('page', 1)  # 获取url的页码参数（GET请求）
    page_of_products = paginator.get_page(page_num)
    current_page_num = page_of_products.number  # 获取当前页码
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
    context['page_of_products'] = page_of_products
    context['page_range'] = page_range
    return context

def show_product(request):
    products=Product.objects.all()
    context=fen_ye_qi(request, products.order_by('create'))
    context['products']=Product.objects.all()
    context['first_types'] = ProductTypeFirst.objects.all()
    context['host']=request.get_host()
    return render(request,'show_product.html',context=context)




def detailProduct(request, product_pk):
    context = {}
    product = get_object_or_404(Product, pk=product_pk)
    # read_cookie_key = read_statistic_one_read(request, product)
    product_content_type = ContentType.objects.get_for_model(product)
    comments = Comment.objects.filter(content_type=product_content_type, object_id=product.pk, parent=None)
    context['previous_product'] = Product.objects.filter(create__lt=product.create).last()
    context['next_product'] = Product.objects.filter(create__gt=product.create).first()
    context['product'] = product
    context['comments'] = comments.order_by('-comment_time')
    context['comment_form'] = CommentForm(
        initial={'content_type': product_content_type.model, 'object_id': product_pk, 'reply_comment_id': 0})
    context['host']=request.get_host()
    # response.set_cookie(read_cookie_key, 'true')  # 关闭浏览器，cookie才无效
    return render(request, 'product_detail.html', context)




def typeProduct(request,first_typename,second_typename):
    if second_typename==' ':
        type_first=get_object_or_404(ProductTypeFirst,typename=first_typename)
        types_second = type_first.producttypesecond_set.all()
        products=types_second[0].product_set.all()#建立初始queryset集合
        for type_second in types_second[1:]:
            temp=type_second.product_set.all()
            products=products.union(temp)
        context=fen_ye_qi(request, products.order_by('create'))
        context['products']=products
        # context['first_types'] = ProductTypeFirst.objects.all()
    else:
        type_second = ProductTypeSecond.objects.filter(second_typename=second_typename)
        products = Product.objects.filter(typename_second_id=type_second[0].id)
        context=fen_ye_qi(request, products.order_by('create'))
        context['products']=products
        # context['producttype']=get_object_or_404(ProductTypeFirst,typename=first_typename)
    context['first_types'] = ProductTypeFirst.objects.all()
    context['host'] = request.get_host()
    return render(request,'product_type.html',context=context)