SRC=bakalarka
CC=pdflatex
BC=bibtex

default: pdf

pdf: $(SRC).tex
#	$(CC) $(SRC)
#	$(BC) $(SRC).aux
#	$(CC) $(SRC)
#	$(CC) $(SRC)
	vlna -l -m -n $(SRC).tex
	pdflatex $(SRC)
	biber $(SRC).bcf
	pdflatex $(SRC)
	pdflatex $(SRC)

clean:
	@for i in '*.aux' '*.log' '*.out' '*.bbl' '*.blg' '*.dvi' '*.toc' '*.lot' '*.lof' '*.backup' '*~' '*.gz'; do	\
		find . -name "$$i" -exec rm {} \;;								\
	done

cleanall: clean
	rm -rf $(SRC).pdf
