from django.test import TestCase

# Create your tests here.
import requests
url='http://www.sdplay.com/'
headers={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36'}
response=requests.get(url=url,headers=headers).text.encode('iso-8859-1').decode('utf-8')
#utf-8
with open(r'C:\Users\jackeyhate\Desktop\sdplay.html','w',encoding='utf-8') as f:
    f.write(response)