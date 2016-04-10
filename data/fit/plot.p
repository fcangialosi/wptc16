set term postscript enhanced solid eps color "Helvetica" 36
set size 1.5,1.0

set key top left
set xrange[-35:35]
set yrange[0:*]

a = 1.89054223
b = 20.02295637
c = -73.71134998
d = 1.01111164
sinc(x) = sin(x) / x
f(x) = a*sinc((x+c)/b) + d

set xlabel 'Position (mm)' 
set ylabel 'Peak-to-Peak Voltage (V)'

infile = '5ghz.out'

plot \
infile u (($0/10)-35):1:2 w yerrorbars pt 7 ps 0 lw 3 ti 'Error',\
infile u (($0/10)-35):1:2 w li lw 2 lt 7 ti '5GHz',\
f((x*3)+70) w li lw 12 ti 'V(x)'
