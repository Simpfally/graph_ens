import argparse
import sys

import matplotlib as mpl
mpl.use("pgf")

import matplotlib.pyplot as plt
import numpy as np

preamble = ("\\usepackage[utf8]{inputenc}\n"
        "\\DeclareUnicodeCharacter{2212}{-}"
        "\\usepackage[T1]{fontenc}\n")

pgf_with_latex = {                      # setup matplotlib to use latex for output
    "pgf.texsystem": "pdflatex",        # change this if using xetex or lautex
    "text.usetex": True,                # use LaTeX to write all text
    "font.family": "DejaVu Sans",
    "font.serif": [],                   # blank entries should cause plots 
    "font.sans-serif": [],              # to inherit fonts from the document
    "font.monospace": [],
    "axes.labelsize": 12,
    "font.size": 12,
    "legend.fontsize": 12,               # Make the legend/label fonts 
    "xtick.labelsize": 12,               # a little smaller
    "ytick.labelsize": 12,
    "figure.figsize": [0.9, 0.9],     # default fig size of 0.9 textwidth
# use utf8 input and T1 fonts 
"pgf.preamble" : preamble        # plots will be generated 
                                           # using this preamble
    }
mpl.rcParams.update(pgf_with_latex)

XIII = []
YIII = []
with open("timesIII.csv", "r") as f:
    sl = f.read().split("\n")
    for s in sl:
        if s == "":
            continue
        s = s.split(",")
        XIII.append(s[0])
        YIII.append(int(s[1]))

XIV = []
YIV = []
with open("timesIV.csv", "r") as f:
    sl = f.read().split("\n")
    for s in sl:
        if s == "":
            continue
        s = s.split(",")
        XIV.append(s[0])
        YIV.append(int(s[1]))

X = XIII + XIV
Y = YIII + YIV

fig, ax = plt.subplots(figsize=(7,3))
#ax.set_title("truc")
ax.set_ylabel("ms")
ax.set_yscale("symlog") # log will happily crash pgf->pdf
#ax.set_xlabel("t")
ax.tick_params(axis="x", which="major", labelsize=10)
ax.bar(X, Y)#, label="theta") # 'r', c=(1,0,0),# label="theta")
#plt.legend()

#plt.show()
plt.savefig("graphtime.pdf", bbox_inches = 'tight',  pad_inches = 0)


