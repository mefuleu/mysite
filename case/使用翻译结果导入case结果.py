
# !/usr/bin/env python3
import os
# product_list = []
#
# with open('C:/Users/jackeyhate/Desktop/sd_status/muzhihuati.json', 'r') as f_obj:
#     jlist = json.load(f_obj)
#     product_list = jlist
# if __name__ == '__main__':
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mysite.settings.development')  # manage.py文件中有同样的环境配置

import django

django.setup()  # 启动django项目

from case.models import Case
import json
all_list=[]
with open('C:/Users/jackeyhate/Desktop/sd_status/典型案例标题.json', 'r') as f_obj:
    jlist = json.load(f_obj)
    all_list = jlist



for each_product in all_list:
    Case.objects.create(title=each_product)

