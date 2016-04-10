set term postscript enhanced solid eps color "Helvetica" 32
set size 1.5,1.2
#set border 3
#set grid 
#set xtics nomirror
#set ytics nomirror

#set linetype 1 lc rgb "#e74c3c" lw 9
#set linetype 2 lc rgb "#f39c12" lw 9
#set linetype 3 lc rgb "#2ecc71" lw 9
#set linetype 4 lc rgb "#2980b9" lw 9
#set linetype 5 lc rgb "#9b59b6" lw 9
#set linetype 6 lc rgb "#2c3e50" lw 9
#set linetype 7 lc rgb "#f1c40f" lw 9
set linetype 6 lc rgb "#f1c40f" lw 9


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
