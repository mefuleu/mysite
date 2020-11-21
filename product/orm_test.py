import os

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mysite.settings.development')  # manage.py文件中有同样的环境配置
import django

django.setup()  # 启动django项目
from django.db import connection
from product.models import *
# p=Product.objects.all()[:3]
from django.db.models import Sum, Count

# cursor = connection.cursor()
# cursor.execute(
#     'SELECT product_product.use_age , COUNT(product_product.use_age ) FROM product_product GROUP BY product_product.use_age')
# cursor.fetchall()
# p=Product.objects.raw('SELECT product_product.use_age , COUNT(product_product.use_age ) FROM product_product GROUP BY product_product.use_age')
p=Product.objects.values('use_age').annotate(each_sum=Count('use_age')).order_by()
print(p)