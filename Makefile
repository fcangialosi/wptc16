all: paper

final: paper
	mv paper.pdf tr_wptc16.pdf

paper: paper.tex bibliography.bib 
	pdflatex paper && pdflatex paper && bibtex paper && pdflatex paper

plots: 
	$(MAKE) -C data/ && mv data/*.pdf figs/

clean:
	rm -rf *.log *.aux *.bbl *.blg
