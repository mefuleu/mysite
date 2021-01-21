from django.test import TestCase
# Create your tests here.
from lxml import etree
import requests

import http.client
import hashlib
import json
import urllib
import random


def baidu_translate(content):
    appid = '20201019000593662'
    secretKey = 'DTU8hN8jj7NVdfzFixf8'
    httpClient = None
    myurl = '/api/trans/vip/translate'
    if content == '':
        return ''
    elif content.isdigit():
        return content
    else:
        q = content
        fromLang = 'zh'  # 源语言
        toLang = 'en'  # 翻译后的语言
        salt = random.randint(32768, 65536)
        sign = appid + q + str(salt) + secretKey
        sign = hashlib.md5(sign.encode()).hexdigest()
        myurl = myurl + '?appid=' + appid + '&q=' + urllib.parse.quote(
            q) + '&from=' + fromLang + '&to=' + toLang + '&salt=' + str(
            salt) + '&sign=' + sign

        try:
            httpClient = http.client.HTTPConnection('api.fanyi.baidu.com')
            httpClient.request('GET', myurl)
            # response是HTTPResponse对象
            response = httpClient.getresponse()
            jsonResponse = response.read().decode("utf-8")  # 获得返回的结果，结果为json格式
            js = json.loads(jsonResponse)  # 将json格式的结果转换字典结构
            dst = str(js["trans_result"][0]["dst"])  # 取得翻译后的文本结果
            return dst  # 打印结果
        except Exception as e:
            print(e)
        finally:
            if httpClient:
                httpClient.close()


headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36'}
all_img_list=[]#所有产品信息


response = requests.get(url='http://www.sdplay.com/case/', headers=headers).text.encode('iso-8859-1').decode('utf-8')
tree = etree.HTML(response)
img_list_init =tree.xpath('/html/body/div[7]/div/div[3]/div/div/h4//text()')

for each_a in img_list_init:
    all_img_list.append(each_a)

response = requests.get(url='http://www.sdplay.com/case/list_6_2.html', headers=headers).text.encode('iso-8859-1').decode('utf-8')
tree = etree.HTML(response)
img_list_init =tree.xpath('/html/body/div[7]/div/div[3]/div/div/h4//text()')

for each_a in img_list_init:
    all_img_list.append(each_a)


trans_title_list=[]

for each_title in all_img_list:
    each_title=baidu_translate(each_title)
    trans_title_list.append(each_title)

with open('C:/Users/jackeyhate/Desktop/sd_status/典型案例标题.json', 'w') as f_obj:
    json.dump(trans_title_list, f_obj, ensure_ascii=False, indent=4)



