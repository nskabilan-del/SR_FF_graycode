module srff(clk,rst,s,r,q);
input clk,rst;
input s,r;
output reg q;

always @ (posedge clk or posedge rst  )begin
if (rst==1)
q=0;

else 
case({s,r})
    2'b00:q<=q;
    2'b01:q<=1'b0;
    2'b10:q<=1'b1;
    default:q<=1'bx;
	endcase
end
endmodule