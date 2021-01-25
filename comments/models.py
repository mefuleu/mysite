from django.contrib.auth.models import User
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from django.db import models


# Create your models here.
class Comment(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')
    text = models.TextField()
    comment_time = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(User, related_name="comments", on_delete=models.CASCADE)
    root = models.ForeignKey('self', related_name='root_comment', null=True, blank=True, on_delete=models.CASCADE)

    parent = models.ForeignKey('self', related_name='parent_comment', blank=True, null=True,
                               on_delete=models.DO_NOTHING)
    reply_to = models.ForeignKey(User, related_name="replies", blank=True, null=True, on_delete=models.CASCADE)

    def __str__(self):
        return self.text

    def get_url(self):
        return self.content_object.get_url()

    def get_user(self):
        return self.user

    class Meta:
        ordering = ['comment_time']