#Testing i_cache for the following  opcodes:
#when "00000" => instruction_out <= "00100000000000010000000000000001"; -- addi r1, r0, 1
#when "00001" => instruction_out <= "00100000000000100000000000000010"; -- addi r2, r0, 2
#when "00010" => instruction_out <= "00000000010000010001000000100000";-- add r2, r2, r1
#when "00011" => instruction_out <= "00001000000000000000000000000010"; -- jump 00010
#when others => instruction_out <= "00000000000000000000000000000000"; -- dont care

add wave address_in
add wave instruction_out


force address_in "00000" 
run 2
examine instruction_out

force address_in "00001"
run 2
examine instruction_out

force address_in "00010" 
run 2
examine instruction_out

force address_in "00011" 
run 2
examine instruction_out

force address_in "00100" 
run 2
examine instruction_out
