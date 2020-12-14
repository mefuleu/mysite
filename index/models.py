from django.db import models
# from django.contrib.auth.models import User
from django.utils import timezone
from ckeditor_uploader.fields import RichTextUploadingField




class Tourist(models.Model):
    id = models.AutoField(primary_key=True)
    visitor_name = models.CharField(max_length=255)
    visitor_password = models.CharField(max_length=400,blank=True)
    def __str__(self):
        return self.visitor_name
    # class Meta:
    #     ordering=['']

