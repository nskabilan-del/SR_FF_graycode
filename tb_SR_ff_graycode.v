`include "SR_ff_graycode.v"
module tb_SR_ff_graycode;
reg clk,rst;
wire  [2:0]c;
SR_ff_graycode dut (clk,rst,c);
 
 initial begin
 clk=0;
 forever #5 clk=~clk;
 end
 initial begin 
 rst=1;
 #10;
 rst=0;
 #1000;
 $finish;
 end 
 endmodule