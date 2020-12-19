from django.contrib import admin
from .models import New




@admin.register(New)
class NewAdmin(admin.ModelAdmin):
    list_display = ['title', 'content']
    search_fields = ['title','content']
    ordering = ['id']
    list_per_page = 12