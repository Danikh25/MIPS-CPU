add wave reset
add wave clk
add wave din
add wave write
add wave read_a
add wave read_b
add wave write_address
add wave out_a
add wave out_b


#Assert reset to 1 
force reset 1
force clk 0
force write 0
force write_address "00001"
force read_a "00000"
force read_b "00001"
run 2

# Asserting write to 0 and reset 0
force reset 0
force clk 1
force din X"FAFA3B3B"
force write 0
force write_address "00001"
force read_a "00000"
force read_b "00001"
run 2

#Asserting clk to 0 
force reset 0
force clk 0
force din X"FAFA3B3B"
force write 1
force write_address "00001"
force read_a "00000"
force read_b "00001"
run 2

#Test1: Writting "FAFA3B3B" into R0
force reset 0
force clk 1
force din X"FAFA3B3B"
force write 1
force write_address "00000"
force read_a "00000"
force read_b "00001"
run 2

#Test2: Writting "0000AAAA" into R10
force clk 0
run 2

force reset 0
force clk 1
force din X"0000AAAA"
force write 1
force write_address "01010"
force read_a "00001"
force read_b "01010"
run 2

#Test3: Writting "0000BBBB" into R20
force clk 0
run 2

force reset 0
force clk 1
force din X"0000BBBB"
force write 1
force write_address "10100"
force read_a "10100"
force read_b "00100"
run 2

#Test4: Writting "0F0F0F0F" into R25
force clk 0
run 2

force reset 0
force clk 1
force din X"0F0F0F0F"
force write 1
force write_address "11001"
force read_a "01110"
force read_b "11001"
run 2

#Test5: Writting "0000CCCC" into R31
force clk 0
run 2

force reset 0
force clk 1
force din X"0000CCCC"
force write 1
force write_address "11111"
force read_a "11000"
force read_b "11111"
run 2
