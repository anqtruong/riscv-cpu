module PC_reg(rst, clk, lock, in, out);
input rst, clk, lock;
input[31:0] in;
output reg[31:0] out;

always @(posedge rst, posedge clk)
begin
	if(rst) out <= 32'b0;
	else
	begin
		if(lock==0) out <= in;
		else out <= out;
	end
end

endmodule