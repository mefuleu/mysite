
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

from product.models import Product
import json
all_list=[]
with open('C:/Users/jackeyhate/Desktop/sd_status/product.json', 'r') as f_obj:
    jlist = json.load(f_obj)
    all_list = jlist
print(len(all_list))


# for each_product in all_list:
#     Product.objects.create(title=each_product['title'], product_specifications=each_product['product_specifications'],
#                            usage_area=each_product['usage_area'], applicable_scene=each_product['applicable_scene'],
#                            use_age=each_product['use_age'], ordering_hotline=each_product['ordering_hotline'],
#                            typename_second_id=each_product['typename_second_id'])

