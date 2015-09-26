all: these.pdf annexe.pdf

these.pdf: these.tex
	pdflatex these.tex

these.tex: these.lyx these.layout these.cls
	lyx -e latex these.lyx

annexe.pdf: annexe.tex annexe-data.tex
	pdflatex annexe.tex

annexe-data.tex: bdd-decors.csv annexe.py
	./annexe.py

.PHONY: all
