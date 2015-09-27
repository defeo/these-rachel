all: these.pdf annexe.pdf

these.pdf: these.tex these.cls hyphenations.sty bibliothese.bib these.bst
	latexmk -f -pdf these.tex

these.tex: these.lyx these.layout 
	lyx -e latex these.lyx

annexe.pdf: annexe.tex annexe-data.tex
	pdflatex annexe.tex

annexe-data.tex: bdd-decors.csv annexe.py
	./annexe.py

.PHONY: all
