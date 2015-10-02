all: these.pdf annexe.pdf

these.pdf: these.tex these.cls hyphenations.sty title.tex bibliography.tex bibliography-cites.tex \
	modernes.bib modernes.bst antiques.bib antiques.bst
	latexmk -f -pdf these.tex

these.tex: these.lyx these.layout 
	lyx -e latex these.lyx

bibliography-cites.tex: antiques.bib modernes.bib bib-citeall.py
	./bib-citeall.py

annexe.pdf: annexe.tex annexe-decors.tex annexe-objets.tex annexe-monnaies.tex
	pdflatex annexe.tex

annexe-decors.tex annexe-objets.tex annexe-monnaies.tex: bdd-*.csv annexe.py
	./annexe.py

.PHONY: all
