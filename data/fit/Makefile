all: plot

plot: *.out
	gnuplot plot.p > fit.eps && epstopdf fit.eps && cp fit.pdf ../

fit.out: parse.py *.mat
	python parse.py
