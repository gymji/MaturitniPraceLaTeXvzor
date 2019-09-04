# Maturitní seminární práce

## Instalace (La)TeXu
- Instalujte si MikTeX (spravuje knihovny TeXu): https://miktex.org/download
- Instalujte si TeXový editor TeXmarker: https://www.xm1math.net/texmaker/download.html
- Otevřete TeXmarker a můžete pracovat

## Dokumenty:
- README.md = tento soubor (nepotřebujete)
- .gitignore = co má git ignorovat (nepotřebujete)
- LICENSE = pod jakou licencí je to publikováno (nepotřebujete)
  - u tohoto je to zjednodšeně: Dělejte si s tím cokoliv, jen to šiřte pod stejnou licencí
- SP.sty = nastavení (potřebujete, ale neupravujete) 
- VzorSP.tex = vzorový soubor (takto má vypadat váš kód, klidně ho stáhněte, přejmenujte a upravte)
- images = složka na obrázky (potřebujete kvůli logu, ale obrázky klidně mohou být v základní složce)

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
- Tučné písmo je `\textbf{nebo zkratkou ctrl+b}`
- Italika jako taková je `\textit{nebo zkratkou ctrl+i}`

- Odstavce se oddělují prázdným řádkem (nebo příkazem `\par`, pokud si to chcete někde vynutit)                                                 
- Nový řádek vytvoříte příkazem `\\` (pozor, konce řádků v tom, co píšete, TeX ignoruje)

- Matematické vzorce se píší jako `$$ 1 + 1 = 3 $$` (popřípadě `$ 1 + 1 = 4 $` v rámci textu, ale to nedoporučuji)
  -Případně jako `\begin{equation} 1 + 1 = 5 \end{equation}`, pokud je chcete mít číslované 
- V matematických vzorcích se závorky píší `\left(` `\right)` resp. `\left\{` `\right\}`, aby se přizpůsobily velikosti vzorce uvnitř (`\` je escapovací znak)
- Po čárce (oddělující prvky) píšete mezeru příkazem `\,`, stejně jako oddělujete trojice číslic `666\,666,666\,666` (číslo 666 666,666 666)
- Zlomky jsou následovně `\frac{čitatel}{jmenovatel}`
- Matematické symboly jsou na stránce https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols

- Seznam začínáte `\begin{itemize}` (resp. `\begin{enumerate}` pro číslovaný)
- Před každý prvek seznamu píšete `\item`                                  
- Seznam končíte `\end{itemize}` (resp. `\end{enumerate}` pro číslovaný)




