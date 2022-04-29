import os, sys
from fontTools.ttLib import TTFont

fontPath = sys.argv[1]
new_version = sys.argv[2]
font = TTFont(fontPath)
font['head'].fontRevision = float(new_version)
font.save(fontPath)