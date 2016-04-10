set term postscript enhanced color solid eps "Helvetica" 46

set xlabel 'Time({/Symbol m}s)'
set ylabel 'Voltage (mV)'
set xrange[*:15]
set nokey

set output 'sona.eps'
plot 'sona.out' u 1:2 w li lw 2 notitle
set output 'recon.eps'

set style arrow 1 head nofilled size screen 0.025,30,45 lc rgb "red" lw 4
set arrow from 7.5,200 to 13.1,115 lt 1 lw 9 lc rgb "red" as 1
set label "Reconstruction"  at 0.5,275 tc rgb "red"

plot 'recon.out' u 1:2 w li lw 2 notitle
