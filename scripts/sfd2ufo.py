import os
import fontforge


for file in os.listdir(): 
	if file.endswith(".sfd"):
		font = fontforge.open(file) 
		font.generate(os.path.splitext(file)[0]+".ufo")