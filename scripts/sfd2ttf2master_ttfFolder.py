import os
from os import path
import fontforge
import shutil

for file in os.listdir(): 
	if file.endswith(".sfd"):
		font = fontforge.open(file) 
		font.generate(os.path.splitext(file)[0]+".ttf")

if not path.exists(os.getcwd() + "\master_ttf"):
	os.mkdir(os.getcwd() + "\master_ttf")

sourcepath = os.getcwd()
sourcefiles = os.listdir(sourcepath)
destinationpath = os.getcwd() + "\master_ttf"
for file in sourcefiles:
    if file.endswith('.ttf'):
        shutil.move(os.path.join(sourcepath,file), os.path.join(destinationpath,file))



