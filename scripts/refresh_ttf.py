import os

os.chdir(".\instance_ttf")
for file in os.listdir(): 
	if file.endswith(".ttf"):
		font = fontforge.open(file) 
		font.generate(os.path.splitext(file)[0]+".ttf")
