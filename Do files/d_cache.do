#Testing d_cache for the following cases:

add wave din
add wave clk
add wave reset 
add wave data_write
add wave address
add wave d_out
add wave reg_array(0)
add wave reg_array(1)


#Test1: Reset
force din X"AAAAAAAA"
force reset 1
force clk 0 
force data_write 1 
force address "00000"
run 2
examine -radix hex reg_array(0) -radix hex d_out

#Test2: Writing "AAAAAAAA" into reg(0)

force din X"AAAAAAAA" 
force reset 0
force clk 1
force data_write 1
force address "00000"
run 2
examine -radix hex reg_array(0) -radix hex d_out

#Test3: Reading content of a random register
force clk 0
run 2

force reset 0
force clk 1
force data_write 0
force address "00001"
run 2
examine -radix hex reg_array(1) -radix hex d_out

#Test4: Reading content of R0
force clk 0
run 2

force reset 0
force clk 1
force data_write 0
force address "00000"
run 2
examine -radix hex reg_array(0) -radix hex d_out
