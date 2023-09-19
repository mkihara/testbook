#!/bin/bash

mainTexFile="book.tex"

rm -rf _build/

jb build . --builder latex

cd _build/latex

### set font size
sed -i -s "s/,10pt,/,12pt,/" $mainTexFile

### set japanese font
sed -i -s "s/setmainfont{.*}\[/usepackage{xltxtra} \n\\\setmainfont{IPAPMincho}/" $mainTexFile
sed -i -s "s/setsansfont{.*}\[/setsansfont{IPAPGothic}/" $mainTexFile
sed -i -s "s/setmonofont{.*}\[/setmonofont{IPAGothic}\n\\\XeTeXlinebreaklocale \"ja\"/" $mainTexFile
sed -i -s "s/^  Extension      = .*//" $mainTexFile
sed -i -s "s/^  UprightFont    = .*//" $mainTexFile
sed -i -s "s/^  ItalicFont     = .*//" $mainTexFile
sed -i -s "s/^  BoldFont       = .*//" $mainTexFile
sed -i -s "s/^  BoldItalicFont = .*//" $mainTexFile
sed -i -s "s/^]//" $mainTexFile

make