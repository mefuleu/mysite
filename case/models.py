from django.db import models
from django.utils import timezone
from ckeditor_uploader.fields import RichTextUploadingField
# Create your models here.

class Case(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255)
    create = models.DateTimeField(default=timezone.now)
    content = RichTextUploadingField()

    def __str__(self):
        return self.title
    class Meta:
        ordering=['create']
