#!/usr/bin/python

import csv

# num,house,name,subject,type,date,room,wall,painter,location,credits
with open('annexe-decors.tex', 'w') as out:
    with open('bdd-decors.csv') as bdd:
        reader = csv.DictReader(bdd, delimiter=',', quotechar='"')
        for row in reader:
            out.write(r'''
  \decor[house={%(house)s}, name={%(name)s}, subject={%(subject)s},
            type={%(type)s}, date={%(date)s}, room={%(room)s}, wall={%(wall)s},
            artist={%(painter)s}, location={%(location)s}, credits={%(credits)s}]
            {bdd-decors/%(num)s.jpg}
''' % row)

# Ref,Apellation,Sujet,Materiau,Datation,Sculpteur,Decouverte,Localisation,Photographie
with open('annexe-objets.tex', 'w') as out:
    with open('bdd-objets.csv') as bdd:
        reader = csv.DictReader(bdd, delimiter=',', quotechar='"')
        for row in reader:
            out.write(r'''
  \objet[name={%(Apellation)s}, subject={%(Sujet)s}, material={%(Materiau)s},
            date={%(Datation)s}, artist={%(Sculpteur)s}, discovery={%(Decouverte)s},
            location={%(Localisation)s}, credits={%(Photographie)s}]
            {bdd-objets/%(Ref)s.jpg}
''' % row)


# Num,Ref,Valeur,Atelier,Magistrat,Date,Droit,InscrDroit,Revers,InscrRevers
with open('annexe-monnaies.tex', 'w') as out:
    with open('bdd-monnaies.csv') as bdd:
        reader = csv.DictReader(bdd, delimiter=',', quotechar='"')
        for row in reader:
            out.write(r'''
  \monnaie[ref={%(Ref)s}, value={%(Valeur)s}, artist={%(Atelier)s}, 
            magistrate={%(Magistrat)s}, date={%(Date)s}, front={%(Droit)s},
            frontInscr={%(InscrDroit)s}, back={%(Revers)s}, backInscr={%(InscrRevers)s}]
            {bdd-monnaies/%(Num)s.jpg}
''' % row)
