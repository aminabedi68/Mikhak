@echo off
REM Generating Dot Style forms:
fontforge -script DSGenerator.py Mikhak Thin DS1
fontforge -script DSGenerator.py Mikhak Thin DS2
fontforge -script DSGenerator.py Mikhak Black DS1
fontforge -script DSGenerator.py Mikhak Black DS2
REM Generating Kashida forms:
fontforge -script KashidaGenerator.py Mikhak-Black.sfd Mikhak Black
fontforge -script KashidaGenerator.py Mikhak-Thin.sfd Mikhak Thin
fontforge -script KashidaGenerator.py Mikhak-DS1-Black.sfd Mikhak-DS1 Black
fontforge -script KashidaGenerator.py Mikhak-DS1-Thin.sfd Mikhak-DS1 Thin
fontforge -script KashidaGenerator.py Mikhak-DS2-Black.sfd Mikhak-DS2 Black
fontforge -script KashidaGenerator.py Mikhak-DS2-Thin.sfd Mikhak-DS2 Thin
REM Correct some glyphs after kashida forms generation:
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-KThin.sfd
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-DS1-KThin.sfd
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-DS2-KThin.sfd
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-KBlack.sfd
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-DS1-KBlack.sfd
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-DS2-KBlack.sfd
REM Convert SFD to UFO:
fontforge -script sfd2ufo.py
REM writing GASP data on generated UFOs:
python save_gasp_to_ufo_files.py .\Mikhak-Thin.ufo
python save_gasp_to_ufo_files.py .\Mikhak-KThin.ufo
python save_gasp_to_ufo_files.py .\Mikhak-DS1-Thin.ufo
python save_gasp_to_ufo_files.py .\Mikhak-DS1-KThin.ufo
python save_gasp_to_ufo_files.py .\Mikhak-DS2-Thin.ufo
python save_gasp_to_ufo_files.py .\Mikhak-DS2-KThin.ufo
python save_gasp_to_ufo_files.py .\Mikhak-Black.ufo
python save_gasp_to_ufo_files.py .\Mikhak-KBlack.ufo
python save_gasp_to_ufo_files.py .\Mikhak-DS1-Black.ufo
python save_gasp_to_ufo_files.py .\Mikhak-DS1-KBlack.ufo
python save_gasp_to_ufo_files.py .\Mikhak-DS2-Black.ufo
python save_gasp_to_ufo_files.py .\Mikhak-DS2-KBlack.ufo
REM convert all sfd to ttf and move to master_ttf folder:
fontforge -script sfd2ttf2master_ttfFolder.py
REM make instances:
fontmake --interpolate-binary-layout --round-instances -o ttf -m Mikhak.designspace -i
REM remove overlaps from dot glyphs:
fontforge -script round_to_int.py
REM refresh all ttf files:
fontforge -script refresh_ttf.py
exit

