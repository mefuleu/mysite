
from django.contrib import admin
from .models import Case




@admin.register(Case)
class CaseAdmin(admin.ModelAdmin):
    list_display = ['title', 'content']
    search_fields = ['title','content']
    ordering = ['id']
    list_per_page = 12