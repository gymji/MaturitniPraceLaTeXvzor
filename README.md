# Maturitní práce v LaTeXu

Šablona maturitní práce pro studenty **Gymnázia Jírovcova 8, České Budějovice**.
Obsahuje styl práce, prázdnou kostru práce a **vzor s ukázkami** (citace, rovnice,
jednotky, obrázky, tabulky, diagramy, schémata programů, výpisy kódu, přílohy).

Autoři: Jonáš Havelka, Michal Kočer, Daniel Sýkora · Licence: MIT

> **Šablona se překládá XeLaTeXem** (ne pdfLaTeXem). S pdfLaTeXem skončí překlad
> chybou balíčku `fontspec` nebo `polyglossia`.

---

## Co v projektu najdete

| Soubor / složka | K čemu slouží |
|---|---|
| `mprace.tex` | **vaše práce** – údaje o práci, úvodní strany, pořadí kapitol, seznamy |
| `kapitoly/` | text práce: `uvod.tex`, `teorie.tex`, `prakticka.tex`, `zaver.tex`, `prilohy.tex` |
| `Bibliografie.bib` | seznam literatury (BibTeX) |
| `images/` | obrázky (je tu logo školy) |
| `vzor.pdf` | **vzorová práce s ukázkami** – podívejte se, jak co vypadá |
| `vzor.tex`, `vzor/` | zdrojový kód vzoru; ukázky jsou ve `vzor/ukazky/` po tématech |
| `MP.sty` | styl práce – **neupravujte** |
| `latexmkrc` | nastavení překladu (vynucuje XeLaTeX) |
| `Makefile`, `make.bat` | překlad z příkazové řádky (Linux/macOS, Windows) |

Pod nadpisem každé ukázky ve `vzor.pdf` je šedě uvedeno, ve kterém souboru
najdete její zdrojový kód (např. *Zdroj ukázky: vzor/ukazky/matematika.tex*).
Kód si zkopírujte do své kapitoly a upravte.

---

## Jak začít – vyberte si, kde budete psát

### A) Overleaf (v prohlížeči, nic neinstalujete)

1. Stáhněte si **`MaturitniPrace-overleaf.zip`** (najdete ho v sekci *Releases*
   tohoto repozitáře, případně ho dostanete od vyučujícího).
2. Na [overleaf.com](https://www.overleaf.com) zvolte **New Project → Upload Project**
   a nahrajte ZIP (nerozbalujte ho).
3. Otevřete **Menu** (vlevo nahoře) a nastavte:
   - **Compiler: XeLaTeX**
   - **Main document: `mprace.tex`**
4. Klikněte na **Recompile**.
5. Projekt si přejmenujte na `prijmeni_jmeno_trida`.

Tipy pro Overleaf:
- `vzor.pdf` otevřete kliknutím ve stromu souborů. **Vzor na Overleafu nepřekládejte** –
  je velký a v bezplatné verzi by se nemusel stihnout přeložit (limit 10 s).
- Když se vaše práce rozroste a překlad začne trvat dlouho, použijte v `mprace.tex`
  řádek `\includeonly{kapitoly/...}` – přeloží se jen kapitola, na které pracujete
  (ostatní v PDF dočasně chybí, čísla stran a odkazy zůstanou správně).
  Před odevzdáním řádek znovu zakomentujte.
- Velké fotografie před nahráním zmenšete (stačí šířka 1500–2000 px).

### B) GitHub Codespaces (VS Code v prohlížeči)

1. Vytvořte si vlastní kopii repozitáře (**Fork**).
2. Ve své kopii zvolte **Code → Codespaces → Create codespace**.
   První spuštění trvá kolem 15 minut (instaluje se celý TeX Live), další už jsou okamžitá.
3. Otevřete `mprace.tex` a přeložte zkratkou **Ctrl+Alt+B** (nebo v terminálu `make`).
   PDF se otevře v nové záložce.

### C) Vlastní počítač

1. Nainstalujte TeX:
   - **Windows:** [MiKTeX](https://miktex.org/download) nebo [TeX Live](https://tug.org/texlive/),
     případně Linux ve [WSL](https://learn.microsoft.com/cs-cz/windows/wsl/install)
   - **macOS:** [MacTeX](https://tug.org/mactex/)
   - **Linux (Ubuntu/Debian, WSL):** `make install`, nebo ručně:
     ```
     sudo apt install texlive-xetex texlive-lang-czechslovak texlive-science \
                      texlive-fonts-extra texlive-fonts-recommended \
                      texlive-latex-extra texlive-bibtex-extra latexmk
     ```
2. Nainstalujte [Visual Studio Code](https://code.visualstudio.com/) a rozšíření
   [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
   (VS Code ho nabídne sám při otevření složky).
3. Otevřete složku projektu, otevřete `mprace.tex` a přeložte zkratkou **Ctrl+Alt+B**.

Z příkazové řádky:

| | Linux / macOS / WSL | Windows (cmd) |
|---|---|---|
| přeložit práci | `make` | `make.bat` |
| přeložit vzor | `make vzor` | `make.bat vzor` |
| smazat pomocné soubory | `make clean` | `make.bat clean` |

**Jiný editor** (TeXstudio, TeXmaker, TeXworks): nastavte překlad
**XeLaTeX → BibTeX → XeLaTeX → XeLaTeX**. V TeXmakeru: *Volby → Nastavit TeXmaker →
Rychlý překlad → XeLaTeX + Bib(la)tex + XeLaTeX (x2) + Zobrazit PDF*.

---

## Jak psát práci

1. **Vyplňte údaje o práci** v záhlaví `mprace.tex`: `\author`, `\title`, `\date`,
   `\vedouci`, `\skolnirok`. Upravte prohlášení (včetně věty o použití umělé
   inteligence), abstrakt, klíčová slova a poděkování.
2. **Pište do souborů ve složce `kapitoly/`.** Každý soubor má na začátku
   komentář, co do něj patří, a odkaz na odpovídající ukázky ve vzoru.
   - Další kapitolu přidáte příkazem `\chapter{...}` v `teorie.tex` nebo `prakticka.tex`.
   - Chcete-li kapitolu v samostatném souboru, vytvořte např. `kapitoly/mereni.tex`
     a v `mprace.tex` přidejte řádek `\include{kapitoly/mereni}`.
   - Názvy částí `\part{Teoretická část}` a `\part{Praktická část}` v `mprace.tex`
     přejmenujte podle obsahu práce.
3. **Obrázky** nahrávejte do složky `images/`. Potřebujete-li diagramy (`tikz`) nebo
   chemické vzorce (`mhchem`), odkomentujte v záhlaví `mprace.tex` připravený řádek –
   šablona je kvůli rychlosti překladu nenačítá automaticky.
4. **Literaturu** zapisujte do `Bibliografie.bib`. Do seznamu literatury se dostane
   jen to, co v textu opravdu citujete (`\cite`, `\parencite`, `\footcite`).
5. **Seznamy** (literatura, obrázky, tabulky) se vytvářejí automaticky.
   Seznam, který nepotřebujete (např. nemáte tabulky), v `mprace.tex` smažte.
   Seznam výpisů programů zapnete odkomentováním `\lstlistoflistings`.
6. **Přílohy** pište do `kapitoly/prilohy.tex`. Nemáte-li přílohy, smažte
   v `mprace.tex` celé prostředí `appendices`.

### Seznam zkratek (nepovinný)

Šablona seznam zkratek neobsahuje – je nepovinný a automatický seznam
prodlužuje překlad. Potřebujete-li ho (práce s mnoha odbornými zkratkami):

- **Ručně (doporučeno):** v `mprace.tex` vložte mezi `\printbibliography`
  a `\listoffigures` kapitolu se seznamem – viz ukázka `vzor/ukazky/zkratky.tex`.
- **Automaticky (balíček `glossaries`):**
  1. do `mprace.tex` za `\addbibresource{...}` přidejte
     ```latex
     \usepackage[toc]{glossaries}
     \makenoidxglossaries
     \loadglsentries{Zkratky}
     ```
  2. vytvořte soubor `Zkratky.tex` se zkratkami, např.
     `\newglossaryentry{pwm}{name={PWM},description={pulzně šířková modulace}}`
  3. v textu pište `\gls{pwm}` (do seznamu se dostanou jen použité zkratky)
  4. mezi `\printbibliography` a `\listoffigures` přidejte
     `\printnoidxglossary[title={Seznam zkratek}]`

---

## Příkazy šablony
- `\mytitlepage` – vytvoří titulní stranu z údajů o práci
- `\prohlaseni{text}` – stránka s prohlášením
- `\abstrakt{text}{klíčová slova}` – stránka s abstraktem a klíčovými slovy
  (klíčová slova jsou 2. parametrem, oddělená čárkami)
- `\podekovani{text}` – stránka s poděkováním

## Tahák LaTeXu
- `\part` = části (teoretická a praktická)
- `\chapter` = kapitoly
- `\section` = podkapitoly
- `\subsection` = oddíly

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
- Jednotky SI: `\SI{9.81}{\meter\per\second\squared}` (balíček `siunitx`; od verze 3 je doporučený zápis `\qty{...}{...}`, viz `vzor/ukazky/jednotky.tex`)

- Seznam začínáte `\begin{itemize}` (resp. `\begin{enumerate}` pro číslovaný)
- Před každý prvek seznamu píšete `\item`
- Seznam končíte `\end{itemize}` (resp. `\end{enumerate}` pro číslovaný)

- Poznámku pod čarou vytvoříte jako `\footnote{Nezapomeňte na velké písmeno na začátku a tečku na konci.}`
- Citaci jako `\cite[text před (jako třeba viz), nepovinné][text za, třeba strana (např.: s. 50) nepovinné]{klíč zdroje}`
- Citaci pod čarou pak stejně jako citaci, akorát příkazem `\footcite`
- Citaci v závorkách stejně jako citaci, akorát příkazem `\parencite`

- Obrázek vkládáme příkazem `\includegraphics` uvnitř prostředí `figure`, odkaz: `\ref{fig:nazev}`
  - Obtékání textu: `\begin{wrapfigure}{r}{0.4\linewidth} ... \end{wrapfigure}`
  - Dva obrázky vedle sebe: prostředí `subfigure` (balíček `subcaption`)

- Tabulku vkládáme uvnitř prostředí `table`, odkaz: `\ref{tab:nazev}`
  - Profesionální styl s balíčkem `booktabs`: `\toprule`, `\midrule`, `\bottomrule`
  - Generátor tabulek: http://www.tablesgenerator.com/

- České [uvozovky](https://blog.inpage.cz/inpage/7-typografickych-hrichu-2-uvozovky-a-zavorky/) sázíme pomocí `\uv{text}`. Potom parametr *text* vysází v českých uvozovkách jako „text“.

- Chemické vzorce (balíček `mhchem` – v `mprace.tex` odkomentujte jeho řádek): `\ce{H2O}`, `\ce{2H2 + O2 -> 2H2O}`, `\ce{N2 + 3H2 <=> 2NH3}`

- Vektorové diagramy (balíček `tikz` – v `mprace.tex` odkomentujte jeho řádek): prostředí `\begin{tikzpicture} ... \end{tikzpicture}`

---

## Pro správce šablony

- `make vzor` – přeloží `vzor.tex`; **`vzor.pdf` se verzuje** (je součástí ZIPu),
  po změně ukázek ho přeložte a commitněte.
- `make check` – ověří, že kostra `vzor.tex` odpovídá `mprace.tex`
  (pořadí `\include`, `\part`, seznamů, příloh…). Při změně kostry upravte oba soubory.
- `make zip` – spustí kontrolu, přeloží vzor a vytvoří `MaturitniPrace-overleaf.zip`
  z verzovaných souborů (bez README, Makefile, `.vscode` apod.).
- Každá ukázka je jen jednou – ve `vzor/ukazky/`. Kapitoly v `kapitoly/` obsahují
  jen osnovu a odkazy na ukázky.
- `scripts/generate_mandelbrot.py` vygeneruje `vzor/obrazky/mandelbrot.png`.
