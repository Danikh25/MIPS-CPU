read_vhdl  { ../next_address_board.vhd }
read_xdc next_address.xdc
synth_design -top next_address_board -part xc7a100tcsg324-1

opt_design
place_design
route_design

report_timing_summary
write_bitstream -force next_address_board.bit
