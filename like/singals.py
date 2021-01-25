from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.html import strip_tags
from notifications.signals import notify
from .models import LikeRecord


@receiver(post_save, sender=LikeRecord)
def send_notification(sender, instance, **kwargs):
    if instance.content_type.model == 'product':
        product = instance.content_object
        verb = '{0} give the thumbs-up《{1}》'.format(instance.user.username, product.title)
    elif instance.content_type.model == 'comment':
        comment = instance.content_object
        verb = '{0} give the thumbs-up your comment“{1}”'.format(
                instance.user.username,
                strip_tags(comment.text)
            )

    recipient = instance.content_object.get_user()
    url = instance.content_object.get_url()
    notify.send(instance.user, recipient=recipient, verb=verb, action_object=instance, url=url)


from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import User
from django.urls import reverse
from notifications.signals import notify


@receiver(post_save, sender=User)
def send_notification(sender, instance, **kwargs):
    if kwargs['created'] == True:
        verb = 'Successful registration, more wonderful content waiting for you to find'
        url = reverse('index:usercenter')
        notify.send(instance, recipient=instance, verb=verb, action_object=instance, url=url)

