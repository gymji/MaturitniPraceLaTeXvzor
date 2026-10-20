# Nastavení latexmk pro šablonu maturitní práce.
#
# Šablona se překládá XeLaTeXem. Díky tomuto souboru:
#  - stačí lokálně spustit "latexmk mprace" (bez dalších přepínačů),
#  - XeLaTeX se použije i tam, kde je nastaven pdfLaTeX (např. Overleaf):
#    místo programu pdflatex se zavolá xelatex.
$pdf_mode = 1;
$pdflatex = 'xelatex %O %S';
