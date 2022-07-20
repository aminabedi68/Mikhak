import os
import sys
import fontforge

FName = str(sys.argv[1])
FWeight = str(sys.argv[2])
DS = str(sys.argv[3])

font = fontforge.open(FName + "-" + FWeight + ".sfd")
dsfont = fontforge.open("M-dots.sfd")
DGlyphs = []
DSGlyphs = []

if DS == "DS1" and FWeight == "Thin" :
 DGlyphs = ["uniE000","uniE001","uniE002","uniE003"]
 DSGlyphs = ["uniE000","uniE001","uniE002","uniE003"]
elif DS == "DS1" and FWeight == "Black" :
 DGlyphs = ["uniE010","uniE011","uniE012","uniE013"]
 DSGlyphs = ["uniE000","uniE001","uniE002","uniE003"]
elif DS == "DS2" and FWeight == "Thin" :
 DGlyphs = ["uniE020","uniE021","uniE022","uniE023"]
 DSGlyphs = ["uniE000","uniE001","uniE002","uniE003"]
elif DS == "DS2" and FWeight == "Black" :
 DGlyphs = ["uniE030","uniE031","uniE032","uniE033"]
 DSGlyphs = ["uniE000","uniE001","uniE002","uniE003"]

for g in DGlyphs:
 dsfont.selection.select(("more",None),g)
 
dsfont.copy()

for G in DSGlyphs:
 font.selection.select(("more",None),G)
 
font.paste()

font.fontname = FName + "-" + DS + "-" + FWeight
font.familyname = FName + "-" + DS + " " + FWeight
font.fullname = FName + "-" + DS + " " + FWeight
PreferredFamily = FName + "-" + DS
font.appendSFNTName('English (US)' , 'Preferred Family' , PreferredFamily)
font.save(FName + "-" + DS + "-" + FWeight + ".sfd")