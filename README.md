# Mikhak
![sample](https://user-images.githubusercontent.com/25493297/165905841-1831a67b-7299-41a0-88d1-6352bd454d4a.png)
Mikhak(means Clove in Farsi) is a simple semi-handwriting Arabic-Latin sans typeface in <a href="https://aminabedi68.github.io/Mikhak/">9 weights</a>(with same width in all weights) and a <a href="https://aminabedi68.github.io/Mikhak/VF.html">variable</a> version. Mikhak has 3 Arabic Dot styles. variable font has 3 axes: wght(weight): 9 weights from thin to black with round cap and low contrast in both low/high weight masters, and high saturation thickness in black master. KSHD(Arabic Kashida): simple Arabic Kashida which increases the connection length of Arabic medial and final letter forms. DSTY(dot style): switch style of Arabic dotted letters to separated and Line Double dots. The design of the type is round in caps and joints, smooth, low contrast,legible, friendly and optimized to web-like environments.this typeface is designed inside fontforge(in two thin and black masters). variable font and static instances build with fontmake and help of python scripts(fontforge python api and fonttools). The whole project is licensed to be free under open font licence v1.1.
## Weights and Axes
Mikhak has 9 Weights and 3 Axes:
<br>
### Weights:
9 Standard weights, 100-Thin to 900-Black
<br>
### Axes:
Weight[wght]:100-900
<br>Kashida[KSHD]:100-200
<br>Dot Styles[DSTY]:0.0-2.9(0-0.999 mapped to normal dots, 1.000 to 1.999 mapped to DS1 and 2 to 2.9 mapped to DS2)

![designspace](https://user-images.githubusercontent.com/25493297/166118285-cd8ff921-5b9e-42d8-9e36-b389f1ef4265.png)

## Build(Windows):
### requirements:
1-installed <a href="https://github.com/fontforge/fontforge">fontforge</a> with path access in environment variables
<br>2-installed <a href="https://www.python.org/">python</a> and <a href="https://github.com/googlefonts/fontmake">fontmake</a>
### build:
move script folder contents to sources folder and run build.bat
<br>(building of the VF-FD version is manual)
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
<br>
<br>
