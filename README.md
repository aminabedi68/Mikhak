# Mikhak
Mikhak is a simple monoline semi handwriting Arabic-Latin typeface in <a href="https://aminabedi68.github.io/Mikhak/">9 weights</a> and a <a href="https://aminabedi68.github.io/Mikhak/VF.html">variable</a> version. Licensed under SIL open font License V1.1

## Weights and Axes
Mikhak has 9 Weights and 3 Axes:
<br>
### Weights:
9 Standard weights, 100-Thin to 900-Black
<br>
### Axes:
Weight[wght]:100-900
<br>Kashida[KSHD]:100-200
<br>Dot Styles[DSTY]:1.0-3.0

## Build(Windows):
### requirements:
<br>1-installed <a href="https://github.com/fontforge/fontforge">fontforge</a> with path access in environment variables
<br>2-installed <a href="https://www.python.org/">python</a> and <a href="https://github.com/googlefonts/fontmake">fontmake</a>
### build:
move script folder contents to sources folder and run build.bat
<br>(build process has 2 issues: one of them related to this [issue](https://github.com/googlefonts/fontmake/issues/794) and naming table, to fix that you need to use [Slice](https://github.com/source-foundry/Slice) app with the same output and refined names; the secound one is building the FD version, it's easier to do that manually!)
## Install

#### Linux
gnu/inux users could use [kateb](https://github.com/kiamazi/kateb) font manager, to install Mikhak font.

ubuntu users must install this dependensies too:
```
sudo apt install openssl libssl-dev
````

##### install kateb
```
sudo cpan kateb

kateb install mikhak
or
kateb update mikhak
```
