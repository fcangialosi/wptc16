set term postscript enhanced color solid eps "Helvetica" 28

set size 1.5,1
set xlabel 'Time(us)'
set ylabel 'Voltage (mV)'
set xrange[*:15]
set nokey

set multiplot layout 1,2 

set size 0.75,1
plot 'sona.out' u 1:2 w li lw 2 notitle
set origin 0.75,0
set size 0.75,1
plot 'recon.out' u 1:2 w li lw 2 notitle

unset multiplot
