from django.contrib import admin

# Register your models here.
from .models import Articletype, Article

@admin.register(Articletype)
class ArticletypeAdmin(admin.ModelAdmin):
    list_display = ('id', 'typename')

@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title', 'articletype', 'author', 'create', 'update')