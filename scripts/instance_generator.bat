@echo off
REM convert all sfd to ttf and move to master_ttf folder:
fontforge -script sfd2ttf2master_ttfFolder.py
REM make instances:
fontmake --interpolate-binary-layout --round-instances -o ttf -m Mikhak.designspace -i
REM remove overlaps from dot glyphs:
fontforge -script round_to_int.py
REM refresh all ttf files:
fontforge -script refresh_ttf.py
exit

