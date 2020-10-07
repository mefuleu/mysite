from django.shortcuts import render, get_object_or_404
from .models import Label,Song
from django.conf import settings
from django.core.paginator import Paginator
# Create your views here.
def fen_ye_qi(request, music_all_list):
    paginator = Paginator(music_all_list, settings.EACH_PAGE_BLOGS_NUMBER)
    page_num = request.GET.get('page', 1)  # 获取url的页码参数（GET请求）
    page_of_music = paginator.get_page(page_num)
    current_page_num = page_of_music.number  # 获取当前页码
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
    context['page_of_music'] = page_of_music
    context['page_range'] = page_range
    context['types'] = Label.objects.all()
    return context


def showMusic(request):
    music=Song.objects.all()
    context=fen_ye_qi(request, music)
    context['music']=Song.objects.all()
    return render(request, 'music_list.html', context=context)

def detailMusic(request, songname):
    currentSong = get_object_or_404(Song, name=songname)
    return render(request, 'music_detail.html', locals())

def typeMusic(requset,typename):
    musictype=get_object_or_404(Label,name=typename)
    music = Song.objects.filter(label_id=musictype.id)
    context=fen_ye_qi(requset, music)
    context['music']=Song.objects.filter(label_id=musictype.id)
    context['musictype']=get_object_or_404(Label,name=typename)
    return render(requset,'music_type.html',context=context)