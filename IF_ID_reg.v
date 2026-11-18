module IF_ID_reg(rst, clk, PC_in, flush, lock, PC_out);
input rst, clk;
input[31:0] PC_in;
input flush, lock;
output reg [31:0] PC_out;

always @(posedge rst, posedge clk)
begin
	if(rst) PC_out <= 32'b0;
	else
	begin
		if(lock==1) PC_out <= PC_out;
		else if(flush==1) PC_out <= 32'b0;
		else PC_out <= PC_in;
	end
end

endmodule