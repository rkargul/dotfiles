#!/bin/python3

import getopt
import sys
from urllib.request import urlopen
from bs4 import BeautifulSoup


class Article:
    def __init__(self, search="Special:Random", url=None):
        self.search = search
        self.url = url
        self.default_url = 'https://en.wikipedia.org/wiki/'
        self.source = None

    def read(self):
        try:
            if self.url is None:
                self.source = urlopen(self.default_url + self.search)
            else:
                self.source = urlopen(self.url)
        except:
            print("Something seems to be wrong with the url or search term!")
            quit(1)

    def sources(self):
        if self.source is None:
            self.read()

        text = ''
        soup = BeautifulSoup(self.source, 'lxml')

        for paragraph in soup.find_all('cite'):
            text += paragraph.text + "\n"

        return text

    def __str__(self):
        if self.source is None:
            self.read()

        text = ''
        soup = BeautifulSoup(self.source, 'lxml')

        for paragraph in soup.find_all('p'):
            text += paragraph.text

        return text


def usage():
    help = "WIKIPEDIA SCRAPER: prints wikipedia articles to the command line" \
        + "\n" \
        + "\n -s \t\t\tList sources" \
        + "\n -h --help \t\tShow this help" \
        + "\n -S --search \t\tSearch for a specific article" \
        + "\n -U --url  \t\tEnter a full url to scrape (can also be a non-wikipedia url, will look for <p> tags)"

    print(help)


if __name__ == "__main__":
    try:
        opts, args = getopt.getopt(sys.argv[1:], 'S:U:hs', [
                                   'help', 'url=', 'search='])
    except getopt.GetoptError as e:
        print(e)
        print("Use option -h or --help to display help")
        quit(1)

    article = None
    sources = False

    for opt, arg in opts:
        if opt in ['-h', '--help']:
            usage()
            quit()
        elif opt in ["-U", "--url"]:
            article = Article(url=arg)
        elif opt in ["-S", "--search"]:
            article = Article(search=arg)
        elif opt in ["-s"]:
            sources = True

    if article is None:
        article = Article()

    if sources:
        print(article.sources())
    else:
        print(article)
