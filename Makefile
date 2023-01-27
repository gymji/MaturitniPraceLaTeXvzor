#### Makefile for systems using GNU Make

LATEX=xelatex
BIBTEX=bibtex


VzorMP.pdf: VzorMP.tex VzorMP.bib
	$(LATEX) VzorMP
	$(LATEX) VzorMP

VzorMP.bib: Bibliografie.bib 
	$(LATEX) VzorMP
	$(BIBTEX) VzorMP


clean:
	$(RM) -v VzorMP.aux
	$(RM) -v VzorMP.bbl
	$(RM) -v VzorMP.blg
	$(RM) -v VzorMP.glg
	$(RM) -v VzorMP.glo
	$(RM) -v VzorMP.gls
	$(RM) -v VzorMP.ist
	$(RM) -v VzorMP.lof
	$(RM) -v VzorMP.log
	$(RM) -v VzorMP.lot
	$(RM) -v VzorMP.out
	$(RM) -v VzorMP.run.xml
	$(RM) -v VzorMP.toc
	$(RM) -v VzorMP-blx.bib

mrproper: clean
	$(RM) -v VzorMP.pdf

