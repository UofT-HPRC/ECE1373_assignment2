
set static_dcp [lindex $argv 0]
set projName [lindex $argv 1]
set proj 8v3_shell/$projName/pr_region.xpr
set modify [lindex $argv 2]




if {![file exists $proj]} { 
    source 8v3_shell/create_pr2_0.tcl
} else {
    open_project $proj
    open_bd_design 8v3_shell/$projName/pr_region.srcs/sources_1/bd/pr_region_2/pr_region_2.bd
    upgrade_ip [get_ips]
}

if { !($modify eq "1") } { 
    source 8v3_shell/create_pr2_1.tcl
}
