from lxml import html
import requests

page = requests.get('https://www.le.ac.uk/english/em1060to1220/catalogue/IndexTexts.htm')
tree = html.fromstring(page.content)

table = tree.xpath('//table[@class="browsing"]')[0]
rows = table.xpath('//tr')

with open('items.json', 'w') as f:
    f.write("[")
    for i in range(1,len(rows)):
        row = rows[i]
        cam = row[0].text_content().encode('utf-8').strip()
        title = row[1].text_content().encode('utf-8').strip().replace("\n","")
        if (cam[-2:] == "EM"):
            supplied = "true"
        else: supplied = "false"
        #print(cam, title)
        if (i is not 1):
            f.write(',\n')
        f.write('{\n'
                '   "id":"_id",\n'
                '   "cameron":"'+ cam +'",\n'
                '   "title":"'+ title + '",\n'
                '   "supplied":' + supplied + "\n"
                '}')
    f.write("]")