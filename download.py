#!/usr/bin/env python


import json
from urllib import request
import os


try:
    os.mkdir("screensavers")
except FileExistsError:
    os.chdir("screensavers")


url = "http://a1.phobos.apple.com/us/r1000/000/Features/atv/AutumnResources/videos/entries.json"

data= json.loads(request.urlopen(url).read().decode('utf-8'))

for a in data:
    for b in a['assets']:
        url=b['url']
        name="%s-%s.mov"%(b['accessibilityLabel'],b['id'])
        print("Download %s --> %s"%(url,name))
        request.urlretrieve(url,name)

