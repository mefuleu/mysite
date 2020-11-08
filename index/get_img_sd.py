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
first_list = ['http://www.sdplay.com/shiwaiyouleshebei/','http://www.sdplay.com/shineiyouleshebei/','http://www.sdplay.com/other/']
new_list=['http://www.sdplay.com/suliaozuhehuati/list_16_2.html','http://www.sdplay.com/other/list_5_2.html']#获取所有二级产品链接
all_img_list=[]#所有产品信息
count=1#记录二级产品类型id
# for url in first_list:
#     response = requests.get(url=url, headers=headers).text.encode('iso-8859-1').decode('utf-8')
#     tree = etree.HTML(response)
#     a_list = tree.xpath('//ul[@class="prod_nav"]//a/@href')
#     for each_a in a_list:
#         each_a='http://www.sdplay.com'+each_a
#         new_list.append(each_a)
for url in new_list:
    response = requests.get(url=url, headers=headers).text.encode('iso-8859-1').decode('utf-8')
    tree = etree.HTML(response)
    img_list_init =tree.xpath('//div[@class="pr-img-area "]//figure[@class="hidden-xs hidden-sm"]//img[1]/@src')
    for each_a in img_list_init:
        img_list_last='http://www.sdplay.com'+each_a
        all_img_list.append(img_list_last)

img_count=91#迭代图片数
for each_img in all_img_list:
    img_content=requests.get(each_img)
    path_dir='C:/Users/jackeyhate/Desktop/sd_img/'+str(img_count)+'.jpg'
    with open(path_dir, 'wb') as f_obj:
        f_obj.write(img_content.content)
    img_count += 1