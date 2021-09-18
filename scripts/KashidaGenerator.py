import sys
import os
import fontforge

Myfont = fontforge.open(sys.argv[1])
FontName = str(sys.argv[2])
FontWeight = str(sys.argv[3])
FontStyle = "K" + FontWeight
Myfont.fontname = FontName + "-" + FontStyle
Myfont.familyname = FontName + " " + FontStyle
Myfont.fullname = FontName + " " + FontStyle
for glyph in Myfont.glyphs():
 if glyph.color == 0x00ffff :
  glyph.setLayer(glyph.layers['Back'], 'Fore')
  GRSB = glyph.right_side_bearing 
  GRSB = int(GRSB)
  GRSB = GRSB + 2048
  glyph.right_side_bearing = GRSB
Myfont.save(FontName + "-" + FontStyle + ".sfd")