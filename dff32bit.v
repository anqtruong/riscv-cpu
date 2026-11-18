module dff32bit(rst, clk, in, out);
input rst, clk;
input [31:0] in;
output reg [31:0] out;

always @(posedge rst, posedge clk)
begin
	if(rst) out<= 32'b0;
	else out <= in;
end

endmodule