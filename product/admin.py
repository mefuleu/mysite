from django.contrib import admin
from .models import ProductTypeFirst, Product, ProductTypeSecond


# Register your models here.
@admin.register(ProductTypeFirst)
class ProductTypeFirstAdmin(admin.ModelAdmin):
    list_display = ['id', 'typename']
    ordering = ['id']
    list_per_page = 12

@admin.register(ProductTypeSecond)
class ProductTypeSecondAdmin(admin.ModelAdmin):
    list_display = ['id', 'second_typename', 'typename_first']
    list_filter = ['typename_first__typename']
    ordering = ['id']
    list_per_page = 12

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ['title', 'product_specifications', 'usage_area', 'applicable_scene', 'use_age', 'ordering_hotline',
                    'create', 'content', 'typename_second']
    list_filter = ['typename_second__second_typename']
    search_fields = ['title','product_specifications']
    ordering = ['id']
    list_per_page = 12