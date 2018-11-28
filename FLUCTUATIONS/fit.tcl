#load the raw dcd and psf files
mol new /home/devanandt/Documents/SIMULATION_TECHNIQUES_IN_BIOLOGY/NETWORK-ANALYSIS/1UBQ_chain_pH3.5_L67S_L69S_waterbox_0.15molperL_NaCl.psf
mol addfile /home/devanandt/Documents/SIMULATION_TECHNIQUES_IN_BIOLOGY/NETWORK-ANALYSIS/1UBQ_chain_pH3.5_L67S_L69S_waterbox_0.15molperL_NaCl.dcd first 0 last -1 step 1 waitfor all

#define the selection and reference strucutre, also find the total frame numbers
set sel  [atomselect 0 "name CA"]
set nf [molinfo 0 get numframes]
set f [expr $nf -1]
set ref_U1  [atomselect 0 "name CA" frame 0]

#fitting the trajectory for all frames in dcd file w.r.t. the initial frame
for {set i 1} {$i < $nf} {incr i} {
	set sel_U1 [atomselect 0 "name CA" frame $i]
	set M1 [measure fit $sel_U1 $ref_U1]
	$sel_U1 move $M1
}

#write the output dcd file and psf file
$ref_U1 writepsf ubq_L67S_L69S_CAfitted.psf
animate write dcd ubq_L67S_L69S_CAfitted.dcd beg 0 end $f waitfor all sel $sel

exit

