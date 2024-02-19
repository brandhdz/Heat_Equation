set terminal gif animate delay 1

set output 'heat_bar.gif'

set title "Heat Bar"

set xlabel "Distance"
set ylabel "Temperature"

set xrange[0.0:1.0]
set yrange[0.0:1.0]

do for [i = 1 : 10]{
pl '../data/heat_bar.dat' u 1:i+1 w l t sprintf("tiempo, t = %1.1f s", i*0.1)
}