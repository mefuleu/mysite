from django.db import models
# from django.contrib.auth.models import User
from django.utils import timezone
from ckeditor_uploader.fields import RichTextUploadingField


# Create your models her
class ProductTypeFirst(models.Model):
    id = models.AutoField(primary_key=True)
    typename = models.CharField(max_length=100)

    def __str__(self):
        return self.typename


class ProductTypeSecond(models.Model):
    id = models.AutoField(primary_key=True)
    second_typename = models.CharField(max_length=100)
    typename_first = models.ForeignKey(ProductTypeFirst, on_delete=models.CASCADE, verbose_name='typename_first')

    def __str__(self):
        return self.second_typename


class Product(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255)
    product_specifications = models.CharField(max_length=400, blank=True)
    usage_area = models.CharField(max_length=400, blank=True)
    applicable_scene = models.CharField(max_length=400, blank=True)
    use_age = models.CharField(max_length=400, blank=True)
    ordering_hotline = models.CharField(max_length=400, blank=True)
    create = models.DateTimeField(default=timezone.now)
    content = RichTextUploadingField(config_name='comment_ckeditor')
    modelname=models.CharField(default='product',max_length=50)
    typename_second = models.ForeignKey(ProductTypeSecond, on_delete=models.CASCADE, verbose_name='typename_second')

    def __str__(self):
        return "{product_title: %s}" % self.title

    class Meta:
        ordering = ['create']
