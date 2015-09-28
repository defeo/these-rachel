all: these.pdf annexe.pdf

these.pdf: these.tex these.cls hyphenations.sty bibliothese.bib these.bst
	latexmk -f -pdf these.tex

these.tex: these.lyx these.layout 
	lyx -e latex these.lyx

annexe.pdf: annexe.tex annexe-decors.tex annexe-objets.tex annexe-monnaies.tex
	pdflatex annexe.tex

annexe-decors.tex annexe-objets.tex annexe-monnaies.tex: bdd-*.csv annexe.py
	./annexe.py

.PHONY: all
