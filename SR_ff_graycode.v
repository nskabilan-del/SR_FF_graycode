`include "srff.v"
module srffgray1(clk,rst,c);
input clk,rst;
output  [2:0]c;

and g1(n1,c[1],~c[0]);
and g2(n2,~c[1],~c[0]);

and g3(n3,~c[2],c[0]);
and g4(n4,c[2],c[0]);

xnor g5(n5,c[2],c[1]);
xor g6(n6,c[2],c[1]);

srff u2(clk,rst,n1,n2,c[2]);
srff u1(clk,rst,n3,n4,c[1]);
srff u0(clk,rst,n5,n6,c[0]);
endmodule