#!/bin/bash
# =============================================================================
# Generátor projektu maturitní práce
# Gymnázium Jírovcova 8, České Budějovice
# =============================================================================
#
# Spuštění na Linux / macOS:
#   bash new_project.sh
#
# Spuštění na Windows (přes Git Bash):
#   1. Nainstalujte Git for Windows: https://git-scm.com/download/win
#   2. V průzkumníku souborů přejděte do složky new_project/
#   3. Klikněte pravým tlačítkem → "Git Bash Here"
#   4. Zadejte příkaz:  bash new_project.sh
# =============================================================================

set -e

echo "============================================="
echo "  Generátor projektu maturitní práce"
echo "  Gymnázium Jírovcova 8, České Budějovice"
echo "============================================="
echo ""
echo "Vyplňte prosím následující údaje:"
echo ""

read -p "Jméno a příjmení (s diakritikou, např. Anna Nováková): " AUTOR
read -p "Příjmení bez diakritiky, malými písmeny (např. novakova):  " PRIJMENI
read -p "Jméno bez diakritiky, malými písmeny (např. anna):          " JMENO
read -p "Třída (např. 4C):                                            " TRIDA

NAZEV="${PRIJMENI}_${JMENO}_${TRIDA}"

# Adresáře
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
CESTA="${ROOT_DIR}/../${NAZEV}"

echo ""
echo "---------------------------------------------"
echo "  Shrnutí:"
echo "  Autor:    ${AUTOR}"
echo "  Soubor:   ${NAZEV}.tex"
echo "  Adresář:  ${CESTA}"
echo "---------------------------------------------"
read -p "Pokračovat? [y/N]: " CONFIRM

if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo "Zrušeno."
    exit 0
fi

if [ -d "$CESTA" ]; then
    echo ""
    echo "Chyba: Adresář '${CESTA}' již existuje."
    exit 1
fi

echo ""
echo "Vytvářím projekt..."

# Vytvořit adresářovou strukturu
mkdir -p "${CESTA}/images"
mkdir -p "${CESTA}/PDF"

# Kopírovat potřebné soubory šablony
cp "${ROOT_DIR}/MP.sty"                 "${CESTA}/"
cp "${ROOT_DIR}/Bibliografie.bib"       "${CESTA}/"
cp "${ROOT_DIR}/Zkratky.tex"            "${CESTA}/"
cp "${ROOT_DIR}/.gitignore"             "${CESTA}/"
cp "${ROOT_DIR}/images/GJ8_logotyp.pdf" "${CESTA}/images/"

# Vygenerovat .tex soubor z šablony s předvyplněným autorem
TMPFILE=$(mktemp)
sed "s|%%AUTOR%%|${AUTOR}|g" "${SCRIPT_DIR}/SablonaPrace.tex" > "$TMPFILE"
mv "$TMPFILE" "${CESTA}/${NAZEV}.tex"

# Vygenerovat Makefile pro projekt studenta
cat > "${CESTA}/Makefile" << 'MAKEFILE_EOF'
NAME=STUDENT_NAME_PLACEHOLDER
LATEX=xelatex
BIBTEX=bibtex

$(NAME).pdf: $(NAME).tex
	$(LATEX) $(NAME)
	$(BIBTEX) $(NAME)
	$(LATEX) $(NAME)
	$(LATEX) $(NAME)
	@if [ -d "./PDF" ]; then mv $(NAME).pdf PDF; fi

clean:
	rm -f $(NAME).aux $(NAME).bbl $(NAME).blg $(NAME).glg $(NAME).glo \
	      $(NAME).gls $(NAME).ist $(NAME).lof $(NAME).log $(NAME).lot \
	      $(NAME).out $(NAME).run.xml $(NAME).toc $(NAME)-blx.bib

mrproper: clean
	rm -f PDF/$(NAME).pdf

install:
	sudo apt-get install texlive-xetex texlive-lang-czechslovak texlive-science \
	     texlive-fonts-extra texlive-latex-extra latexmk biber
MAKEFILE_EOF

# Nahradit placeholder skutečným názvem
TMPFILE=$(mktemp)
sed "s/STUDENT_NAME_PLACEHOLDER/${NAZEV}/g" "${CESTA}/Makefile" > "$TMPFILE"
mv "$TMPFILE" "${CESTA}/Makefile"

echo "  OK Zkopírovány soubory šablony"
echo "  OK Vytvořen ${NAZEV}.tex"
echo "  OK Vytvořen Makefile"
echo ""
echo "============================================="
echo "  Projekt byl vytvořen!"
echo ""
echo "  Adresář: ${CESTA}"
echo ""
echo "  Další kroky:"
echo "  1. Otevřete adresář ve VS Code"
echo "  2. Upravte metadata v souboru '${NAZEV}.tex'"
echo "  3. Kompilujte: make ${NAZEV}.pdf"
echo "     nebo Ctrl+Alt+B ve VS Code"
echo "============================================="
