#### Makefile for systems using GNU Make

PDFLATEX=xelatex -shell-escape
BIBTEX=bibtex


MPcervenym.pdf: MPcervenym.tex MPcervenym.bib
	$(PDFLATEX) MPcervenym
	$(PDFLATEX) MPcervenym

MPcervenym.bib: Bibliografie.bib 
	$(PDFLATEX) MPcervenym
	$(BIBTEX) MPcervenym


clean:
	$(RM) -v MPcervenym.aux
	$(RM) -v MPcervenym.bbl
	$(RM) -v MPcervenym.blg
	$(RM) -v MPcervenym.glg
	$(RM) -v MPcervenym.glo
	$(RM) -v MPcervenym.gls
	$(RM) -v MPcervenym.ist
	$(RM) -v MPcervenym.lof
	$(RM) -v MPcervenym.log
	$(RM) -v MPcervenym.lot
	$(RM) -v MPcervenym.out
	$(RM) -v MPcervenym.run.xml
	$(RM) -v MPcervenym.toc
	$(RM) -v MPcervenym-blx.bib

mrproper: clean
	$(RM) -v MPcervenym.pdf

