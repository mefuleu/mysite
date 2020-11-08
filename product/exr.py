from lxml import etree
import requests
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36'}
first_list = ['http://www.sdplay.com/shiwaiyouleshebei/','http://www.sdplay.com/shineiyouleshebei/','http://www.sdplay.com/other/']
new_list=[]
for url in first_list:
    response = requests.get(url=url, headers=headers).text.encode('iso-8859-1').decode('utf-8')
    tree = etree.HTML(response)
    a_list = tree.xpath('//ul[@class="prod_nav"]//a/@href')
    for each_a in a_list:
        each_a='http://www.sdplay.com'+each_a
        new_list.append(each_a)
print(new_list)
