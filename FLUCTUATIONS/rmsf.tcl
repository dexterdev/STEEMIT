proc rmsf { molid ni nf outfile} {
  set out [open $outfile w]
  set sel [atomselect $molid "protein and name CA"]
  set data [measure rmsf $sel first $ni last $nf step 1]
  set list [split $data " "]
  set length [llength $list]
  for {set i 0 } {$i < $length } { incr i } {
   puts "$i [lindex $list $i]"
   puts $out "$i [lindex $list $i]"
  }
  close $out
}

