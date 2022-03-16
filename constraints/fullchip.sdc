set clock_cycle 1
set io_delay 0.2 

set clock_port0 clk_core1
set clock_port1 clk_core2

create_clock -name clk_core1 -period $clock_cycle [get_ports $clock_port0]
create_clock -name clk_core2 -period $clock_cycle [get_ports $clock_port1]

set_input_delay  $io_delay -clock $clock_port0 [remove_from_collection [all_inputs] [get_ports $clock_port0]] 
set_output_delay $io_delay -clock $clock_port0 [remove_from_collection [all_outputs] [get_ports $clock_port0]]
