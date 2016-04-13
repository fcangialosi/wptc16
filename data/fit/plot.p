set term postscript enhanced solid eps color "Helvetica" 36
set size 1.5,1.0

set key top left
set xrange[-35:35]
set yrange[0:*]

a = 2.179207595
b = 26.7216308233300
c = -73.58166529
d = 0.427666631
sinc(x) = sin(x) / x
f(x) = a*abs(sinc((x+c)/b)) + d

set xlabel 'Position (mm)' 
set ylabel 'Peak-to-Peak Voltage (V)'

infile = '5ghz_abs.out'

plot \
infile u (($0/10)-35):1:2 w yerrorbars pt 7 ps 0 lw 3 ti 'Error',\
infile u (($0/10)-35):1:2 w li lw 2 lt 7 ti '5GHz',\
f((x*3)+70) w li lw 12 ti 'V(x)'
