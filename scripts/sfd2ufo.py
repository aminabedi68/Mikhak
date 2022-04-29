import os
import fontforge

glyphs_to_unlink = ["Thorn","exclamdown","questiondown","quotedblbase","quotedblright","quoteright","quotesinglbase","uni0657","uni066C","uni0686","uni06D6","uni06D7","uni06D8","uni06E1","uniE029","uniE02A","uniFB7B","uni0660.EoA","uni0661.EoA","uni0662.EoA","uni0663.EoA","uni0664.EoA","uni0665.EoA","uni0666.EoA","uni0667.EoA","uni0668.EoA","uni0669.EoA","uni06F4.EoA","uni06F5.EoA","uni06F6.EoA","uni06DB"]

for file in os.listdir():
 if file.endswith(".sfd"):
  font = fontforge.open(file)
  for glyph in font.glyphs():
   if glyph.glyphname in glyphs_to_unlink:
    font.selection.select(glyph.glyphname) 
    glyph.unlinkRef()
    glyph.round()
  font.generate(os.path.splitext(file)[0]+".ufo")