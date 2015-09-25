#!/usr/bin/python

import csv

with open('annexe-data.tex', 'w') as out:
    with open('bdd-decors.csv') as bdd:
        reader = csv.DictReader(bdd, delimiter=',', quotechar='"')
        for row in reader:
            out.write(r'''
  \includegraphics[width=\textwidth]{bdd-decors/%(num)s.jpg}

  \house{%(house)s} \name{%(name)s} \subject{%(subject)s} 
  \type{%(type)s} \date{%(date)s} \room{%(room)s} \wall{%(wall)s}
  \painter{%(painter)s} \location{%(location)s} \credits{%(credits)s}

\clearpage
''' % row)
