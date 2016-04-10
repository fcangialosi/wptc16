all: plots

plots: plot.p
	gnuplot plot.p && epstopdf sona.eps && epstopdf recon.eps && cp *.pdf ../
