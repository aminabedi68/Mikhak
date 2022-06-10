echo off
echo ===== Mikhak-V3.3 Variable font build(googlefonts version) =====
echo.
REM echo Generating Dot Style forms:
REM echo ===========================
REM fontforge -script DSGenerator.py Mikhak Thin DS1
REM fontforge -script DSGenerator.py Mikhak Thin DS2
REM fontforge -script DSGenerator.py Mikhak Black DS1
REM fontforge -script DSGenerator.py Mikhak Black DS2
REM echo Done!
echo Generating Kashida masters:
echo ===========================
fontforge -script KashidaGenerator.py Mikhak-Black.sfd Mikhak Black
fontforge -script KashidaGenerator.py Mikhak-Thin.sfd Mikhak Thin
REM fontforge -script KashidaGenerator.py Mikhak-DS1-Black.sfd Mikhak-DS1 Black
REM fontforge -script KashidaGenerator.py Mikhak-DS1-Thin.sfd Mikhak-DS1 Thin
REM fontforge -script KashidaGenerator.py Mikhak-DS2-Black.sfd Mikhak-DS2 Black
REM fontforge -script KashidaGenerator.py Mikhak-DS2-Thin.sfd Mikhak-DS2 Thin
echo Done!
echo.
echo Modifications of Kashida masters:
echo ================================================
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-KThin.sfd
REM fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-DS1-KThin.sfd
REM fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-DS2-KThin.sfd
fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-KBlack.sfd
REM fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-DS1-KBlack.sfd
REM fontforge -lang=ff -script some_correction_after_kashida.pe Mikhak-DS2-KBlack.sfd
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
REM python save_gasp_to_ufo_files.py .\Mikhak-DS1-Thin.ufo
REM python save_gasp_to_ufo_files.py .\Mikhak-DS1-KThin.ufo
REM python save_gasp_to_ufo_files.py .\Mikhak-DS2-Thin.ufo
REM python save_gasp_to_ufo_files.py .\Mikhak-DS2-KThin.ufo
python save_gasp_to_ufo_files.py .\Mikhak-Black.ufo
python save_gasp_to_ufo_files.py .\Mikhak-KBlack.ufo
REM python save_gasp_to_ufo_files.py .\Mikhak-DS1-Black.ufo
REM python save_gasp_to_ufo_files.py .\Mikhak-DS1-KBlack.ufo
REM python save_gasp_to_ufo_files.py .\Mikhak-DS2-Black.ufo
REM python save_gasp_to_ufo_files.py .\Mikhak-DS2-KBlack.ufo
echo Done!
echo.
echo check_and_add_guideline_to_ufo(fontforge issue #4951):
echo ======================================================
python check_and_add_guideline_to_ufo.py .\Mikhak-Thin.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-KThin.ufo
REM python check_and_add_guideline_to_ufo.py .\Mikhak-DS1-Thin.ufo
REM python check_and_add_guideline_to_ufo.py .\Mikhak-DS1-KThin.ufo
REM python check_and_add_guideline_to_ufo.py .\Mikhak-DS2-Thin.ufo
REM python check_and_add_guideline_to_ufo.py .\Mikhak-DS2-KThin.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-Black.ufo
python check_and_add_guideline_to_ufo.py .\Mikhak-KBlack.ufo
REM python check_and_add_guideline_to_ufo.py .\Mikhak-DS1-Black.ufo
REM python check_and_add_guideline_to_ufo.py .\Mikhak-DS1-KBlack.ufo
REM python check_and_add_guideline_to_ufo.py .\Mikhak-DS2-Black.ufo
REM python check_and_add_guideline_to_ufo.py .\Mikhak-DS2-KBlack.ufo
echo Done!
echo.
echo Generating variable font:
echo =========================
fontmake -o variable -m Mikhak(googlefonts).designspace
echo Done!
echo.
echo set fsselection bit:
echo ====================
python fsselection.py variable_ttf\Mikhak(googlefonts)-VF.ttf variable_ttf\Mikhak(googlefonts)-VF.ttf
echo Done!
echo.
echo Modify Name Records and fontRevision:
REM Name Records:(Args: <font-path> <string> <nameID> <platformID> <platEncID> <langID>)
echo =====================================
python modify-name-records.py variable_ttf\Mikhak(googlefonts)-VF.ttf "Mikhak VF" 1 3 1 0x409
python modify-name-records.py variable_ttf\Mikhak(googlefonts)-VF.ttf 3.3;amin;Mikhak-VF 3 3 1 0x409
python modify-name-records.py variable_ttf\Mikhak(googlefonts)-VF.ttf "Mikhak VF" 4 3 1 0x409
python modify-name-records.py variable_ttf\Mikhak(googlefonts)-VF.ttf Mikhak-VF 6 3 1 0x409
python modify-name-records.py variable_ttf\Mikhak(googlefonts)-VF.ttf "Version 3.3" 5 3 1 0x409
python modify-fontRevision.py variable_ttf\Mikhak(googlefonts)-VF.ttf 3.3
echo Done!
echo.
echo add meta/prep/avar:
echo ===================
CMD /c ttx -m variable_ttf\Mikhak(googlefonts)-VF.ttf meta-prep-avar(googlefonts).ttx
python rename_move.py \meta-prep-avar(googlefonts).ttf \Mikhak[KSHD,wght].ttf \variable_ttf
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