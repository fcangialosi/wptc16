set term postscript enhanced eps color solid "Helvetica" 36
set size 1.5,1.0

set xlabel 'Time (s)'
set ylabel 'Peak-To-Peak Voltage (V)'

infile = 'moving_recon.out'
set datafile missing '-'

set xrange[0:200]
set yrange [0:3.5]

t_c = 40
t_d = 7

a = 3.0545
b = 16.2489
c = -117#-30.2940
#b = 40.6224
#c = -75.7350
d = 0
m(x) = (int(x) % t_c)
sinc(x) = sin(x) / x
f(x) = x < 118 || x > 153? 1/0 : a*sinc((x+c)/b) + d
g(x) = x < 74 || x > 146? 1/0 : f(x+37)
h(x) = x < 30 || x > 102? 1/0 : f(x+37+37)
i(x) = x < 7 || x > 40? 1/0 : f(x+37+37+39)
j(x) = x < 158 || x > 191? 1/0 : f(x-37)
#f(x) = a*sinc((x+c)/b) + d

set arrow from 39.274,0 to 39.274,3.5 nohead lt 3 lw 4 lc rgb "black"
set arrow from 46.317,0 to 46.317,3.5 nohead lt 3 lw 4 lc rgb "black"
set arrow from 7.405,0 to 7.405,3.5 nohead lt 3 lw 4 lc rgb "black"
set arrow from 39.274,0.8 to 46.317,0.8 lt 1 lw 5 heads
set arrow from 7.405,0.5 to 46.317,0.5 lt 1 lw 5 heads
set label "t_d" at 40,1.05
set label "t_c" at 25,0.75

plot infile u ($1):($2) w p ps 1.5 pt 7 lc rgb "blue" notitle,\
f(x) w li lw 9 ti 'V(t)'
#g(x) w li lw 9 lt 2 notitle,\
#h(x) w li lw 9 lt 2 notitle,\
#i(x) w li lw 9 lt 2 notitle,\
#j(x) w li lw 9 lt 2 notitle
