from django.apps import AppConfig


class CommentConfig(AppConfig):
    name = 'comments'

    def ready(self):
        super(CommentConfig, self).ready()
        from . import singals