// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module fullchip (clk_core1, clk_core2, mem_in_core1, mem_in_core2, inst, reset, acc, div, wr_norm, fifo_ext_rd, out_core1, out_core2);

parameter col = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+4;
parameter pr = 16;

input  clk_core1;
input  clk_core2;

input  [pr*bw-1:0] mem_in_core1; 
input  [pr*bw-1:0] mem_in_core2; 
input  [16:0] inst; 
input  reset;
input  acc, div, wr_norm;
input fifo_ext_rd;
//output [col*bw_psum-1:0] out;
output [col*bw_psum-1:0] out_core1;
output [col*bw_psum-1:0] out_core2;
wire [bw_psum+3:0] sum_out_core1;
wire [bw_psum+3:0] sum_out_core2;

core #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) core_instance1 (
      .reset(reset), 
      .clk(clk_core1),
      .fifo_ext_rd_clk(clk_core2), 
      .mem_in(mem_in_core1), 
      .inst(inst),
      .acc(acc),
      .div(div),
      .out(out_core1),
      .wr_norm(wr_norm),
      .sum_in(sum_out_core2),
      .sum_out(sum_out_core1),
      .fifo_ext_rd(fifo_ext_rd)
);


core #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) core_instance2 (
      .reset(reset), 
      .clk(clk_core2), 
      .fifo_ext_rd_clk(clk_core1), 
      .mem_in(mem_in_core2), 
      .inst(inst),
      .acc(acc),
      .div(div),
      .out(out_core2),
      .wr_norm(wr_norm),
      .sum_in(sum_out_core1),
      .sum_out(sum_out_core2),
      .fifo_ext_rd(fifo_ext_rd)

);

endmodule
