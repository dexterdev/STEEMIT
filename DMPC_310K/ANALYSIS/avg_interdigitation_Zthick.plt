##
reset
set terminal epslatex color standalone#or png
#set style fill  transparent solid 0.5
set output "avg_interdigitation_Zthick.tex"
set xlabel "time (ns)"
set ylabel "average interdigitation (\\AA)" offset 1,0
set xtics 0,20,320
set xrange [0:320]
set yrange [-6:6]
set mxtics 4
#set xtics font ", 10"
plot "/home/devanandt/Documents/STEEMIT/SIMULATION_DMPC_cool/avg_interdigitation_Zthick_290K.dat" using ($1/5):2 with lines lt 1 lc 0 lw 2 title "DMPC-290K", \
     "./avg_interdigitation_Zthick_310K.dat" using ($1/5):2 with lines lt 1 lc 1 lw 2 title "DMPC-310K";

unset output  
set output # finish the current output file
system('latex avg_interdigitation_Zthick.tex && dvips avg_interdigitation_Zthick.dvi && ps2pdf avg_interdigitation_Zthick.ps')
system('mv avg_interdigitation_Zthick.ps avg_interdigitation_Zthick.eps')
unset terminal
reset



