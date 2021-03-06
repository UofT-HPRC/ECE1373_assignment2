-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.2
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dummy1 is
generic (
    C_M_AXI_GMEM_ADDR_WIDTH : INTEGER := 64;
    C_M_AXI_GMEM_ID_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM_AWUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM_DATA_WIDTH : INTEGER := 32;
    C_M_AXI_GMEM_WUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM_ARUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM_RUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM_BUSER_WIDTH : INTEGER := 1;
    C_S_AXI_CTRL_ADDR_WIDTH : INTEGER := 5;
    C_S_AXI_CTRL_DATA_WIDTH : INTEGER := 32;
    C_M_AXI_GMEM_TARGET_ADDR : INTEGER := 0;
    C_M_AXI_GMEM_PROT_VALUE : INTEGER := 0;
    C_M_AXI_GMEM_USER_VALUE : INTEGER := 0;
    C_M_AXI_GMEM_CACHE_VALUE : INTEGER := 3 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    m_axi_gmem_AWVALID : OUT STD_LOGIC;
    m_axi_gmem_AWREADY : IN STD_LOGIC;
    m_axi_gmem_AWADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM_ADDR_WIDTH-1 downto 0);
    m_axi_gmem_AWID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM_ID_WIDTH-1 downto 0);
    m_axi_gmem_AWLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_AWUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM_AWUSER_WIDTH-1 downto 0);
    m_axi_gmem_WVALID : OUT STD_LOGIC;
    m_axi_gmem_WREADY : IN STD_LOGIC;
    m_axi_gmem_WDATA : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM_DATA_WIDTH-1 downto 0);
    m_axi_gmem_WSTRB : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM_DATA_WIDTH/8-1 downto 0);
    m_axi_gmem_WLAST : OUT STD_LOGIC;
    m_axi_gmem_WID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM_ID_WIDTH-1 downto 0);
    m_axi_gmem_WUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM_WUSER_WIDTH-1 downto 0);
    m_axi_gmem_ARVALID : OUT STD_LOGIC;
    m_axi_gmem_ARREADY : IN STD_LOGIC;
    m_axi_gmem_ARADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM_ADDR_WIDTH-1 downto 0);
    m_axi_gmem_ARID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM_ID_WIDTH-1 downto 0);
    m_axi_gmem_ARLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_ARUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM_ARUSER_WIDTH-1 downto 0);
    m_axi_gmem_RVALID : IN STD_LOGIC;
    m_axi_gmem_RREADY : OUT STD_LOGIC;
    m_axi_gmem_RDATA : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM_DATA_WIDTH-1 downto 0);
    m_axi_gmem_RLAST : IN STD_LOGIC;
    m_axi_gmem_RID : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM_ID_WIDTH-1 downto 0);
    m_axi_gmem_RUSER : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM_RUSER_WIDTH-1 downto 0);
    m_axi_gmem_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_BVALID : IN STD_LOGIC;
    m_axi_gmem_BREADY : OUT STD_LOGIC;
    m_axi_gmem_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_BID : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM_ID_WIDTH-1 downto 0);
    m_axi_gmem_BUSER : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM_BUSER_WIDTH-1 downto 0);
    s_axi_ctrl_AWVALID : IN STD_LOGIC;
    s_axi_ctrl_AWREADY : OUT STD_LOGIC;
    s_axi_ctrl_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CTRL_ADDR_WIDTH-1 downto 0);
    s_axi_ctrl_WVALID : IN STD_LOGIC;
    s_axi_ctrl_WREADY : OUT STD_LOGIC;
    s_axi_ctrl_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CTRL_DATA_WIDTH-1 downto 0);
    s_axi_ctrl_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CTRL_DATA_WIDTH/8-1 downto 0);
    s_axi_ctrl_ARVALID : IN STD_LOGIC;
    s_axi_ctrl_ARREADY : OUT STD_LOGIC;
    s_axi_ctrl_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CTRL_ADDR_WIDTH-1 downto 0);
    s_axi_ctrl_RVALID : OUT STD_LOGIC;
    s_axi_ctrl_RREADY : IN STD_LOGIC;
    s_axi_ctrl_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CTRL_DATA_WIDTH-1 downto 0);
    s_axi_ctrl_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_ctrl_BVALID : OUT STD_LOGIC;
    s_axi_ctrl_BREADY : IN STD_LOGIC;
    s_axi_ctrl_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    interrupt : OUT STD_LOGIC );
end;


architecture behav of dummy1 is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "dummy1,hls_ip_2017_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvu095-ffvc1517-2-e,HLS_INPUT_CLOCK=3.333330,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.916664,HLS_SYN_LAT=7,HLS_SYN_TPT=none,HLS_SYN_MEM=2,HLS_SYN_DSP=0,HLS_SYN_FF=698,HLS_SYN_LUT=842}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (7 downto 0) := "00000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (7 downto 0) := "00000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (7 downto 0) := "00001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (7 downto 0) := "00010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (7 downto 0) := "00100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (7 downto 0) := "01000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant C_M_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_F : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_start : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_ready : STD_LOGIC;
    signal addr : STD_LOGIC_VECTOR (31 downto 0);
    signal val_r : STD_LOGIC_VECTOR (31 downto 0);
    signal gmem_blk_n_AW : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal gmem_blk_n_W : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal gmem_blk_n_B : STD_LOGIC;
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal gmem_AWVALID : STD_LOGIC;
    signal gmem_AWREADY : STD_LOGIC;
    signal gmem_WVALID : STD_LOGIC;
    signal gmem_WREADY : STD_LOGIC;
    signal gmem_ARREADY : STD_LOGIC;
    signal gmem_RVALID : STD_LOGIC;
    signal gmem_RDATA : STD_LOGIC_VECTOR (31 downto 0);
    signal gmem_RLAST : STD_LOGIC;
    signal gmem_RID : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem_RUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem_RRESP : STD_LOGIC_VECTOR (1 downto 0);
    signal gmem_BVALID : STD_LOGIC;
    signal gmem_BREADY : STD_LOGIC;
    signal gmem_BRESP : STD_LOGIC_VECTOR (1 downto 0);
    signal gmem_BID : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem_BUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal val_read_reg_73 : STD_LOGIC_VECTOR (31 downto 0);
    signal addr_read_reg_78 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sig_ioackin_gmem_AWREADY : STD_LOGIC;
    signal tmp_fu_63_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_reg_ioackin_gmem_AWREADY : STD_LOGIC := '0';
    signal ap_reg_ioackin_gmem_WREADY : STD_LOGIC := '0';
    signal ap_sig_ioackin_gmem_WREADY : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (7 downto 0);

    component dummy1_ctrl_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC;
        addr : OUT STD_LOGIC_VECTOR (31 downto 0);
        val_r : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component dummy1_gmem_m_axi IS
    generic (
        USER_DW : INTEGER;
        USER_AW : INTEGER;
        USER_MAXREQS : INTEGER;
        NUM_READ_OUTSTANDING : INTEGER;
        NUM_WRITE_OUTSTANDING : INTEGER;
        MAX_READ_BURST_LENGTH : INTEGER;
        MAX_WRITE_BURST_LENGTH : INTEGER;
        C_M_AXI_ID_WIDTH : INTEGER;
        C_M_AXI_ADDR_WIDTH : INTEGER;
        C_M_AXI_DATA_WIDTH : INTEGER;
        C_M_AXI_AWUSER_WIDTH : INTEGER;
        C_M_AXI_ARUSER_WIDTH : INTEGER;
        C_M_AXI_WUSER_WIDTH : INTEGER;
        C_M_AXI_RUSER_WIDTH : INTEGER;
        C_M_AXI_BUSER_WIDTH : INTEGER;
        C_TARGET_ADDR : INTEGER;
        C_USER_VALUE : INTEGER;
        C_PROT_VALUE : INTEGER;
        C_CACHE_VALUE : INTEGER );
    port (
        AWVALID : OUT STD_LOGIC;
        AWREADY : IN STD_LOGIC;
        AWADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_ADDR_WIDTH-1 downto 0);
        AWID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        AWLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
        AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_AWUSER_WIDTH-1 downto 0);
        WVALID : OUT STD_LOGIC;
        WREADY : IN STD_LOGIC;
        WDATA : OUT STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : OUT STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH/8-1 downto 0);
        WLAST : OUT STD_LOGIC;
        WID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        WUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_WUSER_WIDTH-1 downto 0);
        ARVALID : OUT STD_LOGIC;
        ARREADY : IN STD_LOGIC;
        ARADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_ADDR_WIDTH-1 downto 0);
        ARID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        ARLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
        ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_ARUSER_WIDTH-1 downto 0);
        RVALID : IN STD_LOGIC;
        RREADY : OUT STD_LOGIC;
        RDATA : IN STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH-1 downto 0);
        RLAST : IN STD_LOGIC;
        RID : IN STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        RUSER : IN STD_LOGIC_VECTOR (C_M_AXI_RUSER_WIDTH-1 downto 0);
        RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        BVALID : IN STD_LOGIC;
        BREADY : OUT STD_LOGIC;
        BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        BID : IN STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        BUSER : IN STD_LOGIC_VECTOR (C_M_AXI_BUSER_WIDTH-1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        I_ARVALID : IN STD_LOGIC;
        I_ARREADY : OUT STD_LOGIC;
        I_ARADDR : IN STD_LOGIC_VECTOR (63 downto 0);
        I_ARID : IN STD_LOGIC_VECTOR (0 downto 0);
        I_ARLEN : IN STD_LOGIC_VECTOR (31 downto 0);
        I_ARSIZE : IN STD_LOGIC_VECTOR (2 downto 0);
        I_ARLOCK : IN STD_LOGIC_VECTOR (1 downto 0);
        I_ARCACHE : IN STD_LOGIC_VECTOR (3 downto 0);
        I_ARQOS : IN STD_LOGIC_VECTOR (3 downto 0);
        I_ARPROT : IN STD_LOGIC_VECTOR (2 downto 0);
        I_ARUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        I_ARBURST : IN STD_LOGIC_VECTOR (1 downto 0);
        I_ARREGION : IN STD_LOGIC_VECTOR (3 downto 0);
        I_RVALID : OUT STD_LOGIC;
        I_RREADY : IN STD_LOGIC;
        I_RDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
        I_RID : OUT STD_LOGIC_VECTOR (0 downto 0);
        I_RUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        I_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        I_RLAST : OUT STD_LOGIC;
        I_AWVALID : IN STD_LOGIC;
        I_AWREADY : OUT STD_LOGIC;
        I_AWADDR : IN STD_LOGIC_VECTOR (63 downto 0);
        I_AWID : IN STD_LOGIC_VECTOR (0 downto 0);
        I_AWLEN : IN STD_LOGIC_VECTOR (31 downto 0);
        I_AWSIZE : IN STD_LOGIC_VECTOR (2 downto 0);
        I_AWLOCK : IN STD_LOGIC_VECTOR (1 downto 0);
        I_AWCACHE : IN STD_LOGIC_VECTOR (3 downto 0);
        I_AWQOS : IN STD_LOGIC_VECTOR (3 downto 0);
        I_AWPROT : IN STD_LOGIC_VECTOR (2 downto 0);
        I_AWUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        I_AWBURST : IN STD_LOGIC_VECTOR (1 downto 0);
        I_AWREGION : IN STD_LOGIC_VECTOR (3 downto 0);
        I_WVALID : IN STD_LOGIC;
        I_WREADY : OUT STD_LOGIC;
        I_WDATA : IN STD_LOGIC_VECTOR (31 downto 0);
        I_WID : IN STD_LOGIC_VECTOR (0 downto 0);
        I_WUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        I_WLAST : IN STD_LOGIC;
        I_WSTRB : IN STD_LOGIC_VECTOR (3 downto 0);
        I_BVALID : OUT STD_LOGIC;
        I_BREADY : IN STD_LOGIC;
        I_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        I_BID : OUT STD_LOGIC_VECTOR (0 downto 0);
        I_BUSER : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;



begin
    dummy1_ctrl_s_axi_U : component dummy1_ctrl_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CTRL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CTRL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_ctrl_AWVALID,
        AWREADY => s_axi_ctrl_AWREADY,
        AWADDR => s_axi_ctrl_AWADDR,
        WVALID => s_axi_ctrl_WVALID,
        WREADY => s_axi_ctrl_WREADY,
        WDATA => s_axi_ctrl_WDATA,
        WSTRB => s_axi_ctrl_WSTRB,
        ARVALID => s_axi_ctrl_ARVALID,
        ARREADY => s_axi_ctrl_ARREADY,
        ARADDR => s_axi_ctrl_ARADDR,
        RVALID => s_axi_ctrl_RVALID,
        RREADY => s_axi_ctrl_RREADY,
        RDATA => s_axi_ctrl_RDATA,
        RRESP => s_axi_ctrl_RRESP,
        BVALID => s_axi_ctrl_BVALID,
        BREADY => s_axi_ctrl_BREADY,
        BRESP => s_axi_ctrl_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle,
        addr => addr,
        val_r => val_r);

    dummy1_gmem_m_axi_U : component dummy1_gmem_m_axi
    generic map (
        USER_DW => 32,
        USER_AW => 64,
        USER_MAXREQS => 5,
        NUM_READ_OUTSTANDING => 16,
        NUM_WRITE_OUTSTANDING => 16,
        MAX_READ_BURST_LENGTH => 16,
        MAX_WRITE_BURST_LENGTH => 16,
        C_M_AXI_ID_WIDTH => C_M_AXI_GMEM_ID_WIDTH,
        C_M_AXI_ADDR_WIDTH => C_M_AXI_GMEM_ADDR_WIDTH,
        C_M_AXI_DATA_WIDTH => C_M_AXI_GMEM_DATA_WIDTH,
        C_M_AXI_AWUSER_WIDTH => C_M_AXI_GMEM_AWUSER_WIDTH,
        C_M_AXI_ARUSER_WIDTH => C_M_AXI_GMEM_ARUSER_WIDTH,
        C_M_AXI_WUSER_WIDTH => C_M_AXI_GMEM_WUSER_WIDTH,
        C_M_AXI_RUSER_WIDTH => C_M_AXI_GMEM_RUSER_WIDTH,
        C_M_AXI_BUSER_WIDTH => C_M_AXI_GMEM_BUSER_WIDTH,
        C_TARGET_ADDR => C_M_AXI_GMEM_TARGET_ADDR,
        C_USER_VALUE => C_M_AXI_GMEM_USER_VALUE,
        C_PROT_VALUE => C_M_AXI_GMEM_PROT_VALUE,
        C_CACHE_VALUE => C_M_AXI_GMEM_CACHE_VALUE)
    port map (
        AWVALID => m_axi_gmem_AWVALID,
        AWREADY => m_axi_gmem_AWREADY,
        AWADDR => m_axi_gmem_AWADDR,
        AWID => m_axi_gmem_AWID,
        AWLEN => m_axi_gmem_AWLEN,
        AWSIZE => m_axi_gmem_AWSIZE,
        AWBURST => m_axi_gmem_AWBURST,
        AWLOCK => m_axi_gmem_AWLOCK,
        AWCACHE => m_axi_gmem_AWCACHE,
        AWPROT => m_axi_gmem_AWPROT,
        AWQOS => m_axi_gmem_AWQOS,
        AWREGION => m_axi_gmem_AWREGION,
        AWUSER => m_axi_gmem_AWUSER,
        WVALID => m_axi_gmem_WVALID,
        WREADY => m_axi_gmem_WREADY,
        WDATA => m_axi_gmem_WDATA,
        WSTRB => m_axi_gmem_WSTRB,
        WLAST => m_axi_gmem_WLAST,
        WID => m_axi_gmem_WID,
        WUSER => m_axi_gmem_WUSER,
        ARVALID => m_axi_gmem_ARVALID,
        ARREADY => m_axi_gmem_ARREADY,
        ARADDR => m_axi_gmem_ARADDR,
        ARID => m_axi_gmem_ARID,
        ARLEN => m_axi_gmem_ARLEN,
        ARSIZE => m_axi_gmem_ARSIZE,
        ARBURST => m_axi_gmem_ARBURST,
        ARLOCK => m_axi_gmem_ARLOCK,
        ARCACHE => m_axi_gmem_ARCACHE,
        ARPROT => m_axi_gmem_ARPROT,
        ARQOS => m_axi_gmem_ARQOS,
        ARREGION => m_axi_gmem_ARREGION,
        ARUSER => m_axi_gmem_ARUSER,
        RVALID => m_axi_gmem_RVALID,
        RREADY => m_axi_gmem_RREADY,
        RDATA => m_axi_gmem_RDATA,
        RLAST => m_axi_gmem_RLAST,
        RID => m_axi_gmem_RID,
        RUSER => m_axi_gmem_RUSER,
        RRESP => m_axi_gmem_RRESP,
        BVALID => m_axi_gmem_BVALID,
        BREADY => m_axi_gmem_BREADY,
        BRESP => m_axi_gmem_BRESP,
        BID => m_axi_gmem_BID,
        BUSER => m_axi_gmem_BUSER,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        I_ARVALID => ap_const_logic_0,
        I_ARREADY => gmem_ARREADY,
        I_ARADDR => ap_const_lv64_0,
        I_ARID => ap_const_lv1_0,
        I_ARLEN => ap_const_lv32_0,
        I_ARSIZE => ap_const_lv3_0,
        I_ARLOCK => ap_const_lv2_0,
        I_ARCACHE => ap_const_lv4_0,
        I_ARQOS => ap_const_lv4_0,
        I_ARPROT => ap_const_lv3_0,
        I_ARUSER => ap_const_lv1_0,
        I_ARBURST => ap_const_lv2_0,
        I_ARREGION => ap_const_lv4_0,
        I_RVALID => gmem_RVALID,
        I_RREADY => ap_const_logic_0,
        I_RDATA => gmem_RDATA,
        I_RID => gmem_RID,
        I_RUSER => gmem_RUSER,
        I_RRESP => gmem_RRESP,
        I_RLAST => gmem_RLAST,
        I_AWVALID => gmem_AWVALID,
        I_AWREADY => gmem_AWREADY,
        I_AWADDR => tmp_fu_63_p1,
        I_AWID => ap_const_lv1_0,
        I_AWLEN => ap_const_lv32_1,
        I_AWSIZE => ap_const_lv3_0,
        I_AWLOCK => ap_const_lv2_0,
        I_AWCACHE => ap_const_lv4_0,
        I_AWQOS => ap_const_lv4_0,
        I_AWPROT => ap_const_lv3_0,
        I_AWUSER => ap_const_lv1_0,
        I_AWBURST => ap_const_lv2_0,
        I_AWREGION => ap_const_lv4_0,
        I_WVALID => gmem_WVALID,
        I_WREADY => gmem_WREADY,
        I_WDATA => val_read_reg_73,
        I_WID => ap_const_lv1_0,
        I_WUSER => ap_const_lv1_0,
        I_WLAST => ap_const_logic_0,
        I_WSTRB => ap_const_lv4_F,
        I_BVALID => gmem_BVALID,
        I_BREADY => gmem_BREADY,
        I_BRESP => gmem_BRESP,
        I_BID => gmem_BID,
        I_BUSER => gmem_BUSER);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_reg_ioackin_gmem_AWREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ioackin_gmem_AWREADY <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                    if ((ap_sig_ioackin_gmem_AWREADY = ap_const_logic_1)) then 
                        ap_reg_ioackin_gmem_AWREADY <= ap_const_logic_0;
                    elsif ((ap_const_logic_1 = gmem_AWREADY)) then 
                        ap_reg_ioackin_gmem_AWREADY <= ap_const_logic_1;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ioackin_gmem_WREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ioackin_gmem_WREADY <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                    if ((ap_sig_ioackin_gmem_WREADY = ap_const_logic_1)) then 
                        ap_reg_ioackin_gmem_WREADY <= ap_const_logic_0;
                    elsif ((ap_const_logic_1 = gmem_WREADY)) then 
                        ap_reg_ioackin_gmem_WREADY <= ap_const_logic_1;
                    end if;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                addr_read_reg_78 <= addr;
                val_read_reg_73 <= val_r;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state8, gmem_BVALID, ap_sig_ioackin_gmem_AWREADY, ap_sig_ioackin_gmem_WREADY)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_sig_ioackin_gmem_AWREADY = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_sig_ioackin_gmem_WREADY = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state8) and (gmem_BVALID = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state8;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);

    ap_done_assign_proc : process(ap_CS_fsm_state8, gmem_BVALID)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) and (gmem_BVALID = ap_const_logic_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state8, gmem_BVALID)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) and (gmem_BVALID = ap_const_logic_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    ap_sig_ioackin_gmem_AWREADY_assign_proc : process(gmem_AWREADY, ap_reg_ioackin_gmem_AWREADY)
    begin
        if ((ap_const_logic_0 = ap_reg_ioackin_gmem_AWREADY)) then 
            ap_sig_ioackin_gmem_AWREADY <= gmem_AWREADY;
        else 
            ap_sig_ioackin_gmem_AWREADY <= ap_const_logic_1;
        end if; 
    end process;


    ap_sig_ioackin_gmem_WREADY_assign_proc : process(gmem_WREADY, ap_reg_ioackin_gmem_WREADY)
    begin
        if ((ap_const_logic_0 = ap_reg_ioackin_gmem_WREADY)) then 
            ap_sig_ioackin_gmem_WREADY <= gmem_WREADY;
        else 
            ap_sig_ioackin_gmem_WREADY <= ap_const_logic_1;
        end if; 
    end process;


    gmem_AWVALID_assign_proc : process(ap_CS_fsm_state2, ap_reg_ioackin_gmem_AWREADY)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_logic_0 = ap_reg_ioackin_gmem_AWREADY))) then 
            gmem_AWVALID <= ap_const_logic_1;
        else 
            gmem_AWVALID <= ap_const_logic_0;
        end if; 
    end process;


    gmem_BREADY_assign_proc : process(ap_CS_fsm_state8, gmem_BVALID)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) and (gmem_BVALID = ap_const_logic_1))) then 
            gmem_BREADY <= ap_const_logic_1;
        else 
            gmem_BREADY <= ap_const_logic_0;
        end if; 
    end process;


    gmem_WVALID_assign_proc : process(ap_CS_fsm_state3, ap_reg_ioackin_gmem_WREADY)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_logic_0 = ap_reg_ioackin_gmem_WREADY))) then 
            gmem_WVALID <= ap_const_logic_1;
        else 
            gmem_WVALID <= ap_const_logic_0;
        end if; 
    end process;


    gmem_blk_n_AW_assign_proc : process(m_axi_gmem_AWREADY, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            gmem_blk_n_AW <= m_axi_gmem_AWREADY;
        else 
            gmem_blk_n_AW <= ap_const_logic_1;
        end if; 
    end process;


    gmem_blk_n_B_assign_proc : process(m_axi_gmem_BVALID, ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            gmem_blk_n_B <= m_axi_gmem_BVALID;
        else 
            gmem_blk_n_B <= ap_const_logic_1;
        end if; 
    end process;


    gmem_blk_n_W_assign_proc : process(m_axi_gmem_WREADY, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            gmem_blk_n_W <= m_axi_gmem_WREADY;
        else 
            gmem_blk_n_W <= ap_const_logic_1;
        end if; 
    end process;

        tmp_fu_63_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(addr_read_reg_78),64));

end behav;
