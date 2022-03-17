set clock_cycle 1
set io_delay 0.2

set clock_port0 clk_core1
set clock_port1 clk_core2

create_clock -name clk_core1 -period $clock_cycle [get_ports $clock_port0]
create_clock -name clk_core2 -period $clock_cycle [get_ports $clock_port1]

#set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [all_inputs]
set_input_delay $io_delay -clock $clock_port0 [all_inputs]
set_input_delay $io_delay -clock $clock_port1 [all_inputs]
set_output_delay $io_delay -clock $clock_port0 [all_outputs]
set_output_delay $io_delay -clock $clock_port1 [all_outputs]

#set_multicycle_path -setup 4 -from [get_cells {core_instance/psum_mem_instance/Q_reg*}] -to [get_cells {core_instance/sfp_instance/sfp_out_sign*_reg*}]
#set_multicycle_path -hold 3 -from [get_cells {core_instance/psum_mem_instance/Q_reg*}] -to [get_cells {core_instance/sfp_instance/sfp_out_sign*_reg*}]
#set_multicycle_path -setup 4-from [get_cells {core_instance/sfp_instance/fifo_inst_int/rd_ptr_reg*}] -to [get_cells {core_instance/sfp_instance/sfp_out_sign*_reg*}]
#set_multicycle_path -hold 3 -from [get_cells {core_instance/sfp_instance/fifo_inst_int/rd_ptr_reg*}] -to [get_cells {core_instance/sfp_instance/sfp_out_sign*_reg*}]
#set_multicycle_path -hold 3 -from [get_cells {core_instance/sfp_instance/fifo_inst_int/q*_reg*}] -to [get_cells {core_instance/sfp_instance/sfp_out_sign*_reg*}]
#set_multicycle_path -setup 4-from [get_cells {core_instance/sfp_instance/fifo_inst_int/q*_reg*}] -to [get_cells {core_instance/sfp_instance/sfp_out_sign*_reg*}]

set_multicycle_path -setup 4 -from [get_pins {core_instance*/psum_mem_instance/Q_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sfp_out_sign*_reg*/D}]
set_multicycle_path -hold 3 -from [get_pins {core_instance*/psum_mem_instance/Q_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sfp_out_sign*_reg*/D}]
set_multicycle_path -setup 2 -from [get_pins {core_instance*/psum_mem_instance/Q_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sum_q_upper_reg*/D}]
set_multicycle_path -hold 1 -from [get_pins {core_instance*/psum_mem_instance/Q_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sum_q_upper_reg*/D}]
set_multicycle_path -setup 2 -from [get_pins {core_instance*/psum_mem_instance/Q_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sum_q_lower_reg*/D}]
set_multicycle_path -hold 1 -from [get_pins {core_instance*/psum_mem_instance/Q_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sum_q_lower_reg*/D}]
set_multicycle_path -setup 2 -from [get_pins {core_instance*/sfp_instance/sum_q_upper_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sum_q_reg*/D}]
set_multicycle_path -hold 1 -from [get_pins {core_instance*/sfp_instance/sum_q_upper_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sum_q_reg*/D}]
set_multicycle_path -setup 2 -from [get_pins {core_instance*/sfp_instance/sum_q_lower_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sum_q_reg*/D}]
set_multicycle_path -hold 1 -from [get_pins {core_instance*/sfp_instance/sum_q_lower_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sum_q_reg*/D}]
set_multicycle_path -setup 3  -from [get_pins {core_instance*/sfp_instance/fifo_inst_int/rd_ptr_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sfp_out_sign*_reg*/D}]
set_multicycle_path -hold 2 -from [get_pins {core_instance*/sfp_instance/fifo_inst_int/rd_ptr_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sfp_out_sign*_reg*/D}]
set_multicycle_path -setup 3  -from [get_pins {core_instance*/sfp_instance/fifo_inst_ext/rd_ptr_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sfp_out_sign*_reg*/D}]
set_multicycle_path -hold 2 -from [get_pins {core_instance*/sfp_instance/fifo_inst_ext/rd_ptr_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sfp_out_sign*_reg*/D}]
set_multicycle_path -setup 3 -from [get_pins {core_instance*/sfp_instance/fifo_inst_int/q*_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sfp_out_sign*_reg*/D}]
set_multicycle_path -hold 2 -from [get_pins {core_instance*/sfp_instance/fifo_inst_int/q*_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sfp_out_sign*_reg*/D}]
set_multicycle_path -setup 3 -from [get_pins {core_instance*/sfp_instance/fifo_inst_ext/q*_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sfp_out_sign*_reg*/D}]
set_multicycle_path -hold 2 -from [get_pins {core_instance*/sfp_instance/fifo_inst_ext/q*_reg*/CP}] -to [get_pins {core_instance*/sfp_instance/sfp_out_sign*_reg*/D}]
set_multicycle_path -setup 2 -from [get_pins {core_instance*/mac_array_instance/col_idx_*_mac_col_inst/mac_16in_instance/product*_reg_reg*/CP}] -to [get_pins {core_instance*/ofifo_inst/col_idx_*_fifo_instance/q*_reg*/D}]
set_multicycle_path -hold 1 -from [get_pins {core_instance*/mac_array_instance/col_idx_*_mac_col_inst/mac_16in_instance/product*_reg_reg*/CP}] -to [get_pins {core_instance*/ofifo_inst/col_idx_*_fifo_instance/q*_reg*/D}]
set_multicycle_path -setup 2 -from [get_pins {core_instance*/mac_array_instance/col_idx_*_mac_col_inst/query_q_reg_*/CP}] -to [get_pins {core_instance*/mac_array_instance/col_idx_*_mac_col_inst/mac_16in_instance/product*_reg_reg*/D}]
set_multicycle_path -hold 1 -from [get_pins {core_instance*/mac_array_instance/col_idx_*_mac_col_inst/query_q_reg_*/CP}] -to [get_pins {core_instance*/mac_array_instance/col_idx_*_mac_col_inst/mac_16in_instance/product*_reg_reg*/D}]
set_multicycle_path -setup 2 -from [get_pins {core_instance*/mac_array_instance/col_idx_*_mac_col_inst/key_q_reg_*/CP}] -to [get_pins {core_instance*/mac_array_instance/col_idx_*_mac_col_inst/mac_16in_instance/product*_reg_reg*/D}]
set_multicycle_path -hold 1 -from [get_pins {core_instance*/mac_array_instance/col_idx_*_mac_col_inst/key_q_reg_*/CP}] -to [get_pins {core_instance*/mac_array_instance/col_idx_*_mac_col_inst/mac_16in_instance/product*_reg_reg*/D}]

