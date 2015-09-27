all: these.pdf annexe.pdf

these.pdf: these.tex these.cls hyphenations.sty these.bbl
	pdflatex these.tex

these.bbl: bibliothese.bib bibliothese.tex
	pdflatex these.tex
	bibtex these.aux

these.tex: these.lyx these.layout 
	lyx -e latex these.lyx

annexe.pdf: annexe.tex annexe-data.tex
	pdflatex annexe.tex

annexe-data.tex: bdd-decors.csv annexe.py
	./annexe.py

.PHONY: all
