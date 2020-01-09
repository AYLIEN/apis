#!/usr/bin/env python

# source: https://stackoverflow.com/questions/9004135/merge-multiple-xml-files-from-command-line

import sys
from xml.etree import ElementTree

def run(files):
    first = None
    for filename in files:
        data = ElementTree.parse(filename).getroot()
        if first is None:
            first = data
        else:
            first.extend(data)
    if first is not None:
        ElementTree.register_namespace("", "http://maven.apache.org/POM/4.0.0")
        ElementTree.dump(first)

if __name__ == "__main__":
    run(sys.argv[1:])
