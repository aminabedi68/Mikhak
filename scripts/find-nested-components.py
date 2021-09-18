import sys
from fontTools.ttLib import TTFont
import argparse

parser = argparse.ArgumentParser(description="Finds deeply nested components")
parser.add_argument(
    "--depth", metavar="depth", type=int, default=2, help="minimum depth to report"
)
parser.add_argument("font", metavar="FONT", help="the font file to test")

args = parser.parse_args()
font = TTFont(args.font)

if "glyf" not in font:
    print("find-nested-components can only be used on TrueType fonts")

nesting = {}


def get_nesting(glyph):
    if glyph in nesting:
        return nesting[glyph]
    gg = font["glyf"].glyphs[glyph]
    components = gg.getComponentNames(font["glyf"])
    if not components:
        nesting[glyph] = {"depth": 0, "chain": []}
        return nesting[glyph]
    depth = 0
    chain = []
    for g in components:
        nested = get_nesting(g)
        if 1 + nested["depth"] > depth:
            depth = 1 + nested["depth"]
            chain = [g] + nested["chain"]
    nesting[glyph] = {"depth": depth, "chain": chain}
    return nesting[glyph]


for glyph in font.getGlyphOrder():
    if glyph not in nesting:
        nesting[glyph] = get_nesting(glyph)

for k, v in nesting.items():
    if v["depth"] < args.depth:
        continue
    print("%s has depth %i: %s" % (k, v["depth"], " -> ".join([k] + v["chain"])))
