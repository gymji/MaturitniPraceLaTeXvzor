@echo off
rem Preklad sablony maturitni prace ve Windows (MiKTeX nebo TeX Live).
rem   make.bat          prelozi mprace.tex -> mprace.pdf (vase prace)
rem   make.bat vzor     prelozi vzor.tex   -> vzor.pdf   (vzor s ukazkami)
rem   make.bat clean    smaze pomocne soubory prekladu
rem Volame primo xelatex a bibtex (latexmk by na MiKTeXu potreboval Perl).
setlocal
set DOC=mprace
if /I "%~1"=="vzor" set DOC=vzor
if /I "%~1"=="clean" goto clean

xelatex -interaction=nonstopmode %DOC% || goto chyba
bibtex %DOC%
xelatex -interaction=nonstopmode %DOC% || goto chyba
xelatex -interaction=nonstopmode %DOC% || goto chyba
echo Hotovo: %DOC%.pdf
goto :eof

:chyba
echo Preklad selhal - podivejte se do souboru %DOC%.log
exit /b 1

:clean
for %%D in (mprace vzor) do (
    for %%E in (aux bbl blg bcf fdb_latexmk fls glg glo gls ist lof log lol lot out run.xml toc xdv synctex.gz) do (
        if exist %%D.%%E del %%D.%%E
    )
    if exist %%D-blx.bib del %%D-blx.bib
)
del /q kapitoly\*.aux vzor\kapitoly\*.aux 2>nul
goto :eof
