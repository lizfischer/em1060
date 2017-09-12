import sys
from tidylib import tidy_document
from os import listdir
from os.path import isfile, join


mypath ="../mss/"

def main():
    files = [join(mypath, f) for f in listdir(mypath)]
    for file in files:
        inFile = open(file, 'r').read()
        document = tidy_document(inFile)
        outFile = open(file, 'w')
        outFile.write(document[0])

if __name__ == '__main__':
    main()
