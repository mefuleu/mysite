from django.apps import AppConfig


class LikeConfig(AppConfig):
    name = 'like'

    def ready(self):
        super(LikeConfig, self).ready()
        from . import singals