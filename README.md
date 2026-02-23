# Maturitní práce

## Instalace XeLaTeXu (doporučeno: VS Code)
Šablona používá **XeLaTeX** (ne pdflatex). Doporučený postup:
- Nainstalujte [Visual Studio Code](https://code.visualstudio.com/)
- Nainstalujte balíčky pro XeLaTeX (příkaz pro Ubuntu/Debian, funguje i ve WSL a GitHub Codespaces):
```
sudo apt update
sudo apt install texlive-xetex texlive-lang-czechslovak texlive-science \
                 texlive-fonts-extra texlive-latex-extra latexmk biber
```
- Nainstalujte rozšíření [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) – VS Code ho nabídne automaticky při otevření repozitáře
- Otevřete `VzorMP.tex` a buildujte zkratkou `Ctrl+Alt+B`
- Na Windows doporučujeme [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) nebo [GitHub Codespaces](https://code.visualstudio.com/docs/remote/codespaces)

### Alternativa: TeXmaker
- Instalujte si [MikTeX](https://miktex.org/download) a [TeXmaker](https://www.xm1math.net/texmaker/download.html)
- V TeXmakeru nastavte: Volby → Nastavit TeXmaker → Rychlý překlad → **XeLaTeX** + Bib(la)tex + XeLaTeX(x2) + Zobrazit PDF

## Začínám psát práci (doporučený postup)

Spusťte skript, který vám vygeneruje prázdný projekt s vaším jménem:

```bash
cd new_project
bash new_project.sh
```

Skript se zeptá na vaše jméno a třídu a vytvoří adresář `../prijmeni_jmeno_trida/`
s vyplněnou šablonou, Makefile a všemi potřebnými soubory.
Výsledné PDF se bude jmenovat `prijmeni_jmeno_trida.pdf`.

**Na Windows:** nainstalujte [Git for Windows](https://git-scm.com/download/win),
v průzkumníku přejděte do složky `new_project/`, klikněte pravým tlačítkem →
*Git Bash Here* a zadejte `bash new_project.sh`.

---

## Dokumenty a struktura projektu
- `VzorMP.tex` – vzorový dokument s ukázkami; upravte nebo použijte jako základ
- `MP.sty` – stylesheet (neupravujte)
- `Bibliografie.bib` – seznam literatury ve formátu BibTeX
- `Zkratky.tex` – definice zkratek
- `images/` – složka pro obrázky (logo školy, vlastní obrázky)
- `PDF/` – výstupní PDF po překladu
- `new_project/` – skript pro vygenerování nového projektu studenta
- `scripts/` – pomocné skripty (např. generátor Mandelbrotovy množiny)
- `Makefile` – build automatizace pro Linux/macOS
- `make.bat` – build skript pro Windows
- `README.md`, `.gitignore`, `LICENSE` – správa projektu

## Mé příkazy
- `\mytitlepage` = vytvoří titulní stranu
- `\prohlaseni` = jako parametr bere text prohlášení a vytvoří stránku s prohlášením
- `\abstrakt` = jako paramtery bere text prohlášení a klíčová slova (ty jsou 2. parametrem, nepište je každé zvlášť) a vytvoří stránku o čem je práce (abstrakt a klíčová slova)
- `\podekovani` = jako parametr bere text poděkování a vytvoří stránku s poděkováním                                                                     

## LaTeX
- `\part` = Části (teoretická a praktická)
- `\chapter` = podle požadavků nastavené kapitoly 
- `\section` = podle požadavků nastavené podkapitoly
- `\subsection` = podle požadavků nastavené podpodkapitoly

- Pomlčka se píše jako `--`, spojovník jako `-`
- Tři tečky se píší jako `\ldots` (`\cdots` pro 3 tečky uprostřed, např. přeskočení členů v násobení)

- Zvýraznění je `\emph{italika}`. Toto je preferovaný způsob oproti `\textit{italika}`
- Tučné písmo je `\textbf{tučný text}`
- Italika jako taková je `\textit{kurzíva}` (vědecké názvy: `\textit{Homo sapiens}`)
- Neproporcionální písmo (písmo psacího stroje) `\texttt{nazev.souboru}`

- Odstavce se oddělují prázdným řádkem (nebo příkazem `\par`, pokud si to chcete někde vynutit)                                                 
- Nový řádek vytvoříte příkazem `\\` (pozor, konce řádků v tom, co píšete, TeX ignoruje)

- Matematické vzorce v rámci textu (inline): `$ E = mc^2 $`
- Samostatný (display) vzorec: `$$ a^2 + b^2 = c^2 $$`
- Číslovaná rovnice s odkazem: `\begin{equation} ... \label{eq:nazev} \end{equation}`, odkaz: `\eqref{eq:nazev}`
- Víceřádkové odvození: `\begin{align} F &= ma \\ W &= Fs \end{align}`
- Vektory: `\vec{F}`, normálový vektor: `\hat{n}`, integrál: `\int_a^b f(x)\,dx`
- Řecká písmena: `\alpha`, `\beta`, `\omega`, `\Delta`, `\lambda`
- V matematických vzorcích se závorky píší `\left(` `\right)` resp. `\left\{` `\right\}`, aby se přizpůsobily velikosti vzorce uvnitř (`\` je escapovací znak)
- Po čárce (oddělující prvky) píšete mezeru příkazem `\,`, stejně jako oddělujete trojice číslic `666\,666,666\,666` (číslo 666 666,666 666)
- Zlomky jsou následovně `\frac{čitatel}{jmenovatel}`
- Matematické symboly jsou na stránce https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols

- Seznam začínáte `\begin{itemize}` (resp. `\begin{enumerate}` pro číslovaný)
- Před každý prvek seznamu píšete `\item`                                  
- Seznam končíte `\end{itemize}` (resp. `\end{enumerate}` pro číslovaný)

- Poznámku pod čarou vytvoříte jako `\footnote{Nezapomeňte na velké písmeno na začátku a tečku na konci.}`
- Citaci jako `\cite[text před (jako třeba viz), nepovinné][text za, třeba strana (např.: s. 50) nepovinné]{název knihy}`
- Citaci pod čarou pak stejně jako citaci, akorát příkazem `\footcite`
- Citaci v závorkách stejně jako citaci, akorát příkazem `\parencite`
- Zkratku použijete jako `\gls{název zkratky}`

- Zkratku definujete jako `\newglossaryentry{název zkratky}{name={to, co chcete vypsat na místě, kde ji používáte},description={popis zkratky}}` v souboru Zkratky.tex viz `\newglossaryentry{atd}{name={atd.},description={a tak dále}}` a pak použití: `\gls{atd}` vám vypíše `atd.`

- Obrázek vkládáme příkazem `\includegraphics` uvnitř prostředí `figure`, odkaz: `\ref{fig:nazev}`
  - Obtékání textu: `\begin{wrapfigure}{r}{0.4\linewidth} ... \end{wrapfigure}`
  - Dva obrázky vedle sebe: prostředí `subfigure` (balíček `subcaption`)

- Tabulku vkládáme uvnitř prostředí `table`, odkaz: `\ref{tab:nazev}`
  - Profesionální styl s balíčkem `booktabs`: `\toprule`, `\midrule`, `\bottomrule`
  - Generátor tabulek: http://www.tablesgenerator.com/
 
- České [uvozovky](https://blog.inpage.cz/inpage/7-typografickych-hrichu-2-uvozovky-a-zavorky/) sázíme pomocí `\uv{text}`. Potom parametr *text* vysází v českých uvozovkách jako „text”.

- Chemické vzorce (balíček `mhchem`): `\ce{H2O}`, `\ce{2H2 + O2 -> 2H2O}`, `\ce{N2 + 3H2 <=> 2NH3}`

- Vektorové diagramy (balíček `tikz`): prostředí `\begin{tikzpicture} ... \end{tikzpicture}`

