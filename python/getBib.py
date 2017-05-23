from bs4 import BeautifulSoup
from collections import OrderedDict
import urllib, json, pprint, re
pp = pprint.PrettyPrinter(indent=4)

r = urllib.urlopen('https://www.le.ac.uk/english/em1060to1220/bibliography.htm')
soup = BeautifulSoup(r,'lxml')

list = soup.find("div", class_="feature").contents[3:]


prevName = None

i=1
with open('bib2.json', 'w') as f, open('bibErrors', 'w') as e:
    f.write("[")
    for item in list:
        try:
            id = item.get('id')
            content = "".join(str(x.encode('utf-8')) for x in item.contents).replace('"', "'")

            if (content[:3] == '---'):
                name = prevName
                citation = "".join(str(x) for x in content.split(',')[1:])
            else:
                name = content.split(',')[0] + ","+ content.split(',')[1].strip()
                prevName = name
                citation = ",".join(str(x) for x in content.split(',')[2:]).strip()

            year = ""
            year = re.compile('(\d\d\d\d)\)')
            year = year.search(citation).group(1)
            citation = re.sub(' +',' ', citation.replace("\n","").replace("\r","").strip())

            if (i is not 1):
                f.write(',\n')
            f.write('{\n'
                    '   "id":"'+ id +'",\n'
                    '   "name":"'+ name +'",\n'
                    '   "year":'+ year + ",\n"
                    '   "citation":"'+ citation + '"\n'
                    '}')
            i= i+1

        except:
            e.write(str(item))
            pass

    f.write("]")
    print(i-1)