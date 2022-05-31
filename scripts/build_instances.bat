echo off
echo ===== Mikhak-V3.3 Typeface Static fonts build =====
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
echo convert all sfd to ttf and move to master_ttf folder:
echo =====================================================
fontforge -script sfd2ttf2master_ttfFolder.py
echo Done!
echo.
echo Interpolate instances:
echo ======================
fontmake --interpolate-binary-layout --round-instances -o ttf -m Mikhak.designspace -i
echo round outline coordinates of all glyphs to integer values:
echo ==========================================================
fontforge -script round_to_int.py
echo Done!
echo.
echo refresh all ttf files:
echo ======================
fontforge -script refresh_ttf.py
echo Done!
echo.
echo set fsselection bit, fontRevision, version and unique ID modification:
echo =======================================================================
python fsselection.py instance_ttf\Mikhak-Thin.ttf instance_ttf\Mikhak-Thin.ttf
python modify-name-records.py instance_ttf\Mikhak-Thin.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-Thin.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-Thin.ttf 3.3;amin;Mikhak-Thin 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-Thin.ttf 3.3;amin;Mikhak-Thin 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-Thin.ttf 3.3
python fsselection.py instance_ttf\Mikhak-ExtraLight.ttf instance_ttf\Mikhak-ExtraLight.ttf
python modify-name-records.py instance_ttf\Mikhak-ExtraLight.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-ExtraLight.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-ExtraLight.ttf 3.3;amin;Mikhak-ExtraLight 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-ExtraLight.ttf 3.3;amin;Mikhak-ExtraLight 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-ExtraLight.ttf 3.3
python fsselection.py instance_ttf\Mikhak-Light.ttf instance_ttf\Mikhak-Light.ttf
python modify-name-records.py instance_ttf\Mikhak-Light.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-Light.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-Light.ttf 3.3;amin;Mikhak-Light 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-Light.ttf 3.3;amin;Mikhak-Light 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-Light.ttf 3.3
python fsselection.py instance_ttf\Mikhak-Regular.ttf instance_ttf\Mikhak-Regular.ttf
python modify-name-records.py instance_ttf\Mikhak-Regular.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-Regular.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-Regular.ttf 3.3;amin;Mikhak-Regular 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-Regular.ttf 3.3;amin;Mikhak-Regular 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-Regular.ttf 3.3
python fsselection.py instance_ttf\Mikhak-Medium.ttf instance_ttf\Mikhak-Medium.ttf
python modify-name-records.py instance_ttf\Mikhak-Medium.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-Medium.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-Medium.ttf 3.3;amin;Mikhak-Medium 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-Medium.ttf 3.3;amin;Mikhak-Medium 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-Medium.ttf 3.3
python fsselection.py instance_ttf\Mikhak-SemiBold.ttf instance_ttf\Mikhak-SemiBold.ttf
python modify-name-records.py instance_ttf\Mikhak-SemiBold.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-SemiBold.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-SemiBold.ttf 3.3;amin;Mikhak-SemiBold 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-SemiBold.ttf 3.3;amin;Mikhak-SemiBold 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-SemiBold.ttf 3.3
python fsselection.py instance_ttf\Mikhak-Bold.ttf instance_ttf\Mikhak-Bold.ttf
python modify-name-records.py instance_ttf\Mikhak-Bold.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-Bold.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-Bold.ttf 3.3;amin;Mikhak-Bold 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-Bold.ttf 3.3;amin;Mikhak-Bold 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-Bold.ttf 3.3
python fsselection.py instance_ttf\Mikhak-ExtraBold.ttf instance_ttf\Mikhak-ExtraBold.ttf
python modify-name-records.py instance_ttf\Mikhak-ExtraBold.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-ExtraBold.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-ExtraBold.ttf 3.3;amin;Mikhak-ExtraBold 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-ExtraBold.ttf 3.3;amin;Mikhak-ExtraBold 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-ExtraBold.ttf 3.3
python fsselection.py instance_ttf\Mikhak-Black.ttf instance_ttf\Mikhak-Black.ttf
python modify-name-records.py instance_ttf\Mikhak-Black.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-Black.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-Black.ttf 3.3;amin;Mikhak-Black 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-Black.ttf 3.3;amin;Mikhak-Black 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-Black.ttf 3.3
REM DS1
python fsselection.py instance_ttf\Mikhak-DS1-Thin.ttf instance_ttf\Mikhak-DS1-Thin.ttf
python modify-name-records.py instance_ttf\Mikhak-DS1-Thin.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-Thin.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS1-Thin.ttf 3.3;amin;Mikhak-DS1-Thin 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-Thin.ttf 3.3;amin;Mikhak-DS1-Thin 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS1-Thin.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS1-ExtraLight.ttf instance_ttf\Mikhak-DS1-ExtraLight.ttf
python modify-name-records.py instance_ttf\Mikhak-DS1-ExtraLight.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-ExtraLight.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS1-ExtraLight.ttf 3.3;amin;Mikhak-DS1-ExtraLight 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-ExtraLight.ttf 3.3;amin;Mikhak-DS1-ExtraLight 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS1-ExtraLight.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS1-Light.ttf instance_ttf\Mikhak-DS1-Light.ttf
python modify-name-records.py instance_ttf\Mikhak-DS1-Light.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-Light.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS1-Light.ttf 3.3;amin;Mikhak-DS1-Light 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-Light.ttf 3.3;amin;Mikhak-DS1-Light 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS1-Light.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS1-Regular.ttf instance_ttf\Mikhak-DS1-Regular.ttf
python modify-name-records.py instance_ttf\Mikhak-DS1-Regular.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-Regular.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS1-Regular.ttf 3.3;amin;Mikhak-DS1-Regular 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-Regular.ttf 3.3;amin;Mikhak-DS1-Regular 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS1-Regular.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS1-Medium.ttf instance_ttf\Mikhak-DS1-Medium.ttf
python modify-name-records.py instance_ttf\Mikhak-DS1-Medium.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-Medium.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS1-Medium.ttf 3.3;amin;Mikhak-DS1-Medium 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-Medium.ttf 3.3;amin;Mikhak-DS1-Medium 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS1-Medium.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS1-SemiBold.ttf instance_ttf\Mikhak-DS1-SemiBold.ttf
python modify-name-records.py instance_ttf\Mikhak-DS1-SemiBold.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-SemiBold.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS1-SemiBold.ttf 3.3;amin;Mikhak-DS1-SemiBold 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-SemiBold.ttf 3.3;amin;Mikhak-DS1-SemiBold 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS1-SemiBold.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS1-Bold.ttf instance_ttf\Mikhak-DS1-Bold.ttf
python modify-name-records.py instance_ttf\Mikhak-DS1-Bold.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-Bold.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS1-Bold.ttf 3.3;amin;Mikhak-DS1-Bold 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-Bold.ttf 3.3;amin;Mikhak-DS1-Bold 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS1-Bold.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS1-ExtraBold.ttf instance_ttf\Mikhak-DS1-ExtraBold.ttf
python modify-name-records.py instance_ttf\Mikhak-DS1-ExtraBold.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-ExtraBold.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS1-ExtraBold.ttf 3.3;amin;Mikhak-DS1-ExtraBold 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-ExtraBold.ttf 3.3;amin;Mikhak-DS1-ExtraBold 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS1-ExtraBold.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS1-Black.ttf instance_ttf\Mikhak-DS1-Black.ttf
python modify-name-records.py instance_ttf\Mikhak-DS1-Black.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-Black.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS1-Black.ttf 3.3;amin;Mikhak-DS1-Black 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS1-Black.ttf 3.3;amin;Mikhak-DS1-Black 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS1-Black.ttf 3.3
REM DS2
python fsselection.py instance_ttf\Mikhak-DS2-Thin.ttf instance_ttf\Mikhak-DS2-Thin.ttf
python modify-name-records.py instance_ttf\Mikhak-DS2-Thin.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-Thin.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS2-Thin.ttf 3.3;amin;Mikhak-DS2-Thin 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-Thin.ttf 3.3;amin;Mikhak-DS2-Thin 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS2-Thin.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS2-ExtraLight.ttf instance_ttf\Mikhak-DS2-ExtraLight.ttf
python modify-name-records.py instance_ttf\Mikhak-DS2-ExtraLight.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-ExtraLight.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS2-ExtraLight.ttf 3.3;amin;Mikhak-DS2-ExtraLight 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-ExtraLight.ttf 3.3;amin;Mikhak-DS2-ExtraLight 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS2-ExtraLight.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS2-Light.ttf instance_ttf\Mikhak-DS2-Light.ttf
python modify-name-records.py instance_ttf\Mikhak-DS2-Light.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-Light.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS2-Light.ttf 3.3;amin;Mikhak-DS2-Light 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-Light.ttf 3.3;amin;Mikhak-DS2-Light 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS2-Light.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS2-Regular.ttf instance_ttf\Mikhak-DS2-Regular.ttf
python modify-name-records.py instance_ttf\Mikhak-DS2-Regular.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-Regular.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS2-Regular.ttf 3.3;amin;Mikhak-DS2-Regular 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-Regular.ttf 3.3;amin;Mikhak-DS2-Regular 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS2-Regular.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS2-Medium.ttf instance_ttf\Mikhak-DS2-Medium.ttf
python modify-name-records.py instance_ttf\Mikhak-DS2-Medium.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-Medium.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS2-Medium.ttf 3.3;amin;Mikhak-DS2-Medium 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-Medium.ttf 3.3;amin;Mikhak-DS2-Medium 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS2-Medium.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS2-SemiBold.ttf instance_ttf\Mikhak-DS2-SemiBold.ttf
python modify-name-records.py instance_ttf\Mikhak-DS2-SemiBold.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-SemiBold.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS2-SemiBold.ttf 3.3;amin;Mikhak-DS2-SemiBold 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-SemiBold.ttf 3.3;amin;Mikhak-DS2-SemiBold 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS2-SemiBold.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS2-Bold.ttf instance_ttf\Mikhak-DS2-Bold.ttf
python modify-name-records.py instance_ttf\Mikhak-DS2-Bold.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-Bold.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS2-Bold.ttf 3.3;amin;Mikhak-DS2-Bold 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-Bold.ttf 3.3;amin;Mikhak-DS2-Bold 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS2-Bold.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS2-ExtraBold.ttf instance_ttf\Mikhak-DS2-ExtraBold.ttf
python modify-name-records.py instance_ttf\Mikhak-DS2-ExtraBold.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-ExtraBold.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS2-ExtraBold.ttf 3.3;amin;Mikhak-DS2-ExtraBold 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-ExtraBold.ttf 3.3;amin;Mikhak-DS2-ExtraBold 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS2-ExtraBold.ttf 3.3
python fsselection.py instance_ttf\Mikhak-DS2-Black.ttf instance_ttf\Mikhak-DS2-Black.ttf
python modify-name-records.py instance_ttf\Mikhak-DS2-Black.ttf "Version 3.3" 5 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-Black.ttf "Version 3.3" 5 1 0 0x0
python modify-name-records.py instance_ttf\Mikhak-DS2-Black.ttf 3.3;amin;Mikhak-DS2-Black 3 3 1 0x409
python modify-name-records.py instance_ttf\Mikhak-DS2-Black.ttf 3.3;amin;Mikhak-DS2-Black 3 1 0 0x0
python modify-fontRevision.py instance_ttf\Mikhak-DS2-Black.ttf 3.3
echo Done!
echo.
echo add meta/prep:
echo ===================
CMD /c ttx -m instance_ttf\Mikhak-Thin.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-Thin.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-ExtraLight.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-ExtraLight.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-Light.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-Light.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-Regular.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-Regular.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-Medium.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-Medium.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-SemiBold.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-SemiBold.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-Bold.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-Bold.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-ExtraBold.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-ExtraBold.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-Black.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-Black.ttf \instance_ttf
REM DS1
CMD /c ttx -m instance_ttf\Mikhak-DS1-Thin.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS1-Thin.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS1-ExtraLight.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS1-ExtraLight.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS1-Light.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS1-Light.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS1-Regular.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS1-Regular.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS1-Medium.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS1-Medium.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS1-SemiBold.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS1-SemiBold.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS1-Bold.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS1-Bold.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS1-ExtraBold.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS1-ExtraBold.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS1-Black.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS1-Black.ttf \instance_ttf
REM DS2
CMD /c ttx -m instance_ttf\Mikhak-DS2-Thin.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS2-Thin.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS2-ExtraLight.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS2-ExtraLight.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS2-Light.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS2-Light.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS2-Regular.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS2-Regular.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS2-Medium.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS2-Medium.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS2-SemiBold.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS2-SemiBold.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS2-Bold.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS2-Bold.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS2-ExtraBold.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS2-ExtraBold.ttf \instance_ttf
CMD /c ttx -m instance_ttf\Mikhak-DS2-Black.ttf meta-prep.ttx
python rename_move.py \meta-prep.ttf \Mikhak-DS2-Black.ttf \instance_ttf
echo Done!
echo.
echo rename instance_ttf folder to Statics:
echo ======================================
python rename_folder.py instance_ttf Statics
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