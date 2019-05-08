
################################################################
# This is a generated script based on design: static_region
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
#set scripts_vivado_version 2017.2
#set current_vivado_version [version -short]
#
#if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
#   puts ""
#   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}
#
#   return 1
#}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source static_region_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvu095-ffvc1517-2-e
}


# CHANGE DESIGN NAME HERE
set design_name static_region

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: pr_region
proc create_hier_cell_pr_region { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_pr_region() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi

  # Create pins
  create_bd_pin -dir I -type clk S00_ACLK
  create_bd_pin -dir I -type rst S00_ARESETN

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $axi_interconnect_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {1} \
 ] $axi_interconnect_1

  # Create instance: dummy1_0, and set properties
  set dummy1_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:dummy1:1.0 dummy1_0 ]

  set_property -dict [ list \
CONFIG.NUM_READ_OUTSTANDING {1} \
CONFIG.NUM_WRITE_OUTSTANDING {1} \
 ] [get_bd_intf_pins /pr_region/dummy1_0/s_axi_ctrl]

  # Create instance: pcl_axifull_bridge_0, and set properties
  set pcl_axifull_bridge_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:pcl_axifull_bridge:1.0 pcl_axifull_bridge_0 ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {64} \
CONFIG.DATA_WIDTH {128} \
CONFIG.S_ID_WIDTH {5} \
 ] $pcl_axifull_bridge_0

  # Create instance: pcl_axilite_bridge_0, and set properties
  set pcl_axilite_bridge_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:pcl_axilite_bridge:1.0 pcl_axilite_bridge_0 ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {19} \
 ] $pcl_axilite_bridge_0

  set_property -dict [ list \
CONFIG.MAX_BURST_LENGTH {1} \
 ] [get_bd_intf_pins /pr_region/pcl_axilite_bridge_0/m_axi]

  set_property -dict [ list \
CONFIG.NUM_READ_OUTSTANDING {1} \
CONFIG.NUM_WRITE_OUTSTANDING {1} \
 ] [get_bd_intf_pins /pr_region/pcl_axilite_bridge_0/s_axi]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins s_axi] [get_bd_intf_pins pcl_axilite_bridge_0/s_axi]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins m_axi] [get_bd_intf_pins pcl_axifull_bridge_0/m_axi]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins axi_interconnect_1/S00_AXI] [get_bd_intf_pins dummy1_0/m_axi_gmem]
  connect_bd_intf_net -intf_net S00_AXI_2 [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins pcl_axilite_bridge_0/m_axi]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins dummy1_0/s_axi_ctrl]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins axi_interconnect_1/M00_AXI] [get_bd_intf_pins pcl_axifull_bridge_0/s_axi]

  # Create port connections
  connect_bd_net -net S00_ACLK_1 [get_bd_pins S00_ACLK] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins dummy1_0/ap_clk] [get_bd_pins pcl_axifull_bridge_0/aclk] [get_bd_pins pcl_axilite_bridge_0/aclk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net S00_ARESETN_1 [get_bd_pins S00_ARESETN] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins pcl_axifull_bridge_0/aresetn] [get_bd_pins pcl_axilite_bridge_0/aresetn] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins dummy1_0/ap_rst_n] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set c0_ddr4 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 c0_ddr4 ]
  set c0_sys_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 c0_sys_clk ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {300120000} \
 ] $c0_sys_clk
  set pcie_7x_mgt_rtl [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pcie_7x_mgt_rtl ]
  set pcie_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_clk ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {100000000} \
 ] $pcie_clk

  # Create ports
  set reset_rtl [ create_bd_port -dir I -type rst reset_rtl ]
  set_property -dict [ list \
CONFIG.POLARITY {ACTIVE_LOW} \
 ] $reset_rtl

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {1} \
CONFIG.C_ALL_OUTPUTS {0} \
 ] $axi_gpio_0

  # Create instance: axi_smc, and set properties
  set axi_smc [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc ]
  set_property -dict [ list \
CONFIG.ADVANCED_PROPERTIES { __view__ { timing { S01_Buffer { AR_M_PIPE 1 AW_M_PIPE 1 W_M_PIPE 1 } } }} \
CONFIG.NUM_CLKS {2} \
CONFIG.NUM_SI {2} \
 ] $axi_smc

  # Create instance: ddr4_0, and set properties
  set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 ddr4_0 ]
  set_property -dict [ list \
CONFIG.C0.DDR4_AxiAddressWidth {33} \
CONFIG.C0.DDR4_AxiDataWidth {512} \
CONFIG.C0.DDR4_CustomParts {../../../../../../../adm-pcie-8v3_custom_parts_2400.csv} \
CONFIG.C0.DDR4_DataWidth {64} \
CONFIG.C0.DDR4_InputClockPeriod {3332} \
CONFIG.C0.DDR4_MemoryPart {CUSTOM_MT40A1G8PM-083E} \
CONFIG.C0.DDR4_isCustom {true} \
 ] $ddr4_0

  # Create instance: decouple_resetn, and set properties
  set decouple_resetn [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 decouple_resetn ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $decouple_resetn

  # Create instance: pr_decoupler_0, and set properties
  set pr_decoupler_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:pr_decoupler:1.0 pr_decoupler_0 ]
  set_property -dict [ list \
CONFIG.ALL_PARAMS {HAS_AXI_LITE 1 HAS_SIGNAL_CONTROL 0 HAS_SIGNAL_STATUS 1 INTF {gmem {ID 0 VLNV xilinx.com:interface:aximm_rtl:1.0 SIGNALS {ARVALID {PRESENT 1 WIDTH 1} ARREADY {PRESENT 1 WIDTH 1} AWVALID {PRESENT 1 WIDTH 1} AWREADY {PRESENT 1 WIDTH 1} BVALID {PRESENT 1 WIDTH 1} BREADY {PRESENT 1 WIDTH 1} RVALID {PRESENT 1 WIDTH 1} RREADY {PRESENT 1 WIDTH 1} WVALID {PRESENT 1 WIDTH 1} WREADY {PRESENT 1 WIDTH 1} AWID {PRESENT 1 WIDTH 5} AWADDR {PRESENT 1 WIDTH 64} AWLEN {PRESENT 1 WIDTH 8} AWSIZE {PRESENT 1 WIDTH 3} AWBURST {PRESENT 1 WIDTH 2} AWLOCK {PRESENT 1 WIDTH 1} AWCACHE {PRESENT 1 WIDTH 4} AWPROT {PRESENT 1 WIDTH 3} AWREGION {PRESENT 1 WIDTH 4} AWQOS {PRESENT 1 WIDTH 4} AWUSER {PRESENT 0 WIDTH 0} WID {PRESENT 1 WIDTH 5} WDATA {PRESENT 1 WIDTH 128} WSTRB {PRESENT 1 WIDTH 16} WLAST {PRESENT 1 WIDTH 1} WUSER {PRESENT 0 WIDTH 0} BID {PRESENT 1 WIDTH 5} BRESP {PRESENT 1 WIDTH 2} BUSER {PRESENT 0 WIDTH 0} ARID {PRESENT 1 WIDTH 5} ARADDR {PRESENT 1 WIDTH 64} ARLEN {PRESENT 1 WIDTH 8} ARSIZE {PRESENT 1 WIDTH 3} ARBURST {PRESENT 1 WIDTH 2} ARLOCK {PRESENT 1 WIDTH 1} ARCACHE {PRESENT 1 WIDTH 4} ARPROT {PRESENT 1 WIDTH 3} ARREGION {PRESENT 1 WIDTH 4} ARQOS {PRESENT 1 WIDTH 4} ARUSER {PRESENT 0 WIDTH 0} RID {PRESENT 1 WIDTH 5} RDATA {PRESENT 1 WIDTH 128} RRESP {PRESENT 1 WIDTH 2} RLAST {PRESENT 1 WIDTH 1} RUSER {PRESENT 0 WIDTH 0}}} ctrl {ID 1 MODE slave VLNV xilinx.com:interface:aximm_rtl:1.0 PROTOCOL axi4lite SIGNALS {ARVALID {PRESENT 1 WIDTH 1} ARREADY {PRESENT 1 WIDTH 1} AWVALID {PRESENT 1 WIDTH 1} AWREADY {PRESENT 1 WIDTH 1} BVALID {PRESENT 1 WIDTH 1} BREADY {PRESENT 1 WIDTH 1} RVALID {PRESENT 1 WIDTH 1} RREADY {PRESENT 1 WIDTH 1} WVALID {PRESENT 1 WIDTH 1} WREADY {PRESENT 1 WIDTH 1} AWADDR {PRESENT 1 WIDTH 32} AWLEN {PRESENT 0 WIDTH 8} AWSIZE {PRESENT 0 WIDTH 3} AWBURST {PRESENT 0 WIDTH 2} AWLOCK {PRESENT 0 WIDTH 1} AWCACHE {PRESENT 0 WIDTH 4} AWPROT {PRESENT 1 WIDTH 3} WDATA {PRESENT 1 WIDTH 32} WSTRB {PRESENT 1 WIDTH 4} WLAST {PRESENT 0 WIDTH 1} BRESP {PRESENT 1 WIDTH 2} ARADDR {PRESENT 1 WIDTH 32} ARLEN {PRESENT 0 WIDTH 8} ARSIZE {PRESENT 0 WIDTH 3} ARBURST {PRESENT 0 WIDTH 2} ARLOCK {PRESENT 0 WIDTH 1} ARCACHE {PRESENT 0 WIDTH 4} ARPROT {PRESENT 1 WIDTH 3} RDATA {PRESENT 1 WIDTH 32} RRESP {PRESENT 1 WIDTH 2} RLAST {PRESENT 0 WIDTH 1} AWID {PRESENT 0 WIDTH 0} AWREGION {PRESENT 1 WIDTH 4} AWQOS {PRESENT 1 WIDTH 4} AWUSER {PRESENT 0 WIDTH 0} WID {PRESENT 0 WIDTH 0} WUSER {PRESENT 0 WIDTH 0} BID {PRESENT 0 WIDTH 0} BUSER {PRESENT 0 WIDTH 0} ARID {PRESENT 0 WIDTH 0} ARREGION {PRESENT 1 WIDTH 4} ARQOS {PRESENT 1 WIDTH 4} ARUSER {PRESENT 0 WIDTH 0} RID {PRESENT 0 WIDTH 0} RUSER {PRESENT 0 WIDTH 0}}}} IPI_PROP_COUNT 2} \
CONFIG.GUI_HAS_AXI_LITE {true} \
CONFIG.GUI_HAS_SIGNAL_CONTROL {false} \
CONFIG.GUI_HAS_SIGNAL_STATUS {1} \
CONFIG.GUI_INTERFACE_NAME {gmem} \
CONFIG.GUI_INTERFACE_PROTOCOL {axi4} \
CONFIG.GUI_SELECT_INTERFACE {0} \
CONFIG.GUI_SELECT_MODE {master} \
CONFIG.GUI_SELECT_VLNV {xilinx.com:interface:aximm_rtl:1.0} \
CONFIG.GUI_SIGNAL_DECOUPLED_0 {true} \
CONFIG.GUI_SIGNAL_DECOUPLED_1 {true} \
CONFIG.GUI_SIGNAL_DECOUPLED_2 {true} \
CONFIG.GUI_SIGNAL_DECOUPLED_3 {true} \
CONFIG.GUI_SIGNAL_DECOUPLED_4 {true} \
CONFIG.GUI_SIGNAL_DECOUPLED_5 {true} \
CONFIG.GUI_SIGNAL_DECOUPLED_6 {true} \
CONFIG.GUI_SIGNAL_DECOUPLED_7 {true} \
CONFIG.GUI_SIGNAL_DECOUPLED_8 {true} \
CONFIG.GUI_SIGNAL_DECOUPLED_9 {true} \
CONFIG.GUI_SIGNAL_PRESENT_0 {true} \
CONFIG.GUI_SIGNAL_PRESENT_1 {true} \
CONFIG.GUI_SIGNAL_PRESENT_2 {true} \
CONFIG.GUI_SIGNAL_PRESENT_3 {true} \
CONFIG.GUI_SIGNAL_PRESENT_4 {true} \
CONFIG.GUI_SIGNAL_PRESENT_5 {true} \
CONFIG.GUI_SIGNAL_PRESENT_6 {true} \
CONFIG.GUI_SIGNAL_PRESENT_7 {true} \
CONFIG.GUI_SIGNAL_PRESENT_8 {true} \
CONFIG.GUI_SIGNAL_PRESENT_9 {true} \
CONFIG.GUI_SIGNAL_SELECT_0 {ARVALID} \
CONFIG.GUI_SIGNAL_SELECT_1 {ARREADY} \
CONFIG.GUI_SIGNAL_SELECT_2 {AWVALID} \
CONFIG.GUI_SIGNAL_SELECT_3 {AWREADY} \
CONFIG.GUI_SIGNAL_SELECT_4 {BVALID} \
CONFIG.GUI_SIGNAL_SELECT_5 {BREADY} \
CONFIG.GUI_SIGNAL_SELECT_6 {RVALID} \
CONFIG.GUI_SIGNAL_SELECT_7 {RREADY} \
CONFIG.GUI_SIGNAL_SELECT_8 {WVALID} \
CONFIG.GUI_SIGNAL_SELECT_9 {WREADY} \
 ] $pr_decoupler_0

  # Create instance: pr_region
  create_hier_cell_pr_region [current_bd_instance .] pr_region

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: rst_ddr4_0_300M, and set properties
  set rst_ddr4_0_300M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ddr4_0_300M ]

  # Create instance: system_ila_0, and set properties
  set system_ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila system_ila_0 ]
  set_property -dict [ list \
CONFIG.C_BRAM_CNT {6} \
CONFIG.C_NUM_MONITOR_SLOTS {2} \
 ] $system_ila_0

  # Create instance: util_ds_buf, and set properties
  set util_ds_buf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf ]
  set_property -dict [ list \
CONFIG.C_BUF_TYPE {IBUFDSGTE} \
 ] $util_ds_buf

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list \
CONFIG.C_OPERATION {not} \
CONFIG.C_SIZE {1} \
CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_1

  # Create instance: vio_0, and set properties
  set vio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:vio:3.0 vio_0 ]
  set_property -dict [ list \
CONFIG.C_EN_PROBE_IN_ACTIVITY {0} \
CONFIG.C_NUM_PROBE_IN {1} \
CONFIG.C_NUM_PROBE_OUT {2} \
CONFIG.C_PROBE_OUT0_INIT_VAL {0x0} \
CONFIG.C_PROBE_OUT1_WIDTH {32} \
 ] $vio_0

  # Create instance: xdma_0, and set properties
  set xdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xdma xdma_0 ]
  set_property -dict [ list \
CONFIG.axi_data_width {256_bit} \
CONFIG.axilite_master_en {true} \
CONFIG.axisten_freq {250} \
CONFIG.cfg_mgmt_if {false} \
CONFIG.dedicate_perst {false} \
CONFIG.pcie_blk_locn {X0Y1} \
CONFIG.pf0_device_id {8038} \
CONFIG.pf0_msix_cap_pba_bir {BAR_1} \
CONFIG.pf0_msix_cap_table_bir {BAR_1} \
CONFIG.pl_link_cap_max_link_speed {8.0_GT/s} \
CONFIG.pl_link_cap_max_link_width {X8} \
CONFIG.select_quad {GTH_Quad_228} \
CONFIG.xdma_axi_intf_mm {AXI_Memory_Mapped} \
CONFIG.xdma_rnum_chnl {4} \
CONFIG.xdma_wnum_chnl {4} \
 ] $xdma_0

  # Create instance: xdma_0_axi_periph, and set properties
  set xdma_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 xdma_0_axi_periph ]
  set_property -dict [ list \
CONFIG.M00_HAS_REGSLICE {4} \
CONFIG.NUM_MI {3} \
 ] $xdma_0_axi_periph

  # Create interface connections
  connect_bd_intf_net -intf_net axi_smc_M00_AXI [get_bd_intf_pins axi_smc/M00_AXI] [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_ports c0_ddr4] [get_bd_intf_pins ddr4_0/C0_DDR4]
  connect_bd_intf_net -intf_net diff_clock_rtl_1 [get_bd_intf_ports pcie_clk] [get_bd_intf_pins util_ds_buf/CLK_IN_D]
  connect_bd_intf_net -intf_net diff_clock_rtl_2 [get_bd_intf_ports c0_sys_clk] [get_bd_intf_pins ddr4_0/C0_SYS_CLK]
  connect_bd_intf_net -intf_net pr_decoupler_0_rp_ctrl [get_bd_intf_pins pr_decoupler_0/rp_ctrl] [get_bd_intf_pins pr_region/s_axi]
connect_bd_intf_net -intf_net [get_bd_intf_nets pr_decoupler_0_rp_ctrl] [get_bd_intf_pins pr_decoupler_0/rp_ctrl] [get_bd_intf_pins system_ila_0/SLOT_1_AXI]
  connect_bd_intf_net -intf_net pr_decoupler_0_s_gmem [get_bd_intf_pins axi_smc/S01_AXI] [get_bd_intf_pins pr_decoupler_0/s_gmem]
connect_bd_intf_net -intf_net [get_bd_intf_nets pr_decoupler_0_s_gmem] [get_bd_intf_pins axi_smc/S01_AXI] [get_bd_intf_pins system_ila_0/SLOT_0_AXI]
  connect_bd_intf_net -intf_net pr_region_m_axi [get_bd_intf_pins pr_decoupler_0/rp_gmem] [get_bd_intf_pins pr_region/m_axi]
  connect_bd_intf_net -intf_net xdma_0_M_AXI [get_bd_intf_pins axi_smc/S00_AXI] [get_bd_intf_pins xdma_0/M_AXI]
  connect_bd_intf_net -intf_net xdma_0_M_AXI_LITE [get_bd_intf_pins xdma_0/M_AXI_LITE] [get_bd_intf_pins xdma_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net xdma_0_axi_periph_M00_AXI [get_bd_intf_pins pr_decoupler_0/s_axi_reg] [get_bd_intf_pins xdma_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net xdma_0_axi_periph_M01_AXI [get_bd_intf_pins pr_decoupler_0/s_ctrl] [get_bd_intf_pins xdma_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net xdma_0_axi_periph_M02_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins xdma_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net xdma_0_pcie_mgt [get_bd_intf_ports pcie_7x_mgt_rtl] [get_bd_intf_pins xdma_0/pcie_mgt]

  # Create port connections
  connect_bd_net -net S00_ACLK_1 [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_smc/aclk1] [get_bd_pins pr_decoupler_0/aclk] [get_bd_pins pr_region/S00_ACLK] [get_bd_pins rst_ddr4_0_300M/slowest_sync_clk] [get_bd_pins system_ila_0/clk] [get_bd_pins vio_0/clk] [get_bd_pins xdma_0/axi_aclk] [get_bd_pins xdma_0_axi_periph/ACLK] [get_bd_pins xdma_0_axi_periph/M00_ACLK] [get_bd_pins xdma_0_axi_periph/M01_ACLK] [get_bd_pins xdma_0_axi_periph/M02_ACLK] [get_bd_pins xdma_0_axi_periph/S00_ACLK]
  connect_bd_net -net S00_ARESETN_1 [get_bd_pins decouple_resetn/Res] [get_bd_pins pr_region/S00_ARESETN]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins axi_smc/aclk] [get_bd_pins ddr4_0/c0_ddr4_ui_clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk_sync_rst [get_bd_pins ddr4_0/c0_ddr4_ui_clk_sync_rst] [get_bd_pins proc_sys_reset_0/aux_reset_in] [get_bd_pins rst_ddr4_0_300M/aux_reset_in]
  connect_bd_net -net ddr4_0_c0_init_calib_complete [get_bd_pins ddr4_0/c0_init_calib_complete] [get_bd_pins vio_0/probe_in0]
  connect_bd_net -net pr_decoupler_0_decouple_status [get_bd_pins pr_decoupler_0/decouple_status] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins ddr4_0/c0_ddr4_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net reset_rtl_1 [get_bd_ports reset_rtl] [get_bd_pins xdma_0/sys_rst_n]
  connect_bd_net -net resetn_gate_Res [get_bd_pins axi_smc/aresetn] [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins rst_ddr4_0_300M/ext_reset_in] [get_bd_pins xdma_0/axi_aresetn] [get_bd_pins xdma_0_axi_periph/S00_ARESETN]
  connect_bd_net -net rst_ddr4_0_300M_interconnect_aresetn [get_bd_pins pr_decoupler_0/s_axi_reg_aresetn] [get_bd_pins rst_ddr4_0_300M/interconnect_aresetn] [get_bd_pins system_ila_0/resetn] [get_bd_pins xdma_0_axi_periph/ARESETN]
  connect_bd_net -net rst_ddr4_0_300M_peripheral_aresetn [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins decouple_resetn/Op2] [get_bd_pins rst_ddr4_0_300M/peripheral_aresetn] [get_bd_pins xdma_0_axi_periph/M00_ARESETN] [get_bd_pins xdma_0_axi_periph/M01_ARESETN] [get_bd_pins xdma_0_axi_periph/M02_ARESETN]
  connect_bd_net -net util_ds_buf_IBUF_DS_ODIV2 [get_bd_pins util_ds_buf/IBUF_DS_ODIV2] [get_bd_pins xdma_0/sys_clk]
  connect_bd_net -net util_ds_buf_IBUF_OUT [get_bd_pins util_ds_buf/IBUF_OUT] [get_bd_pins xdma_0/sys_clk_gt]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins decouple_resetn/Op1] [get_bd_pins util_vector_logic_1/Res]
  connect_bd_net -net vio_0_probe_out0 [get_bd_pins ddr4_0/sys_rst] [get_bd_pins vio_0/probe_out0]
  connect_bd_net -net vio_0_probe_out1 [get_bd_pins axi_gpio_0/gpio_io_i] [get_bd_pins vio_0/probe_out1]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x00090000 [get_bd_addr_spaces xdma_0/M_AXI_LITE] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x000200000000 -offset 0x00000000 [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] SEG_ddr4_0_C0_DDR4_ADDRESS_BLOCK
  create_bd_addr_seg -range 0x00080000 -offset 0x00000000 [get_bd_addr_spaces xdma_0/M_AXI_LITE] [get_bd_addr_segs pr_region/dummy1_0/s_axi_ctrl/Reg] SEG_dummy1_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x00080000 [get_bd_addr_spaces xdma_0/M_AXI_LITE] [get_bd_addr_segs pr_decoupler_0/s_axi_reg/Reg] SEG_pr_decoupler_0_Reg
  create_bd_addr_seg -range 0x000200000000 -offset 0x00000000 [get_bd_addr_spaces pr_region/dummy1_0/Data_m_axi_gmem] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] SEG_ddr4_0_C0_DDR4_ADDRESS_BLOCK


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


