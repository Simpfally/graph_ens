from os import listdir
from os.path import isfile, join

folder = "Queries"
queries = [f for f in listdir(folder) if isfile(join(folder, f))]
queries.sort()
s = ""
currentsection = "0"
title = { "I" : "Describe your dataset",
        "II" : "Adding more data",
        "III" : "Querying simple patterns",
        "IV" : "Querying complex patterns",
        "V" : "Aggregate queries",
        "VI" : "Adjacency list and distribution"
        }

i = 0

for q in queries:
    i += 1
    start = ""
    sql = ""
    end = ""

    section = q[1:-4].split("-")[0]
    if section != currentsection:
        start += "\\section{" + title[section] + "}\n"
    currentsection = section
    start += "\\subsection{}\n"
    sql += "\\begin{minted}{SQL}\n"

    k = ""
    with open(f"{folder}/{q}", 'r') as f:
        k = f.read().split("\n")

    sqldone = False
    for line in k:
        if line == "":
            continue
        comment = False
        if line[0:2] == "//":
            comment = True
            line = line[2:]
        line = line.strip()
            

        if not comment:
            sqldone = True
            sql += line + "\n"
        if comment:
            if sqldone:
                end += line + "\n\n"
            else:
                start += line+ "\n\n"

    sql += "\\end{minted}\n\n"

    s += f"{start}{sql}{end}"

with open("report/sql.tex", "w") as f:
    f.write(s)
