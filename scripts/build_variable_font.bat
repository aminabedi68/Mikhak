echo off
echo ===== Mikhak-V3.4 Variable font build =====
echo.
echo Generating Dot Style forms:
echo ===========================
fontforge -script DSGenerator.py Mikhak Thin DS1
fontforge -script DSGenerator.py Mikhak Thin DS2
fontforge -script DSGenerator.py Mikhak Black DS1
fontforge -script DSGenerator.py Mikhak Black DS2
echo Done!
echo Generating Kashida masters:
echo ===========================
fontforge -script KashidaGenerator.py Mikhak-Black.sfd Mikhak Black
fontforge -script KashidaGenerator.py Mikhak-Thin.sfd Mikhak Thin
fontforge -script KashidaGenerator.py Mikhak-DS1-Black.sfd Mikhak-DS1 Black
fontforge -script KashidaGenerator.py Mikhak-DS1-Thin.sfd Mikhak-DS1 Thin
fontforge -script KashidaGenerator.py Mikhak-DS2-Black.sfd Mikhak-DS2 Black
fontforge -script KashidaGenerator.py Mikhak-DS2-Thin.sfd Mikhak-DS2 Thin
echo Done!
echo.
echo Modifications of Kashida masters:
echo ================================================
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-KThin.sfd
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-DS1-KThin.sfd
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-DS2-KThin.sfd
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-KBlack.sfd
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-DS1-KBlack.sfd
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-DS2-KBlack.sfd
echo Done!
echo.
echo SFD to UFO Convertion:
echo ======================
fontforge -script sfd2ufo.py
echo Done!
echo.
echo writing GASP data to the generated UFOs:
echo ========================================
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
echo Done!
echo.
echo check_and_add_guideline_to_ufo(fontforge issue #4951):
echo ======================================================
python check_and_add_guideline_to_ufo.py .\Mikhak-Thin.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-KThin.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-DS1-Thin.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-DS1-KThin.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-DS2-Thin.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-DS2-KThin.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-Black.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-KBlack.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-DS1-Black.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-DS1-KBlack.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-DS2-Black.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-DS2-KBlack.ufo
echo Done!
echo.
echo Generating variable font:
echo =========================
fontmake -o variable -m Mikhak.designspace
echo Done!
echo.
echo set fsselection bit:
echo ====================
python fsselection.py variable_ttf\Mikhak-VF.ttf variable_ttf\Mikhak-VF.ttf
echo Done!
echo.
echo Modify Name Records and fontRevision:
REM Name Records:(Args: <font-path> <string> <nameID> <platformID> <platEncID> <langID>)
echo =====================================
python modify-name-records.py variable_ttf\Mikhak-VF.ttf "Mikhak VF" 1 3 1 0x409
python modify-name-records.py variable_ttf\Mikhak-VF.ttf 3.4;amin;Mikhak-VF 3 3 1 0x409
python modify-name-records.py variable_ttf\Mikhak-VF.ttf "Mikhak VF" 4 3 1 0x409
python modify-name-records.py variable_ttf\Mikhak-VF.ttf Mikhak-VF 6 3 1 0x409
python modify-name-records.py variable_ttf\Mikhak-VF.ttf "Version 3.4" 5 3 1 0x409
python modify-fontRevision.py variable_ttf\Mikhak-VF.ttf 3.4
echo Done!
echo.
echo add meta/prep:
echo ===================
CMD /c ttx -m variable_ttf\Mikhak-VF.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak[DSTY,KSHD,wght].ttf \variable_ttf
echo Done!
echo.
echo Delete Junk Files:
echo ==================
CMD /c delete_junk_files.bat
echo Done!
echo.
echo All Done!
echo.
pause