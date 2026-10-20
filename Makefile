#### Makefile pro šablonu maturitní práce (GNU Make: Linux, macOS, GitHub Codespaces)
#
#   make            přeloží mprace.tex  -> mprace.pdf (vaše práce)
#   make vzor       přeloží vzor.tex    -> vzor.pdf   (vzor s ukázkami)
#   make check      zkontroluje, že kostra vzor.tex odpovídá mprace.tex
#   make zip        vytvoří odlehčený ZIP pro Overleaf ($(ZIP_OUT))
#   make clean      smaže pomocné soubory překladu
#   make mrproper   smaže i mprace.pdf a ZIP (vzor.pdf zůstává)
#   make install    nainstaluje TeX Live (Ubuntu/Debian/GitHub Codespaces)

LATEXMK  = latexmk -xelatex -interaction=nonstopmode -file-line-error
ZIP_OUT  = MaturitniPrace-overleaf.zip
# Co patří do odlehčeného ZIPu pro Overleaf (jen soubory verzované v gitu).
# Bez vzor.tex, vzor/kapitoly a vzor/obrazky: jediný soubor s \documentclass
# je mprace.tex (Overleaf ho vybere jako hlavní) a vzor se tam nepřekládá.
ZIP_FILES = mprace.tex kapitoly MP.sty Bibliografie.bib images latexmkrc \
            vzor.pdf vzor/ukazky vzor/vzor.bib
AUX_EXT  = aux bbl blg bcf fdb_latexmk fls glg glo gls ist lof log lol lot out \
           run.xml toc xdv synctex.gz

.PHONY: all mprace vzor check zip clean mrproper install

all: mprace
mprace: mprace.pdf
vzor: vzor.pdf

mprace.pdf: mprace.tex MP.sty Bibliografie.bib $(wildcard kapitoly/*.tex) latexmkrc
	$(LATEXMK) mprace

vzor.pdf: vzor.tex MP.sty $(wildcard vzor/*.bib vzor/*.tex vzor/*/*.tex) latexmkrc
	$(LATEXMK) vzor

check:
	python3 scripts/kontrola_kostry.py mprace.tex vzor.tex

zip: check vzor.pdf
	rm -f $(ZIP_OUT)
	git ls-files -- $(ZIP_FILES) | zip -X -q $(ZIP_OUT) -@
	@echo "Hotovo: $(ZIP_OUT) ($$(unzip -Z1 $(ZIP_OUT) | wc -l | tr -d ' ') souborů)"

clean:
	$(RM) $(foreach d,mprace vzor,$(foreach e,$(AUX_EXT),$(d).$(e)) $(d)-blx.bib)
	$(RM) kapitoly/*.aux vzor/kapitoly/*.aux

mrproper: clean
	$(RM) mprace.pdf $(ZIP_OUT)

# install TeX Live on Ubuntu/Debian Linux/Github Codespaces
install:
	sudo apt-get update --allow-unauthenticated 2>/dev/null || true
	sudo apt-get install -y texlive-xetex
	sudo apt-get install -y texlive-lang-czechslovak
	sudo apt-get install -y texlive-fonts-extra texlive-latex-extra texlive-fonts-recommended
	sudo apt-get install -y texlive-science
	sudo apt-get install -y texlive-bibtex-extra
	sudo apt-get install -y latexmk
