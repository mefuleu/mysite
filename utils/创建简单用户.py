
import os
import sys

if __name__ == '__main__':
    sys.path.append('/home/mysite')
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mysite.settings.development')  # manage.py文件中有同样的环境配置
    import django
    django.setup()  # 启动django项目

    from django.contrib.auth.models import User
    User.objects.create_user(username='1',password='1',is_active=1)


