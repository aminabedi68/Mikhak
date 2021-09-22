import re
with open ('Mikhak-Kerning Classes.fea', 'r' ) as f:
    content = f.read()
    content_new = re.sub(r'([+-]?\b[0-9]+\b);$', r'<\1 0 \1 0>;', content, flags = re.M)
f = open("Mikhak-Kerning Classes - after Regex.fea", "w")
f.write(content_new)