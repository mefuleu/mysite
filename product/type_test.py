import os



os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mysite.settings.development')
import django
django.setup()  # 启动django项目
from product.models import Product,ProductTypeFirst,ProductTypeSecond
type_second = ProductTypeSecond.objects.filter(second_typename='Non-standard customized amusement equipment')
products=Product.objects.filter(typename_second_id=type_second[0].id)
print(len(products))



