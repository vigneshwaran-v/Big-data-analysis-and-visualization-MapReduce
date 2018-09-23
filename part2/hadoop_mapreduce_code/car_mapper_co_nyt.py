#!/usr/bin/env python
"""mapper.py"""

import sys
import string
import nltk
from nltk.corpus import stopwords
nltk.download('stopwords')
# input comes from STDIN (standard input)

STOPWORDS = nltk.corpus.stopwords.words('english')

def clean(s):
    return ''.join(c for c in s if not c in string.punctuation)

topwords=["uber","cars","selfdriving","vehicles","waymo","technology","autonomous","company","testing","lyft"]

for line in sys.stdin:
    # remove leading and trailing whitespace
    #line = line.strip()
    line=unicode(clean(line.lower()), errors='ignore')
    # split the line into words
    words = line.split()
    # increase counters
    for i in range(len(words)-1):
	if words[i] in STOPWORDS:
		continue
	if words[i] in topwords:
		pass
	else:
		continue
	print '%s-%s\t%s' % (words[i],words[i+1],1)
    
	
        