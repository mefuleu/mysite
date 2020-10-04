from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone


class Articletype(models.Model):
    id = models.AutoField(primary_key=True)
    typename = models.CharField('类型名称',max_length=15)

    def __str__(self):
        return self.typename
    class Meta:
        verbose_name='文章分类'
        verbose_name_plural='文章分类'

class Article(models.Model):
    title = models.CharField('标题',max_length=50)
    content = models.TextField('内容')
    author = models.ForeignKey(User, on_delete=models.CASCADE,verbose_name='作者')
    create = models.DateTimeField('创建时间',default=timezone.now)
    update = models.DateTimeField('更新时间',auto_now=True)
    articletype = models.ForeignKey(Articletype, on_delete=models.CASCADE,verbose_name='文章类型')

    def __str__(self):
        return "{文章标题: %s}" % self.title
    class Meta:
        ordering=['-create']
        verbose_name='文章编辑'
        verbose_name_plural='文章编辑'