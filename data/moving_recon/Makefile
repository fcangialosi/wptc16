all: plot

plot: moving_recon.out
	gnuplot plot.p > moving_recon.eps && epstopdf moving_recon.eps && cp moving_recon.pdf ../

moving_recon.out: parse.py *.mat
	python parse.py > moving_recon.out
