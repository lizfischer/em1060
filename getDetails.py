from bs4 import BeautifulSoup
from collections import OrderedDict
import urllib, json, pprint, re
pp = pprint.PrettyPrinter(indent=4)

BASE_URL = 'https://www.le.ac.uk/english/em1060to1220'
VERBOSE = True
errors = OrderedDict()
bibIDs = []
bibIDErrors = OrderedDict()

# Helper to remove excess whitespace
def superStrip(str):
    if not str: return None
    s = str.strip()
    s = re.sub("\s{2,}", " ", s)
    s = re.sub("(\s)[\.\?\!\,]", "", s)
    return s

# Helper function that takes a list of contents
# and returns a STRING which removes any outer tag but keeps internal tags
def unwrapList(list):
    if not list: return None

    # Remove blank items from the list
    for l in list:
        if l == "\n" or l == "" or l == None:
            list.remove(l)

    string = ""
    # Check if it's wrapped in a <p> or something
    if len(list) == 1 and type(list[0]) == type(list[0].parent):
        list = list[0]
        string = list.decode_contents(formatter="string/html")
    # Otherwise, just combine all the parts (keeping internal tags)
    else:
        for l in list:
            string += l.encode("utf-8")
    return superStrip(string)

def getBibIDs():
    with open("bib2.json", "r") as f:
        bib = json.load(f)
        for b in bib:
            bibIDs.append(b['id'])


def checkBibID(id):
    if bibIDs[id]: return True
    return False

# Gets links to all manuscripts
# TODO: Remove; join with getMSS.py
def getLinks():
    if VERBOSE: print("Getting Links")
    #'''
    r = urllib.urlopen(BASE_URL + '/catalogue/mss.htm')
    soup = BeautifulSoup(r, 'lxml')
    table = soup.table.find_all("tr")

    links = []
    for row in table[1:]:
        links.append(BASE_URL + row.contents[0].contents[0].get('href')[2:])
   # '''
    if VERBOSE: print("Done\n")
    return(links)

# Returns STRING manuscript summary
def getSummary(soup):
    if VERBOSE: print("...Getting summary")
    summary = soup.find_all(string="Summary:")[0].parent.next_sibling.next_sibling.contents
    '''
    content = ""
    for s in summary:
        content += superStrip(s)'''
    return (unwrapList(summary))

# Returns ORDERED DICT encoded items (e.g. [{'locus':'fols 2-4'...}]
def getItems(soup, link):
    if VERBOSE: print("...Getting items")
    itemSoup = soup.find_all(class_="msItem")
    items = []
    # EACH ITEM
    for item in itemSoup:
        locus = item.find_next(class_="locus").contents[0]
        text = item.find_next('a').contents[0]

        # GET NOTES
        noteSoup = item.find_next('ul').find_all('span', class_='itemHeading')
        notes = []
        for n in noteSoup:
            head = n.contents[0].strip()
            if head != "Title" and head != "Bibliography:":
                body = ''.join(n.parent.strings).replace(head+":", "")
                body = superStrip(body)
                d=OrderedDict()
                d['head']=head
                d['body']=body
                notes.append(d)

        # GET BIBLIOGRAPHY
        bibSoup = item.find('ul', class_='msItemBiblio')
        bib = None
        if bibSoup:
            bibSoup = bibSoup.find_all('a')
            bib = []
            for b in bibSoup:
                d = OrderedDict()
                work = b['href'].replace("#","")
                if work not in bibIDs: bibIDErrors[link] = work + " in Items"
                d["work"] = work
                try:
                    page = b.next_sibling[1:].strip()
                    d["page"] = page
                    bib.append(d)
                except:
                    bib.append({"work":work})

        d = OrderedDict()
        d["locus"] = locus
        d["text"] = text
        d["notes"] = notes
        d["bib"] = bib
        items.append(d)

    return items

# Returns ORDERED DICT object description
def getObjectDescription(soup):
    if VERBOSE: print("...Getting object description")
    objectHeader = soup.find("h4", id=re.compile('.*-objectDesc'))
    if objectHeader:
        form = superStrip(objectHeader.find_next("span", string="Form: ").next_sibling)

        support = objectHeader.find_next("span", string="Support: ")
        if support:
            support = superStrip(support.next_sibling)
        else: support = None

        extent = objectHeader.find_next("span", string="Extent: ")
        if extent:
            extent = extent.find_next("blockquote").contents[1].string.strip()
            extent += ".\n" + objectHeader.find_next("span", string="Extent: ").find_next("blockquote").find_next("blockquote").contents[1].string.strip() + "."
            extent = superStrip(extent)
        else: extent = None


        layout = objectHeader.find_next("span", string="Layout description: ")
        if layout:
            layout = layout.parent.next_sibling
            if len(layout.contents) > 1:
                layout = layout.contents[1].string
            else:
                layout = superStrip(layout.string)

        objectDesc = OrderedDict()
        objectDesc["form"] = form
        objectDesc["support"] = support
        objectDesc["extent"] = extent
        objectDesc["foliation"] = None
        objectDesc["collation"] = None
        objectDesc["layoutDescription"] = layout
        objectDesc["note"] = None

        return objectDesc
    else:
        return None

# Returns ORDERED DICT hand description
def getHandDescription(soup):
    if VERBOSE: print("...Getting hand description")
    handHeader = soup.find("h4", id=re.compile('.*-handDesc'))
    if handHeader:
        handObj = OrderedDict()

        number = handHeader.find_next("span", string="Number of hands: ")
        if number: number = superStrip(number.next_sibling)
        handObj["number"] = number

        summary = handHeader.find_next("span", string="Summary: ")
        if summary: summary = superStrip(summary.next_sibling)
        handObj["summary"] = summary

        hands = soup.find_all("ul", id=re.compile(".*\.SC.*"))
        handList = []
        for h in hands:
            hand = OrderedDict()
            hand["name"] = h.contents[1].strip()
            hand["scope"] = h.find("span", string="Scope: ").next_sibling.strip()
            hand["script"] = h.find("span", string="Script: ").next_sibling.strip()

            hand["scribe"] = h.find("span", string=re.compile("Scribe.*"))
            if not hand["scribe"]:
                hand["scribe"] = h.find("span", string=re.compile("Ker.*"))
            hand["scribe"] = hand["scribe"].next_sibling.strip()

            hand["description"] = superStrip(h.find_next("span", string="Description: ").next_sibling.strip())

            hand["summary"] = h.find("span", string=re.compile("Summary of.*"))
            if hand["summary"]:
                hand["summary"] = superStrip(hand["summary"].next_sibling)

            characters = h.find_all("li", class_="s")
            if characters:
                hand["characters"] = []
                for c in characters:
                    d = OrderedDict()
                    char = c.find_next("span", class_="c").string
                    note = c.decode_contents(formatter="string/html")

                    d["char"] = superStrip(char)
                    d["note"] = superStrip(note)
                    hand["characters"].append(d)

            date = h.find("span", string="Date: ")
            if date: date = superStrip(date.next_sibling)
            hand["date"] = date

            handList.append(hand)

        handObj["hands"] = handList

        return handObj

    else: return None

# Returns ARRAY decoration description
def getDecorationDescription(soup):
    decHead = soup.find(string="Decoration Description: ")
    if not decHead: return None
    dec = decHead.find_next("ul").find_next("ul").contents
    decList = []
    for d in dec:
        if d and d != "\n":
            s = superStrip(d.get_text())
            decList.append(s)

# Returns STRING binding description
def getBindingDescription(soup):
    binding = soup.find(string="Binding Description: ")
    if not binding: return None
    binding = binding.find_next("ul").contents
    return unwrapList(binding)

# Returns STRING accompanying material
#         None if not found
def getAccompanyingMaterial(soup):
    acc = soup.find(string = "Accompanying Material: ")
    if not acc: return None
    acc= acc.find_next("ul").contents
    return unwrapList(acc)

# Returns ORDERED DICT history
def getHistory(soup):
    historyHead = soup.find(string="History:")
    if not historyHead: historyHead = soup.find(id=re.compile(".*\-history.*"))
    if not historyHead: return None

    history = OrderedDict()

    origin = historyHead.find_next(string="Origin: ")
    if origin: origin = origin.parent.parent.contents[1:]
    history["origin"] = unwrapList(origin)

    provenance = historyHead.find_next(string="Provenance: ")
    if provenance: provenance = provenance.parent.parent.contents[1:]
    history["provenance"] = unwrapList(provenance)

    acquisition = historyHead.find_next(string="Acquisition: ")
    if acquisition: acquisition = acquisition.parent.parent.contents[1:]
    history["acquisition"] = unwrapList(acquisition)

    return history

# Returns BOOL surrogate
def hasSurrogate(soup):
    if VERBOSE: print("...Finding surrogate")
    sur = soup.find("h4", id=re.compile(".*-surrogates"))
    if sur: return True
    return False

# Returns STRING administration info
def getAdmin(soup):
    if VERBOSE: print("...Getting admin info")
    admin = soup.find("h4", id=re.compile(".*-adminInfo"))
    if not admin: admin = soup.find(string="Administration Information: ")

    if admin: admin = superStrip(admin.find_next("ul").get_text())
    return admin

#  Returns ARRAY bibliography
def getBib(soup, link):
    if VERBOSE: print("...Getting bibliography")
    bibList = []
    bibHead = soup.find("h4", id=re.compile(".*-listBibl"))
    if not bibHead:
        bibHead = soup.find_all(string="Bibliography: ")[-1]
    bib = bibHead.find_next("ul", class_="msItemBiblio").find_all("p")

    for b in bib:
        try: id = b["id"]
        except: id = b.find("a")["href"]
        if id not in bibIDs: bibIDErrors[link] = id + " in Main Bib"
        bibList.append(id)

    return bibList



# Returns ORDERED DICT of all MS info
def getDetails(link, row):
    ms = OrderedDict()

    try:
        ms["id"] = row.contents[0].get('id').strip().encode('utf-8')
        if VERBOSE: print ("Starting " + ms["id"])
    except:
        errors[link] += "ID ,"

    try:
        ms["city"] = row.contents[0].contents[0].contents[0].strip().encode('utf-8')
    except:
        errors[link] += "City ,"

    try:
        ms["repository"] = row.contents[1].contents[0].strip().encode('utf-8')
    except:
        errors[link] += "Repo ,"

    try:
        ms["collection"] = row.contents[2].contents[0].strip().encode('utf-8')
    except:
        errors[link] += "Collection ,"

    try:
        ms["shelfmark"] = row.contents[3].contents[0].strip().encode('utf-8')
    except:
        errors[link] += "Shelfmark ,"

    try:
        ms["ker"] = row.contents[4].contents[0].strip().replace("[", "").replace("]", "").encode('utf-8')
    except:
        errors[link] += "Ker ,"

    try:
        ms["content"] = row.contents[5].contents[0].strip().encode('utf-8')
    except:
        errors[link] += "Content ,"

    try:
        ms["location"] = row.contents[6].contents[0].strip().encode('utf-8')
    except:
        errors[link] += "Location ,"

    try:
        ms["date"] = row.contents[7].contents[0].strip().encode('utf-8') + "^{" + row.contents[7].contents[1].contents[
            0].strip().encode('utf-8') + "}"
    except:
        errors[link] += "Date ,"

    r = urllib.urlopen(link)
    soup = BeautifulSoup(r, 'lxml')

    try:
        ms["summary"] = getSummary(soup)
    except:
        errors[link] += "Summary, "

    try:
        ms["items"] = getItems(soup, link)
    except:
        errors[link] += "Items, "

    try:
        ms["objectDesc"] = getObjectDescription(soup)
    except:
        errors[link] += "Object Desc, "

    try:
        ms["handDesc"] = getHandDescription(soup)
    except:
        errors[link] += "Hand Desc, "

    try:
        ms["decoration"] = getDecorationDescription(soup)
    except:
        errors[link] += "Decoration, "

    try:
        ms["binding"] = getBindingDescription(soup)
    except:
        errors[link] += "Binding, "

    try:
        ms["accompanying"] = getAccompanyingMaterial(soup)
    except:
        errors[link] += "Accompanying Material, "

    try:
        ms["history"] = getHistory(soup)
    except:
        errors[link] += "History, "

    try:
        ms["admin"] = getAdmin(soup)
    except:
        errors[link] += "Admin Info, "

    try:
        ms["surrogate"] = hasSurrogate(soup)
    except:
        errors[link] += "Surrogate, "

    try:
        ms["bib"] = getBib(soup, link)
    except:
        errors[link] += "Bibliography, "

    return ms

# Main
def main():
    getBibIDs()
    try:
        r = urllib.urlopen('https://www.le.ac.uk/english/em1060to1220/catalogue/mss.htm')
        soup = BeautifulSoup(r, 'lxml')
        table = soup.table.find_all("tr")

        for row in table[1:]:
            link = BASE_URL + row.contents[0].contents[0].get('href')[2:]
            errors[link] = ""
            ms = getDetails(link, row)

            with open("manuscripts/" + ms["id"] + ".json", "w") as f:
                try:
                    f.write(json.dumps(ms, indent=4))
                except:
                    errors[link] += "WRITE"

            if errors[link] == "": errors.pop(link)
            else: errors[link] = errors[link][:-2]

        with open("errors.json", "w") as f:
            f.write(json.dumps(errors, indent=4))
            f.write("\n\nBIB ID ERRORS\n")
            f.write(json.dumps(bibIDErrors, indent=4))

    except KeyboardInterrupt:
        with open("errors.json", "w") as f:
            f.write(json.dumps(errors, indent=4))
            f.write("\n\nBIB ID ERRORS\n")
            f.write(json.dumps(bibIDErrors, indent=4))
        raise

if __name__ == "__main__":
    main()

