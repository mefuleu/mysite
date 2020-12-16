
这是为浙江上德游乐设备有限公司设计的外贸平台

后端：Django3.1

前端： Bootstrap + JQuery(Ajax)+vue(elementui)

部署工具 : Nginx+uWsgi+Supervisor+daphne

数据库:mysql,redis

项目测试部署网站：www.jackdaydayup.com  测试用户名:root  测试密码：test password:123456  网站后台：www.jackdaydayup.com/admin/

项目在本地运行步骤：

1. git clone https://github.com/mefuleu/mysite.git
2. CREATE DATABASE myweb CHARACTER SET utf8;
3. pip install -r requirements.txt
4. 启动redis server
5. 执行python manage.py migrate
6. 执行python manage.py createsuperuser
7. python manage.py runserver_plus --cert server.crt 127.0.0.1:8000


