# CLAUDE.md

## Přehled projektu

Šablona pro maturitní práci studentů **Gymnázia Jírovcova 8, České Budějovice**. Autoři: Jonáš Havelka, Michal Kočer, Daniel Sýkora. Licence: MIT.

Projekt poskytuje kompletní LaTeX šablonu včetně stylu, vzorového dokumentu, build skriptů a konfigurace pro VS Code.

---

## Klíčové soubory

| Soubor | Účel |
|--------|------|
| `VzorMP.tex` | Hlavní vzorový dokument – sem student píše svou práci |
| `MP.sty` | Stylesheet – **neupravovat**, obsahuje veškeré stylování |
| `Makefile` | Build automatizace (cíle níže) |
| `Bibliografie.bib` | Bibliografické záznamy ve formátu BibTeX |
| `Zkratky.tex` | Definice zkratek pro glossary |
| `images/` | Složka pro obrázky |
| `PDF/` | Výstupní PDF soubory |

---

## Build

Projekt používá **XeLaTeX** (ne pdflatex).

```bash
make VzorMP.pdf   # Zkompiluje dokument → PDF/VzorMP.pdf
make clean        # Odstraní pomocné soubory (aux, log, bbl, ...)
make mrproper     # Odstraní vše včetně PDF
make install      # Nainstaluje závislosti na Ubuntu/Debian
```

Manuální build:
```bash
xelatex VzorMP
bibtex VzorMP
xelatex VzorMP
xelatex VzorMP
```

### Závislosti (Ubuntu/Debian)
```
texlive-xetex texlive-lang-czechslovak texlive-science
texlive-fonts-extra texlive-latex-extra latexmk biber
```

---

## VS Code

Konfigurace v `.vscode/`:
- **Recipe**: `latexmk (xelatex)` s výstupem do `temp/`, přesun do `PDF/`
- **Doporučená rozšíření**: `james-yu.latex-workshop`, `vscodevim.vim`
- Build: `Ctrl+Alt+B` nebo task `build with make`

---

## Struktura maturitní práce (VzorMP.tex)

```
Přední část (nečíslovaná):
  - Titulní strana (\mytitlepage)
  - Prohlášení (\prohlaseni{})
  - Abstrakt (\abstrakt{}{})
  - Poděkování (\podekovani{})
  - Obsah

Tělo práce (arabské číslice):
  - Úvod
  - Part I – Teoretická část
  - Part II – Praktická část
  - Závěr

Zadní část:
  - Bibliografie
  - Seznam zkratek
  - Seznam obrázků / tabulek
  - Přílohy
```

## Vlastní příkazy (MP.sty)

| Příkaz | Popis |
|--------|-------|
| `\mytitlepage` | Vygeneruje titulní stranu z metadat |
| `\prohlaseni{text}` | Prohlášení o samostatnosti |
| `\abstrakt{text}{klíčová slova}` | Abstrakt |
| `\podekovani{text}` | Poděkování |

Metadata dokumentu (v hlavičce `VzorMP.tex`):
- `\author`, `\title`, `\date`
- `\vedouci`, `\place`, `\skolnirok`

---

## Konvence

- Kompilátor: **xelatex** (ne pdflatex ani lualatex)
- Jazyk: čeština (Polyglossia)
- České uvozovky: `\uv{text}`
- Citace: BibTeX + `\cite{klíč}`
- Zkratky: `\gls{klíč}` (definice v `Zkratky.tex`)
- Obrázky vkládat do `images/`, reference přes `\includegraphics`
- **MP.sty neupravovat** – veškeré změny stylu patří do `.sty` souboru pouze pokud to student výslovně potřebuje
