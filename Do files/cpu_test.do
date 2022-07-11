add wave pc_out_32bits
add wave rs_out_32bits
add wave rt_out_32bits

force reset 1
force clk 0
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
echo pc_out | inst_out_signal | rs_out | rt_out
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits inst_out_signal rs_out_32bits rt_out_32bits

force reset 0
force clk 0
run 2
force clk 1
run 2
examine pc_out_32bits sig_inst_out rs_out_32bits rt_out_32bits

force reset_cpu 0
force clk_cpu 0
run 2
force clk_cpu 1
run 2
examine pc_out_32bits sig_inst_out rs_out_32bits rt_out_32bits

force reset_cpu 0
force clk_cpu 0
run 2
force clk_cpu 1
run 2
examine pc_out_32bits sig_inst_out sig_reg_in_src_out

force reset_cpu 0
force clk_cpu 0
run 2
force clk_cpu 1
run 2
examine pc_out_32bits sig_inst_out sig_reg_in_src_out

force reset_cpu 0
force clk_cpu 0
run 2
force clk_cpu 1
run 2
examine pc_out sig_instruction_out sig_reg_in_src_out

force reset_cpu 0
force clk_cpu 0
run 2
force clk_cpu 1
run 2
examine pc_out sig_instruction_out sig_reg_in_src_out

force reset_cpu 0
force clk_cpu 0
run 2
force clk_cpu 1
run 2
examine pc_out sig_instruction_out sig_reg_in_src_out

force reset_cpu 0
force clk_cpu 0
run 2
force clk_cpu 1
run 2
examine pc_out sig_instruction_out sig_reg_in_src_out

force reset_cpu 0
force clk_cpu 0
run 2
force clk_cpu 1
run 2
examine pc_out sig_instruction_out sig_reg_in_src_out
