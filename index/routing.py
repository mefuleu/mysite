from django.urls import re_path,path

from chat import consumers
from chat.consumers import ChatConsumer as testconsumer

websocket_urlpatterns = [
    # re_path(r'ws/chat/(?P<room_name>\w+)/$', consumers.ChatConsumer.as_asgi()),
     re_path(r'', consumers.ChatConsumer.as_asgi()),
]