import os
import shutil

path = os.getcwd()
dirs_to_remove = ["\instance_ufo","\instance_ufo","\master_ttf","\Mikhak-Black.ufo","\Mikhak-DS1-Black.ufo","\Mikhak-DS1-KBlack.ufo","\Mikhak-DS1-KThin.ufo","\Mikhak-DS1-Thin.ufo","\Mikhak-DS2-Black.ufo","\Mikhak-DS2-KBlack.ufo","\Mikhak-DS2-KThin.ufo","\Mikhak-DS2-Thin.ufo","\Mikhak-KBlack.ufo","\Mikhak-KThin.ufo","\Mikhak-stroke.ufo","\Mikhak-Thin.ufo","\M-dots.ufo"]

for Ddir in dirs_to_remove:
 try:
  shutil.rmtree(path + Ddir)
 except FileNotFoundError:
  pass

files_to_remove = ["\Mikhak-DS1-Black.sfd","\Mikhak-DS1-KBlack.sfd","\Mikhak-DS1-KThin.sfd","\Mikhak-DS1-Thin.sfd","\Mikhak-DS2-Black.sfd","\Mikhak-DS2-KBlack.sfd","\Mikhak-DS2-KThin.sfd","\Mikhak-DS2-Thin.sfd","\Mikhak-KBlack.sfd","\Mikhak-KThin.sfd"]

for Dfile in files_to_remove:
 try:
  os.remove(path + Dfile)
 except FileNotFoundError:
  pass
path = path + "\\variable_ttf"
files_to_remove = ["\Mikhak-VF.ttf"]

for Dfile in files_to_remove:
 try:
  os.remove(path + Dfile)
 except WindowsError:
  pass