module dff1bit(rst, clk, in, out);
input rst, clk, in;
output reg out;

always @(posedge rst, posedge clk)
begin
	if(rst) out<=0;
	else out<=in;
end

endmodule