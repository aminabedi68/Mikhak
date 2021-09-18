@echo off
REM Generating Farsi Digit versions:
fontforge -script FD-Generator.py .\instance_ttf
exit