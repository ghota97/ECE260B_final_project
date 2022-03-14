
set clock_cycle 1.0
set io_delay 0.2 

set clock_port clk

create_clock -name clk -period $clock_cycle [get_ports $clock_port]

#set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [all_inputs]
set_input_delay $io_delay -clock $clock_port [all_inputs]
set_output_delay $io_delay -clock $clock_port [all_outputs]

set_multicycle_path 3 -setup -from core_instance/psum_mem_instance/Q_reg[*]/CP -to core_instance/sfp_instance/sfp_out_sign0_reg[*]/D
set_multicycle_path 2 -hold -from core_instance/psum_mem_instance/Q_reg*/CP -to core_instance/sfp_instance/sfp_out_sign0_reg*/D
set_multicycle_path 3 -setup -from core_instance/sfp_instance/fifo_inst_int/rd_ptr_reg*/CP -to core_instance/sfp_instance/sfp_out_sign0_reg*/D
set_multicycle_path 2 -hold -from core_instance/sfp_instance/fifo_inst_int/rd_ptr_reg*/CP -to core_instance/sfp_instance/sfp_out_sign0_reg*/D

