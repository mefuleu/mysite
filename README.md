
这是为浙江上德游乐设备有限公司设计的外贸平台

后端：Django3.1

前端： Bootstrap + JQuery(Ajax)+vue(elementui)

部署工具 : Nginx+uWsgi+Supervisor+daphne

数据库:mysql,redis

项目测试部署网站：www.jackdaydayup.com  测试用户名:root  测试密码：123456  网站后台：www.jackdaydayup.com/admin/

项目在本地运行步骤：

1. git clone https://github.com/mefuleu/mysite.git
2. CREATE DATABASE myweb CHARACTER SET utf8;
3. pip install -r requirements.txt
4. 启动redis server
5. 执行python manage.py migrate
6. 执行python manage.py createsuperuser
7. 设置settings文件夹.py文件中的EMAIL_HOST_PASSWORD FB_CLIENT_ID FB_SECRET_KEY DJANGO_SECRET_KEY DATABASE_PASSWORD等环境变量
8. 将index.html以及chat.html中的wss链接换为ws,并将routing.py文件中的wss替换为ws  
9. 当前项目目录下执行：python manage.py runserver



