mol new /home/devanandt/Documents/STEEMIT/SIMULATION_DMPC_cool/DMPC_noh_290K.psf
mol addfile /home/devanandt/Documents/STEEMIT/SIMULATION_DMPC_cool/DMPC_noh_290K.dcd first 0 last -1 step 1 waitfor all




set outfile [open avg_interdigitation_Zthick_290K.dat "w"]
set sel1 [atomselect 0 "name C314 and resid 1 to 144"]
set sel2 [atomselect 0 "name C314 and resid 145 to 288"]
set nf [molinfo 0 get numframes]
source /home/devanandt/Documents/NOGO66/ANALYSIS/MEMBRANE_ANALYSIS/average.tcl
for {set frame 0} {$frame < $nf} {incr frame} {
	$sel1 frame $frame
	$sel1 update
	$sel2 frame $frame
	$sel2 update
	set upper [average [$sel1 get z]]
	set lower [average [$sel2 get z]]
	set Zdiff [expr $upper - $lower]
	puts $outfile "$frame $Zdiff"
}

exit



