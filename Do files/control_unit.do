add wave -radix unsigned op
add wave -radix unsigned fn
add wave reg_write 
add wave reg_dst
add wave reg_in_src
add wave alu_src
add wave add_sub
add wave data_write
add wave logic_func
add wave func
add wave branch_type
add wave pc_sel


#   Testing the control_unit
#   The values should correspond with the control signals table in the lab report

#   Test Case 1 - lui
force op "001111"
run 2
examine reg_write reg_dst reg_in_src alu_src add_sub data_write logic_func func branch_type pc_sel

#   Test Case 2 - and
force op "000000"
force fn "100100"
run 2
examine reg_write reg_dst reg_in_src alu_src add_sub data_write logic_func func branch_type pc_sel

# test case 3 - jr
force op "001000"
run 2
examine reg_write reg_dst reg_in_src alu_src add_sub data_write logic_func func branch_type pc_sel

# Test case 4 - beq
force op "000100"
run 2
examine reg_write reg_dst reg_in_src alu_src add_sub data_write logic_func func branch_type pc_sel

#Test case 5 - sw
force op "101011"
run 2
examine reg_write reg_dst reg_in_src alu_src add_sub data_write logic_func func branch_type pc_sel
