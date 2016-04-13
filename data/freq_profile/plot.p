set term postscript enhanced eps color "Helvetica" 32

set size 1.6,1.28
set multiplot

set size 1.5,1.28
set origin 0,0

set key top left
set xrange[-35:35]
set xlabel 'Position (mm)' 
set ylabel 'Peak-to-Peak Voltage (V)'

infile = 'spatial_profile_freq.out'

set linetype 1 lt 1 lc rgb '#1B9E77' # dark teal
set linetype 5 lt 1 lc rgb '#D95F02' # dark orange
set linetype 3 lt 1 lc rgb '#7570B3' # dark lilac
set linetype 4 lt 1 lc rgb '#E7298A' # dark magenta
set linetype 6 lt 1 lc rgb '#E6AB02' # dark banana
set linetype 8 lt 1 lc rgb '#666666' # dark gray

plot \
infile u (($0/10)-35):1 w li lw 9 lt 1 ti '4 GHz',\
infile u (($0/10)-35):2 w li lw 9 lt 6 ti '5 GHz',\
infile u (($0/10)-35):3 w li lw 9 lt 4 ti '6 GHz',\
infile u (($0/10)-35):4 w li lw 9 lt 3 ti '7 GHz',\
infile u (($0/10)-35):5 w li lw 9 lt 5 ti '8 GHz',\
infile u (($0/10)-35):6 w li lw 9 lt 8 ti '9 GHz'

origin_x = 1.12
origin_y = 0.77
size_x = 0.5
size_y = 0.49
set size size_x,size_y
set origin origin_x,origin_y
set object rectangle from screen origin_x,origin_y to screen (origin_x+size_x-.035),(origin_y+size_y) behind fc "white" fs solid
set xrange [0:10]
set yrange [0:0.0800001]
set xlabel "Carrier Freq. (GHz)" offset -1.2,0.5
set xlabel font ",28"
set ylabel "1/b (1/m)" offset 2.5
set ylabel font ",28"
unset key
set xtics 0,2,10
set xtics font ",28"
set ytics 0.00,0.04,0.08
set ytics font ",28"

plot (0.008369621876241*x) lc rgb "#3498db" lt 2 lw 7,\
     'inset/b.out' u 1:(1/$2):(1/$3):(1/$4) w yerrorbars ps 2 lw 7 lt 4 notitle

unset multiplot
