#!/usr/bin/env python3
"""
Kontrola kostry: ověří, že vzor.tex a mprace.tex mají stejnou stavbu.

Porovnává pořadí strukturních příkazů (styl MP, údaje o práci, úvodní
strany, \\include kapitol, \\part, seznamy, přílohy). Text uvnitř příkazů
se neporovnává – vzor má jiné údaje o práci i jiné prohlášení. Další
balíčky (\\usepackage{tikz} apod.) smí vzor načítat navíc.
Cesty v \\include se porovnávají bez předpony "vzor/"
(vzor/kapitoly/uvod  ~  kapitoly/uvod).

Spuštění:  python3 scripts/kontrola_kostry.py mprace.tex vzor.tex
           (nebo: make check)
"""
import difflib
import re
import sys

# Příkazy v preambuli (před \begin{document}) – porovnává se jen jejich výskyt.
PREAMBULE = ["documentclass", "usepackage", "addbibresource", "loadglsentries",
             "author", "title", "date", "vedouci", "place", "skolnirok", "logo"]
# Příkazy v těle dokumentu.
TELO = ["pagenumbering", "mytitlepage", "prohlaseni", "abstrakt", "podekovani",
        "tableofcontents", "include", "part", "printbibliography", "printglossary",
        "listoffigures", "listoftables", "lstlistoflistings"]
# U těchto příkazů záleží i na argumentu.
S_ARGUMENTEM = {"documentclass", "usepackage", "pagenumbering", "include", "part",
                "printbibliography"}

PRIKAZ = re.compile(r"\\(begin|end)\{(document|appendices)\}"
                    r"|\\([a-zA-Z]+)(?![a-zA-Z])(\[[^\]]*\])?(\{[^{}]*\})?")


def kostra(cesta):
    """Vrátí seznam strukturních příkazů souboru v pořadí, v jakém jsou."""
    vysledek = []
    v_tele = False
    with open(cesta, encoding="utf-8") as f:
        for radek in f:
            radek = re.sub(r"(?<!\\)%.*", "", radek)       # bez komentářů
            for m in PRIKAZ.finditer(radek):
                if m.group(1):                            # \begin / \end
                    prostredi = m.group(2)
                    if prostredi == "document":
                        v_tele = m.group(1) == "begin"
                    vysledek.append(f"\\{m.group(1)}{{{prostredi}}}")
                    continue
                nazev = m.group(3)
                if nazev not in (TELO if v_tele else PREAMBULE):
                    continue
                # Vzor smí načítat balíčky navíc (tikz, mhchem… jsou v mprace.tex
                # volitelné); porovnává se jen styl práce MP.
                if nazev == "usepackage" and m.group(5) != "{MP}":
                    continue
                zaznam = "\\" + nazev
                if nazev in S_ARGUMENTEM:
                    zaznam += (m.group(4) or "") + (m.group(5) or "")
                    zaznam = zaznam.replace("{vzor/", "{")
                vysledek.append(zaznam)
    return vysledek


def main():
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    prace, vzor = sys.argv[1], sys.argv[2]
    a, b = kostra(prace), kostra(vzor)
    if a == b:
        print(f"Kostra je shodná: {prace} = {vzor} ({len(a)} strukturních příkazů)")
        return
    print(f"CHYBA: kostra souborů {prace} a {vzor} se liší:\n")
    for radek in difflib.unified_diff(a, b, prace, vzor, lineterm=""):
        print(radek)
    sys.exit(1)


if __name__ == "__main__":
    main()
