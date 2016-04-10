set term postscript enhanced solid eps color "Helvetica" 32
set linetype 6 lc rgb "#f1c40f" lw 9

set size 1.6,1.28
set multiplot

set size 1.5,1.28
set origin 0,0

set key top left
set xrange[-35:35]
set xlabel 'Position (mm)' 
set ylabel 'Peak-to-Peak Voltage (V)'

infile = 'spatial_profile_freq.out'

plot \
infile u (($0/10)-35):1 w li lw 9 lt 3 ti '4 GHz',\
infile u (($0/10)-35):2 w li lw 9 lt 1 ti '5 GHz',\
infile u (($0/10)-35):3 w li lw 9 lt 6 ti '6 GHz',\
infile u (($0/10)-35):4 w li lw 9 lt 4 ti '7 GHz',\
infile u (($0/10)-35):5 w li lw 9 lt 2 ti '8 GHz',\
infile u (($0/10)-35):6 w li lw 9 lt 8 ti '9 GHz'

origin_x = 1.12
origin_y = 0.77
size_x = 0.5
size_y = 0.49
set size size_x,size_y
set origin origin_x,origin_y
set object rectangle from screen origin_x,origin_y to screen (origin_x+size_x-.035),(origin_y+size_y) behind fc "white" fs solid
set xrange [4:*]
set yrange [0:0.1200001]
set xlabel "Carrier Freq. (GHz)" offset -1.2,0.5
set xlabel font ",28"
set ylabel "1/b (1/m)" offset 2.5
set ylabel font ",28"
unset key
set xtics 2,1,9
set xtics font ",28"
set ytics 0.00,0.04,0.12
set ytics font ",28"
plot 'inset/b.out' u 1:(1/$2) w lp lw 9 ps 2 pt 7 notitle

unset multiplot
