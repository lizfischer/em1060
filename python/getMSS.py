from bs4 import BeautifulSoup
from collections import OrderedDict
import urllib, json, pprint
pp = pprint.PrettyPrinter(indent=4)

r = urllib.urlopen('https://www.le.ac.uk/english/em1060to1220/catalogue/mss.htm')
soup = BeautifulSoup(r,'lxml')
#table = soup.table

table = soup.table.find_all("tr")

errors = []

for row in table[1:]:

    id = row.contents[0].get('id').strip().encode('utf-8')
    city = row.contents[0].contents[0].contents[0].strip().encode('utf-8')
    repository = row.contents[1].contents[0].strip().encode('utf-8')
    collection = row.contents[2].contents[0].strip().encode('utf-8')
    shelfmark = row.contents[3].contents[0].strip().encode('utf-8')
    ker = row.contents[4].contents[0].strip().replace("[", "").replace("]", "").encode('utf-8')
    content = row.contents[5].contents[0].strip().encode('utf-8')
    location = row.contents[6].contents[0].strip().encode('utf-8')
    try:
        date = row.contents[7].contents[0].strip().encode('utf-8') +"^{" + row.contents[7].contents[1].contents[0].strip().encode('utf-8') + "}"
    except:
        date = ""
        errors.append(id)

    ms = OrderedDict()
    ms["id"] = id
    ms["city"] = city
    ms["repository"] = repository
    ms["collection"] = collection
    ms["shelfmark"] = shelfmark
    ms["ker"] = ker
    ms["shortDescription"] = content
    ms["location"] = location
    ms["date"] = date

    with open("manuscripts/"+id+".json", "w") as f:
        f.write(json.dumps(ms, indent=4))

    #print (id)
pp.pprint(sorted(errors))
#link = "https://www.le.ac.uk/english/em1060to1220/" + firstrow.contents[0].contents[0].get('href')[3:]
#rr = urllib.urlopen(link)
#soup2 = BeautifulSoup(rr, 'lxml')
#authors = soup2.find("p", class_="author").contents[0].strip().encode('utf-8')
#summary = soup2.find("span", class_="itemHeading").find_next_siblings("p")[1].contents[0].strip().encode('utf-8')
#print(id, city, repository,collection,shelfmark,ker,content,location,date,authors,summary)
