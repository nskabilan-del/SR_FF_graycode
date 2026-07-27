`include "srffgray1.v"
module tb_srffgray1;
reg clk,rst;
wire  [2:0]c;
srffgray1 dut (clk,rst,c);
 
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