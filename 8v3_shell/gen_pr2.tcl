

open_checkpoint 8v3_shell/${static_dcp}
read_checkpoint -cell static_region_i/pr_region 8v3_shell/$projName.dcp
opt_design -directive Explore
place_design -directive Explore
phys_opt_design -directive Explore
route_design -directive Explore
write_checkpoint -force 8v3_shell/${projName}_routed.dcp
#write_checkpoint -cell static_region_i/pr_region rp2_route_design.dcp
write_bitstream -force 8v3_shell/$projName.bit 
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -name timing_1 -file 8v3_shell/$projName.timing

