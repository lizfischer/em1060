from bs4 import BeautifulSoup
from collections import OrderedDict
import urllib, json, pprint
pp = pprint.PrettyPrinter(indent=4)

r = urllib.urlopen('https://www.le.ac.uk/english/em1060to1220/bibliography.htm')
soup = BeautifulSoup(r,'lxml')

list = soup.find("div", class_="feature").contents[3:19]

prevName = None
for item in list:
    try:
        id = item.get('id')
        content = "".join(str(x) for x in item.contents)
        if (content[:3] == '---'):
            name = prevName
        else:
            name = content.split(',')[0] + ","+ content.split(',')[1]
            prevName = name

        print(content) #TODO replace with file write!

    except:
        #print(item)
        pass

