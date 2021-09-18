import os
import sys
import linecache

PATH = sys.argv[1]
# GASP data:
section_2 = "\t<key>openTypeGaspRangeRecords</key>\n\t<array>\n\t<dict>\n\t<key>rangeGaspBehavior</key>\n\t<array>\n\t<integer>0</integer>\n\t<integer>1</integer>\n\t<integer>2</integer>\n\t<integer>3</integer>\n\t</array>\n\t<key>rangeMaxPPEM</key>\n\t<integer>65535</integer>\n\t</dict>\n\t</array>\n"

os.chdir(PATH)
# Before input GASP data:
section_1 = ""
l = 0
while l < 35:
 section_1 = section_1 + linecache.getline('fontinfo.plist', l)
 l += 1
# after input GASP data:
section_3 = ""
l = 35
while True:
 section_3 = section_3 + linecache.getline('fontinfo.plist', l)
 l += 1
 if (linecache.getline('fontinfo.plist', l) == ""):
  break
# new fontinfo:
data = section_1 + section_2 + section_3
fontinfo = open("fontinfo.plist" , "w")
fontinfo.write(data)
fontinfo.close()



