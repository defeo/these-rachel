#!/usr/bin/python

import re

with open('bibliography-cites.tex', 'w') as out:
    regex = re.compile("@[a-zA-Z]+{(.*),$")
    for bib in ['antiques', 'modernes']:
        with open('%s.bib' % bib) as db:
            keys = []
            for l in db:
                m = regex.match(l)
                if m:
                    keys.append(m.group(1))
            out.write('\\nocite%s{%s}\n' % (bib, ','.join(keys)))
