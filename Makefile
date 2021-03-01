DCP = static_routed_v2.dcp
PR_SRCS = conv_test/conv_layer.cpp conv_test/conv_layer.h fc_test/fc_layer.cpp fc_test/fc_layer.h 8v3_shell/create_pr2_nn.tcl 8v3_shell/create_pr2_0.tcl 8v3_shell/create_pr2_1.tcl 8v3_shell/pr_region_2_bd.tcl
PROJNAME = pr_region_test_proj 



all: conv_layer fc_layer hw_conv_layer hw_fc_layer

conv_layer: conv_test/* util/*
	g++ conv_test/*.cpp conv_test/*.c util/*.cpp -I conv_test -I./ -o conv_layer -std=c++11

hw_conv_layer: conv_test/* util/*
	g++ -DHW_TEST conv_test/*.cpp conv_test/*.c util/*.cpp -I conv_test -I./ -o hw_conv_layer -std=c++11

fc_layer: fc_test/* util/*
	g++ fc_test/*.cpp fc_test/*.c util/*.cpp -I fc_test -I./ -o fc_layer -std=c++11

hw_fc_layer: fc_test/* util/*
	g++ -g -DHW_TEST fc_test/*.cpp fc_test/*.c util/*.cpp -I fc_test -I./ -o hw_fc_layer -std=c++11


conv_hls: conv_test/* util/* 
	vivado_hls hls_proj/conv_hls.tcl

fc_hls: fc_test/*  util/*
	vivado_hls hls_proj/fc_hls.tcl

pr:     $(PR_SRCS) dcp conv_hls fc_hls 
	vivado -mode batch -source 8v3_shell/create_pr2_nn.tcl -tclargs $(DCP) $(PROJNAME)  0 

pr_modify: $(PR_SRCS) dcp conv_hls fc_hls 
	vivado -mode gui -source 8v3_shell/create_pr2_nn.tcl -tclargs $(DCP) $(PROJNAME)  1




static:
	vivado -mode tcl -source 8v3_shell/create_mig_shell.tcl 


clean_sw: 
	@rm -rf fc_layer hw_fc_layer conv_layer hw_conv_layer

clean_pr:
	@rm -rf 8v3_shell/pr_region_test_proj 

clean_static:
	@rm -rf 8v3_shell/mig_shell_ila_proj

clean_dcp:
	@rm -rf 8v3_shell/$(DCP)


dcp: 
	@ls 8v3_shell/$(DCP) 2> /dev/null &&  echo "DCP file exists" || echo "Error: No DCP file found!"       

