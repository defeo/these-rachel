#!/usr/bin/python

import re
import sys

with open('bibliography-cites.tex', 'w') as out:
    regex = re.compile("@[a-zA-Z]+{(.*),$")
    for bib in ['antiques', 'modernes']:
        kwds = {'encoding': 'iso-8859-15'} if (sys.version_info[0] > 2) else {}
        with open('%s.bib' % bib, **kwds) as db:
            keys = []
            for l in db:
                m = regex.match(l)
                if m:
                    keys.append(m.group(1))
            out.write('\\nocite%s{%s}\n' % (bib, ','.join(keys)))
