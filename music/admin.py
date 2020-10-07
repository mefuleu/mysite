from django.contrib import admin
from .models import Label, Song


# Register your models here.
@admin.register(Label)
class LabelAdmin(admin.ModelAdmin):
    # 设置模型字段，用于Admin后台数据的列名设置
    list_display = ['id', 'name']
    # 设置可搜索的字段并在Admin后台数据生成搜索框
    # 如有外键应使用双下划线连接两个模型的字段
    # search_fields = ['name']
    # 设置排序方式
    ordering = ['id']


@admin.register(Song)
class SongAdmin(admin.ModelAdmin):
    # 设置模型字段，用于Admin后台数据的列名设置
    list_display = ['id', 'name', 'singer', 'album', 'languages', 'release', 'img', 'lyrics', 'file']
    # 设置可搜索的字段并在Admin后台数据生成搜索框
    # 如有外键应使用双下划线连接两个模型的字段
    search_fields = ['name', 'singer', 'album', 'languages']
    # 设置过滤器，在后台数据的右侧生成导航栏
    # 如有外键应使用双下划线连接两个模型的字段
    list_filter = ['singer', 'album', 'languages']
    # 设置排序方式
    ordering = ['id']
