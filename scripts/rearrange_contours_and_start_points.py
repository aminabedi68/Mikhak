import os
import fontforge
import sys

font = fontforge.open(sys.argv[1])
for glyph in font.glyphs() :
 if glyph.color == 0xff00ff :
  glyph.canonicalContours()
  glyph.canonicalStart()
font.save()