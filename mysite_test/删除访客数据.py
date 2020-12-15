
import os
import sys

if __name__ == '__main__':
    sys.path.append('/home/mysite')
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mysite.settings.development')  # manage.py文件中有同样的环境配置
    import django
    django.setup()  # 启动django项目

    from django.contrib.auth.models import User
    from index.models import Tourist
    tourists=Tourist.objects.values('visitor_name')
    users=User.objects.values('username')
    tourists_init_list=list(tourists)
    tourists_list=[]
    users_init_list=list(users)
    users_list=[]
    for each_dict in tourists_init_list:
        tourists_list.append(each_dict['visitor_name'])

    for each_dict in users_init_list:
        users_list.append(each_dict['username'])
    del_set=set(tourists_list)&set(users_list)
    for each_name in del_set:
        User.objects.filter(username=each_name).delete()
    print('over')



