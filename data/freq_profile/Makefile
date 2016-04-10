all: plot

plot: freq_profile.out plot.p
	gnuplot plot.p > freq_profile.eps && epstopdf freq_profile.eps && cp freq_profile.pdf ../

freq_profile.out: mat_to_gnu.py
	python mat_to_gnu.py > freq_profile.out 
