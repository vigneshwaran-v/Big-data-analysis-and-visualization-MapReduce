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


for line in sys.stdin:
    # remove leading and trailing whitespace
    #line = line.strip()
    line=unicode(clean(line.lower()), errors='ignore')
    # split the line into words
    words = line.split()
    # increase counters
    for word in words:
        # write the results to STDOUT (standard output);
        # what we output here will be the input for the
        # Reduce step, i.e. the input for reducer.py
        #
        # tab-delimited; the trivial word count is 1
	if word in STOPWORDS:
		continue
        print '%s\t%s' % (word, 1)