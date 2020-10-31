OPTION = -pdflatex=lualatex -pdf --shell-escape

all: report

report: report.pdf

report.pdf : report.tex *.tex *.pdf
	latexmk $(OPTION) $<


%.pdf : %.tex
	latexmk $(OPTION) $< 

#pdflatex --halt-on-error --shell-escape rapport.tex > /dev/null

clean:
	latexmk -C
	rm -rf report.bbl
	rm -rf *.snm
	rm -rf *.nav
	rm -rf _minted-report
