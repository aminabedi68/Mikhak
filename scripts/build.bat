echo off
REM Generating Variable Version:
cmd /c build_variable_font.bat
REM Generating Static Versions:
cmd /c build_instances.bat
REM Generating Farsi Digits instead of Latin Versions:
cmd /c FD-Generator.bat
REM Generating woff2 Formats:
cmd /c ttf2woff2.bat
REM Deleting junk files (UFOs,folders,secondary msters...):
cmd /c delete_junk_files.bat
exit